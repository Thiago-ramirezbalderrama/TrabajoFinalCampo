using System;
using System.Collections.Generic;
using Abstracciones.Entities;
using System.Windows.Forms;

namespace TiendaTRIGANE
{
    public partial class FrmGenerarSolicitudReabastecimiento : FormAbstracto
    {
        private readonly Abstracciones.BL.IInformeReabastecimiento _informeReabastecimientoBL;
        private readonly Abstracciones.BL.IProveedor _proveedorBL;
        private readonly Abstracciones.BL.IProducto _productoBL;
        public FrmGenerarSolicitudReabastecimiento(Abstracciones.BL.IInformeReabastecimiento informeReabastecimientoBL = null,
            Abstracciones.BL.IProveedor proveedorBL = null,
            Abstracciones.BL.IProducto productoBL = null)
        {
            _informeReabastecimientoBL = informeReabastecimientoBL ?? new BLL.InformeReabastecimiento();
            _productoBL = productoBL ?? new BLL.Producto();
            _proveedorBL = proveedorBL ?? new BLL.Proveedor();
            InitializeComponent();
        }


        private List<IProducto> productos;
        private readonly List<IDetalle> detallesSolicitudReabastecimiento = new List<IDetalle>();
        private List<IProveedor> proveedores;

        private void LlenarDataGridView()
        {
            dataGridView1.CellFormatting -= dataGridView1_CellFormatting;
            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.Columns.Clear();
            dataGridView1.DataSource = detallesSolicitudReabastecimiento.AsReadOnly();
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

        private async void FrmGenerarSolicitudReabastecimiento_Load(object sender, EventArgs e)
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
                TranslateByTag(label7);
                TranslateByTag(btnIngresarEnLista);
                TranslateByTag(btnRemoverDeLista);
                TranslateByTag(btnSolicitar);

                proveedores = (List<IProveedor>)await _proveedorBL.GetAll();
                if (proveedores.Count == 0)
                {
                    ThereAreNoSuppliers();
                    DisableControls(this);
                    Close();
                    return;
                }
                comboProveedores.DataSource = proveedores.AsReadOnly();
                LlenarDataGridView();
                btnSolicitar.Enabled = false;
                btnRemoverDeLista.Enabled = false;
            }
            catch (Exception ex)
            {
                StopProgressBar(progressBar1);
                DisableControls(this);
                ShowError(ex);
            }
        }

        private void btnIngresarEnLista_Click(object sender, EventArgs e)
        {
            if (comboProductos.SelectedItem == null || numCantidad.Value < 1)
            {
                SelectOneFirst();
                return;
            }

            var producto = (IProducto)comboProductos.SelectedItem;
            var detalleExistente = detallesSolicitudReabastecimiento.Find(item => item.Producto.Equals(producto));
            var cantidad = (int)numCantidad.Value;
            if (detalleExistente == null)
            {
                var detalleVenta = new BE.Detalle(producto)
                {
                    Cantidad = cantidad
                };
                detallesSolicitudReabastecimiento.Add(detalleVenta);
            }
            else
            {
                detalleExistente.Cantidad += cantidad;
            }
            numCantidad.Value = 1;
            btnSolicitar.Enabled = true;
            btnRemoverDeLista.Enabled = true;
            LlenarDataGridView();
        }

        private void btnRemoverDeLista_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count < 1)
            {
                SelectOneFirst();
                return;
            }

            var detalleSolicitud = (IDetalle)dataGridView1.SelectedRows[0].DataBoundItem;
            var producto = detalleSolicitud.Producto;
            var detalle = detallesSolicitudReabastecimiento.Find(item => item.Producto.Equals(producto));
            detallesSolicitudReabastecimiento.Remove(detalle);
            LlenarDataGridView();
            numCantidad.Value = 1;
            if (detallesSolicitudReabastecimiento.Count == 0)
            {
                btnRemoverDeLista.Enabled = false;
                btnSolicitar.Enabled = false;
            }
        }

        private void comboProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            numCantidad.Value = 1;
        }

        private async void comboProveedores_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboProveedores.SelectedItem == null)
            {
                SelectOneFirst();
                btnSolicitar.Enabled = false;
                return;
            }

            StartProgressBar(progressBar1);
            //dataGridView1.CellFormatting -= dataGridView1_CellFormatting;
            detallesSolicitudReabastecimiento.Clear();
            LlenarDataGridView();
            //dataGridView1.CellFormatting += dataGridView1_CellFormatting;
            btnSolicitar.Enabled = true;
            var proveedor = (IProveedor)comboProveedores.SelectedItem;
            comboProductos.DataSource = null;
            productos = (List<IProducto>)await _productoBL.GetAll(proveedor.Categoria);
            if (productos.Count == 0)
            {
                comboProductos.Enabled = false;
                btnIngresarEnLista.Enabled = false;
                btnRemoverDeLista.Enabled = false;
                btnSolicitar.Enabled = false;
                ThereAreNoProductsFromThisCategory();
            }
            else
            {
                comboProductos.Enabled = true;
                btnIngresarEnLista.Enabled = true;
                btnRemoverDeLista.Enabled = true;
                btnSolicitar.Enabled = true;
            }
            comboProductos.DataSource = productos.AsReadOnly();
            comboProductos.DisplayMember = "Nombre";
            StopProgressBar(progressBar1);
        }

        private void comboProveedores_Format(object sender, ListControlConvertEventArgs e)
        {
            if (e.ListItem != null)
            {
                var proveedor = (IProveedor)e.ListItem;
                e.Value = $"{proveedor.Presentacion} ({proveedor.Categoria.Nombre})";
            }
        }

        private void dataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            if (dataGridView1.Rows.Count < 1) return;
            var detalle = (IDetalle)dataGridView1.Rows[e.RowIndex].DataBoundItem;
            if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "product")
            {
                e.Value = detalle.Producto.Nombre;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "quantity")
            {
                e.Value = detalle.Cantidad;
            }
        }

        private async void btnSolicitar_Click(object sender, EventArgs e)
        {
            try
            {
                if (comboProveedores.SelectedItem == null || detallesSolicitudReabastecimiento.Count < 1)
                {
                    SelectOneFirst();
                    return;
                }

                var informe = new BE.InformeReabastecimiento((IProveedor)comboProveedores.SelectedItem,
                    Servicios.SesionAdmin.GetInstance.Empleado)
                {
                    FechaSolicitud = DateTime.Now,
                    FechaEntregaAcordada = dateTimePicker1.Value.Date + dateTimePicker2.Value.TimeOfDay,
                    ComentarioSolicitud = richTextBox1.Text
                };
                StartProgressBar(progressBar1);
                await _informeReabastecimientoBL.CrearSolicitud(informe, detallesSolicitudReabastecimiento);
                StopProgressBar(progressBar1);
                SuccessfulAddition();
                Close();
            }
            catch (Exception ex)
            {
                StopProgressBar(progressBar1);
                ShowError(ex);
            }
        }
    }
}
