using System;
using System.Collections.Generic;
using BE;
using System.Threading.Tasks;
using System.Windows.Forms;
using Abstracciones.Entities;

namespace TiendaTRIGANE
{
    public partial class FrmRealizarVenta : FormAbstracto, Abstracciones.IObserverIdioma
    {
        private readonly Abstracciones.BL.IVenta _ventaBL;
        private readonly Abstracciones.BL.IProducto _productoBL;
        public FrmRealizarVenta(Abstracciones.BL.IVenta ventaBL = null, Abstracciones.BL.IProducto productoBL = null)
        {
            _ventaBL = ventaBL ?? new BLL.Venta();
            _productoBL = productoBL ?? new BLL.Producto();
            InitializeComponent();
        }

        private List<IProducto> productos;
        private List<IProducto> productosComboBox = new List<IProducto>();
        private List<IDetalleVenta> detallesVenta;

        private async void FrmRealizarVenta_Load(object sender, EventArgs e)
        {
            Program.LenguajeAdmin.AgregarObservador(this);
            await UpdateUIAsync();
            ActualizarIdioma();
        }



        private async Task UpdateUIAsync()
        {
            try
            {
                progressBar1.Visible = true;
                dataGridView1.DataSource = null;
                detallesVenta = new List<IDetalleVenta>();

                var productosTask = _productoBL.GetAllInShelves();

                await Task.WhenAll(
                    productosTask
                );

                productos = (List<IProducto>)await productosTask;
                if (productos.Count == 0)
                {
                    progressBar1.Visible = false;
                    DisableControls(this);
                    ThereAreNoProductsInShelves();
                    return;
                }
                LlenarComboProductos(productos);
                LlenarDataGridView();
                btnRealizarVenta.Enabled = false;
                progressBar1.Visible = false;
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                DisableControls(this);
                ShowError(ex);
            }
        }

        public void ActualizarIdioma()
        {
            TranslateByTag(label1);
            TranslateByTag(label2);
            TranslateByTag(label3);
            TranslateByTag(label4);
            TranslateByTag(btnAgregarProductosALista);
            TranslateByTag(btnRemoverDeLaLista);
            TranslateByTag(btnRealizarVenta);
            TranslateByTag(btnRealizarVenta);
            TranslateDataGridViewColumns(dataGridView1);
        }

        private void LlenarDataGridView()
        {
            dataGridView1.CellFormatting -= dataGridView1_CellFormatting;
            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.Columns.Clear();
            dataGridView1.DataSource = detallesVenta.AsReadOnly();
            dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
            {
                Tag = "product"
            });
            dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
            {
                Tag = "quantity",
            });
            dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
            {
                Tag = "price",
            });
            TranslateDataGridViewColumns(dataGridView1);

            dataGridView1.ClearSelection();
            var importe = 0.00;
            foreach (var detalleVenta in detallesVenta)
            {
                var ImporteDelDetalle = _ventaBL.CalcularImportePorProducto(detalleVenta.Producto, detalleVenta.Cantidad);
                detalleVenta.Importe = ImporteDelDetalle;
                importe += ImporteDelDetalle;
            }
            label5.Text = $"$ {importe}";
            dataGridView1.CellFormatting += dataGridView1_CellFormatting;
        }

        private void LlenarComboProductos(List<IProducto> productos)
        {
            comboProductos.DataSource = productos.AsReadOnly();
            productosComboBox = productos;
        }

        private async void btnRealizarVenta_Click(object sender, EventArgs e)
        {
            try
            {
                ValidateControls(Controls);

                var dialogResult = MessageBox.Show(Program.LenguajeAdmin.Traducir("makeSale_Confirmation"), "", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                if (dialogResult.Equals(DialogResult.Yes))
                {
                    IVenta venta = new Venta((IEmpleado)Servicios.SesionAdmin.GetInstance.Empleado);
                    foreach (DetalleVenta detalle in detallesVenta)
                    {
                        venta.AgregarDetalle(detalle);
                    }
                    progressBar1.Visible = true;
                    await _ventaBL.Realizar(venta, detallesVenta);
                    await UpdateUIAsync();
                    MessageBox.Show(Program.LenguajeAdmin.Traducir("sale_has_been_made"), "", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private void comboProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboProductos.SelectedItem != null)
            {
                //numCantidad.Maximum = ((IProducto)comboProductos.SelectedItem).CantidadGondolas;
                //numCantidad.Value = 1;
                //btnAgregarProductosALista.Enabled = true;
                var cantidad = ((IProducto)comboProductos.SelectedItem).CantidadExhibidores;
                if (cantidad > 0)
                {
                    numCantidad.Maximum = cantidad;
                    numCantidad.Value = 1;
                    btnAgregarProductosALista.Enabled = true;
                }
                else
                {
                    numCantidad.Maximum = cantidad;
                    numCantidad.Value = 0;
                    btnAgregarProductosALista.Enabled = false;
                }
            }
        }

        private void btnAgregarProductosALista_Click(object sender, EventArgs e)
        {
            if (comboProductos.SelectedItem != null && numCantidad.Value > 0)
            {
                var producto = (IProducto)comboProductos.SelectedItem;
                var detalleExistente = detallesVenta.Find(item => item.Producto.Equals(producto));
                var cantidad = (int)numCantidad.Value;
                if (detalleExistente == null)
                {
                    var detalleVenta = new DetalleVenta(producto)
                    {
                        Cantidad = cantidad,
                        Importe = _ventaBL.CalcularImportePorProducto(producto, cantidad)
                    };
                    productosComboBox[productosComboBox.FindIndex(item => item.Equals(producto))] = producto;
                    detallesVenta.Add(detalleVenta);
                }
                else
                {
                    detalleExistente.Cantidad += cantidad;
                }
                producto.CantidadExhibidores -= cantidad;
                productosComboBox[productosComboBox.FindIndex(item => item.Equals(producto))] = producto;
                btnRealizarVenta.Enabled = true;
                LlenarComboProductos(productosComboBox);
                LlenarDataGridView();
            }
        }

        private void FrmRealizarVenta_FormClosing(object sender, FormClosingEventArgs e)
        {
            Program.LenguajeAdmin.QuitarObservador(this);
        }

        private void btnRemoverDeLaLista_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count < 1)
            {
                SelectOneFirst();
                return;
            }

            var detalleVenta = (IDetalleVenta)dataGridView1.SelectedRows[0].DataBoundItem;
            var producto = detalleVenta.Producto;
            var detalle = detallesVenta.Find(item => item.Producto.Equals(producto));
            detallesVenta.Remove(detalle);
            producto.CantidadExhibidores += detalle.Cantidad;
            productosComboBox[productosComboBox.FindIndex(item => item.Equals(producto))] = producto;
            LlenarComboProductos(productosComboBox);
            LlenarDataGridView();
        }

        private void dataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            var detalleVenta = (DetalleVenta)dataGridView1.Rows[e.RowIndex].DataBoundItem;
            if (detalleVenta == null) return;

            if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "product")
            {
                e.Value = detalleVenta.Producto.Nombre;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "quantity")
            {
                e.Value = detalleVenta.Cantidad;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "price")
            {
                e.Value = $"$ {detalleVenta.Importe}";
            }
        }

        private void comboProductos_Format(object sender, ListControlConvertEventArgs e)
        {
            if (e.ListItem == null) return;
            var producto = (IProducto)e.ListItem;
            e.Value = $"{producto.Nombre} ($ {producto.PrecioUnitario}, stock: {producto.CantidadExhibidores})";
        }
    }
}
