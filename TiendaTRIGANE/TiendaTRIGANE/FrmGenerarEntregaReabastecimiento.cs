using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TiendaTRIGANE
{
    public partial class FrmGenerarEntregaReabastecimiento : FormAbstracto
    {
        private readonly Abstracciones.BL.IInformeReabastecimiento _informeReabastecimientoBL;
        private readonly Abstracciones.BL.IProducto _productoBL;
        public FrmGenerarEntregaReabastecimiento(Abstracciones.Entities.IInformeReabastecimiento informeReabastecimiento,
            Abstracciones.BL.IInformeReabastecimiento informeReasbatecimientoBL = null, Abstracciones.BL.IProducto productoBL = null)
        {
            _informeReabastecimientoBL = informeReasbatecimientoBL ?? new BLL.InformeReabastecimiento();
            _productoBL = productoBL ?? new BLL.Producto();
            InformeReabastecimiento = informeReabastecimiento;
            InitializeComponent();
        }


        private readonly Abstracciones.Entities.IInformeReabastecimiento InformeReabastecimiento;
        private List<Abstracciones.Entities.IProducto> productos;
        private readonly List<Abstracciones.Entities.IDetalle> detallesInformeEntrega = new List<Abstracciones.Entities.IDetalle>();


        private void LlenarDataGridView()
        {
            dataGridView1.CellFormatting -= dataGridView1_CellFormatting;
            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.Columns.Clear();
            dataGridView1.DataSource = detallesInformeEntrega.AsReadOnly();
            dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
            {
                Tag = "product"
            });
            dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
            {
                Tag = "quantity"
            });

            dataGridView1.ClearSelection();
            dataGridView1.CellFormatting += dataGridView1_CellFormatting;
            TranslateDataGridViewColumns(dataGridView1);
        }

        private async void FrmGenerarEntregaReabastecimiento_Load(object sender, EventArgs e)
        {
            try
            {
                StartProgressBar(progressBar1);
                TranslateByTag(this);
                TranslateByTag(label1);
                TranslateByTag(label2);
                TranslateByTag(label4);
                TranslateByTag(label5);
                TranslateByTag(label6);
                TranslateByTag(btnIngresarEnLista);
                TranslateByTag(btnRemoverDeLista);
                TranslateByTag(btnGenerarEntrega);

                productos = (List<Abstracciones.Entities.IProducto>)await _productoBL.GetAll(InformeReabastecimiento.Proveedor.Categoria);
                if (productos.Count == 0)
                {
                    DisableControls(this);
                    ThereAreNoProductsFromThisCategory();
                    Close();
                    return;
                }
                comboProductos.DataSource = productos.AsReadOnly();
                comboProductos.DisplayMember = "Nombre";
                comboAceptarORechazar.Items.Add(Program.LenguajeAdmin.Traducir("accept_supplies_delivery"));
                comboAceptarORechazar.Items.Add(Program.LenguajeAdmin.Traducir("reject_supplies_delivery"));
                comboAceptarORechazar.SelectedIndex = 0;
                LlenarDataGridView();
                btnRemoverDeLista.Enabled = false;
                btnGenerarEntrega.Enabled = false;
                StopProgressBar(progressBar1);
            }
            catch (Exception ex)
            {
                StopProgressBar(progressBar1);
                DisableControls(this);
                ShowError(ex);
            }
        }

        private async void btnGenerarEntrega_Click(object sender, EventArgs e)
        {
            try
            {
                StartProgressBar(progressBar1);
                InformeReabastecimiento.EmpleadoReceptor = Servicios.SesionAdmin.GetInstance.Empleado;
                InformeReabastecimiento.FechaEntregaReal = dateTimePicker1.Value.Date + dateTimePicker2.Value.TimeOfDay;
                InformeReabastecimiento.EntregaAceptada = comboAceptarORechazar.SelectedItem.ToString() == Program.LenguajeAdmin.Traducir("accept_supplies_delivery");
                InformeReabastecimiento.ComentarioEntrega = richTextBox1.Text;
                foreach (var detalle in detallesInformeEntrega)
                {
                    InformeReabastecimiento.AgregarDetalleEntrega(detalle);
                }
                await _informeReabastecimientoBL.TerminarSolicitud(InformeReabastecimiento);
                SuccessfulAddition();
                Close();
            }
            catch (Exception ex)
            {
                StopProgressBar(progressBar1);
                ShowError(ex);
            }
        }

        private void btnIngresarEnLista_Click(object sender, EventArgs e)
        {
            if (comboProductos.SelectedItem != null && numCantidad.Value > 0)
            {
                var producto = (Abstracciones.Entities.IProducto)comboProductos.SelectedItem;
                var detalleExistente = detallesInformeEntrega.Find(item => item.Producto.Equals(producto));
                var cantidad = (int)numCantidad.Value;
                if (detalleExistente == null)
                {
                    var detalleVenta = new BE.Detalle(producto)
                    {
                        Cantidad = cantidad
                    };
                    detallesInformeEntrega.Add(detalleVenta);
                }
                else
                {
                    detalleExistente.Cantidad += cantidad;
                }
                numCantidad.Value = 1;
                btnGenerarEntrega.Enabled = true;
                btnRemoverDeLista.Enabled = true;
                LlenarDataGridView();
            }
        }

        private void btnRemoverDeLista_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count < 1)
            {
                SelectOneFirst();
                return;
            }

            var detalleSolicitud = (Abstracciones.Entities.IDetalle)dataGridView1.SelectedRows[0].DataBoundItem;
            var producto = detalleSolicitud.Producto;
            var detalle = detallesInformeEntrega.Find(item => item.Producto.Equals(producto));
            detallesInformeEntrega.Remove(detalle);
            LlenarDataGridView();
            numCantidad.Value = 1;
            if (detallesInformeEntrega.Count == 0)
            {
                btnRemoverDeLista.Enabled = false;
                btnGenerarEntrega.Enabled = false;
            }
        }

        private void comboAceptarORechazar_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboAceptarORechazar.SelectedItem.ToString() == Program.LenguajeAdmin.Traducir("accept_supplies_delivery"))
            {
                dataGridView1.Visible = true;
                numCantidad.Visible = true;
                btnIngresarEnLista.Visible = true;
                btnRemoverDeLista.Visible = true;
                label4.Visible = true;
                label5.Visible = true;
                label6.Visible = true;
                Size = new Size(632, 631);
                btnGenerarEntrega.Location = new Point(10, 550);
                btnGenerarEntrega.Enabled = false;
            }
            else
            {
                dataGridView1.Visible = false;
                numCantidad.Visible = false;
                btnIngresarEnLista.Visible = false;
                btnRemoverDeLista.Visible = false;
                label4.Visible = false;
                label5.Visible = false;
                label6.Visible = false;
                Size = new Size(632, 303);
                btnGenerarEntrega.Location = new Point(10, 222);
                btnGenerarEntrega.Enabled = true;
            }
        }

        private void comboProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            numCantidad.Value = 1;
        }

        private void dataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            if (dataGridView1.Rows.Count < 1) return;
            var detalle = (Abstracciones.Entities.IDetalle)dataGridView1.Rows[e.RowIndex].DataBoundItem;
            if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "product")
            {
                e.Value = detalle.Producto.Nombre;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "quantity")
            {
                e.Value = detalle.Cantidad;
            }
        }
    }
}
