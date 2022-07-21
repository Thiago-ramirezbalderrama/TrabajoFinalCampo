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
    public partial class FrmRegistrosVentas : FormAbstracto, Abstracciones.IObserverIdioma
    {
        private readonly Abstracciones.BL.IVenta _ventaBL;
        public FrmRegistrosVentas(Abstracciones.BL.IVenta ventaBL = null)
        {
            _ventaBL = ventaBL ?? new BLL.Venta();
            InitializeComponent();
        }

        private IList<Abstracciones.Entities.IVenta> ventas = new List<Abstracciones.Entities.IVenta>();
        private IList<Abstracciones.Entities.IVenta> ventasFiltradas = new List<Abstracciones.Entities.IVenta>();

        private async void FrmRegistrosVentas_Load(object sender, EventArgs e)
        {
            Program.LenguajeAdmin.AgregarObservador(this);
            await UpdateUIAsync();
            ActualizarIdioma();
        }

        public void ActualizarIdioma()
        {
            TranslateByTag(label1);
            TranslateByTag(btnCancelarVenta);
            TranslateByTag(checkBoxVendedor);
            TranslateByTag(btnVerDetalles);
            TranslateDataGridViewColumns(dataGridView1);
        }

        private async Task UpdateUIAsync()
        {
            try
            {
                progressBar1.Visible = true;
                var ventasTask = _ventaBL.GetAll();
                await Task.WhenAll(ventasTask);

                ventas = ventasFiltradas = await ventasTask;

                #region Cargar datagridview

                dataGridView1.SelectionChanged -= dataGridView1_SelectionChanged;
                dataGridView1.AutoGenerateColumns = false;
                dataGridView1.Columns.Clear();
                dataGridView1.DataSource = ventasFiltradas;
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "date",
                    DataPropertyName = "Fecha"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "price"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "seller"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "state"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "cancelled_by"
                });

                TranslateDataGridViewColumns(dataGridView1);
                dataGridView1.ClearSelection();
                dataGridView1.SelectionChanged += dataGridView1_SelectionChanged;

                #endregion Cargar datagridview

                #region Cargar combobox vendedores

                var empleados = new List<Abstracciones.Entities.IEmpleado>();
                foreach (var venta in ventas)
                {
                    if (venta.EmpleadoVendedor != null && empleados.FindIndex(empleado => empleado.DNI == venta.EmpleadoVendedor.DNI) < 0)
                    {
                        empleados.Add(venta.EmpleadoVendedor);
                    }
                }

                comboBoxVendedor.DataSource = empleados;
                comboBoxVendedor.Enabled = false;
                checkBoxVendedor.Checked = false;

                #endregion Cargar combobox vendedores

                progressBar1.Visible = false;
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                DisableControls(this);
                ShowError(ex);
            }
        }

        private async void btnCancelarVenta_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridView1.SelectedRows.Count < 1)
                {
                    SelectOneFirst();
                    return;
                }
                var Venta = (Abstracciones.Entities.IVenta)dataGridView1.SelectedRows[0].DataBoundItem;

                if (Venta.Efectuada)
                {
                    var dialogResult = MessageBox.Show(Program.LenguajeAdmin.Traducir("cancelSale_Confirmation"), "", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                    if (dialogResult.Equals(DialogResult.Yes))
                    {
                        progressBar1.Visible = true;
                        await _ventaBL.Cancelar(Venta);
                        await UpdateUIAsync();
                        MessageBox.Show(Program.LenguajeAdmin.Traducir("sale_has_been_cancelled"), "", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private void FrmRegistrosVentas_FormClosing(object sender, FormClosingEventArgs e)
        {
            Program.LenguajeAdmin.QuitarObservador(this);
        }

        private void btnVerDetalles_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count < 1)
            {
                SelectOneFirst();
                return;
            }

            var Venta = (Abstracciones.Entities.IVenta)dataGridView1.SelectedRows[0].DataBoundItem;
            Form f = new FrmDetallesVenta(Venta);
            f.ShowDialog();
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count < 1) return;
            var Venta = (Abstracciones.Entities.IVenta)dataGridView1.SelectedRows[0].DataBoundItem;

            if (Venta.Efectuada)
            {
                btnCancelarVenta.Enabled = true;
            }
            else
            {
                btnCancelarVenta.Enabled = false;
            }
            btnVerDetalles.Enabled = true;
        }

        private void dataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            var venta = (BE.Venta)dataGridView1.Rows[e.RowIndex].DataBoundItem;
            if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "price")
            {
                e.Value = "$ " + venta.Importe;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "seller")
            {
                e.Value = venta.EmpleadoVendedor.Presentacion;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "state")
            {
                if (venta.Efectuada)
                {
                    e.Value = Program.LenguajeAdmin.Traducir("completed");
                }
                else
                {
                    e.Value = Program.LenguajeAdmin.Traducir("cancelled");
                }
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "cancelled_by")
            {
                if (!venta.Efectuada)
                {
                    e.Value = venta.EmpleadoCancelacion.Presentacion;
                }
                else
                {
                    e.Value = "-";
                }
            }
        }



        private void AplicarFiltros()
        {
            ventasFiltradas = ventas;

            if (checkBoxVendedor.Checked)
            {
                ventasFiltradas = ventasFiltradas
                    .Where(venta => venta.EmpleadoVendedor.Equals((Abstracciones.Entities.IEmpleado)comboBoxVendedor.SelectedItem)).ToList();
            }

            dataGridView1.DataSource = ventasFiltradas;
        }

        private void comboBoxVendedor_SelectedIndexChanged(object sender, EventArgs e)
        {
            AplicarFiltros();
        }

        private void checkBoxVendedor_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBoxVendedor.Checked)
            {
                comboBoxVendedor.Enabled = true;
            }
            else
            {
                comboBoxVendedor.Enabled = false;
            }
            AplicarFiltros();
        }

        private void comboBoxVendedor_Format(object sender, ListControlConvertEventArgs e)
        {
            if (e.ListItem == null) return;
            var vendedor = (Abstracciones.Entities.IEmpleado)e.ListItem;
            e.Value = vendedor.Presentacion;
        }
    }
}
