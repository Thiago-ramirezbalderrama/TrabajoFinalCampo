using System;
using System.Collections.Generic;
using System.Drawing;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TiendaTRIGANE
{
    public partial class FrmProductos : FormAbstracto, Abstracciones.IObserverIdioma
    {

        private readonly Abstracciones.BL.IProducto _productoBL;
        private readonly Abstracciones.BL.ICategoria _categoriaBL;

        public FrmProductos(Abstracciones.BL.IProducto productoBL = null, Abstracciones.BL.ICategoria categoriaBL = null)
        {
            _productoBL = productoBL ?? new BLL.Producto();
            _categoriaBL = categoriaBL ?? new BLL.Categoria();
            InitializeComponent();
        }

        private List<Abstracciones.Entities.IProducto> productos;
        private List<Abstracciones.Entities.ICategoria> categorias;

        private void FrmProductos_Load(object sender, EventArgs e)
        {
            Program.LenguajeAdmin.AgregarObservador(this);
            await UpdateUIAsync();
            ActualizarIdioma();
        }


        public void ActualizarIdioma()
        {
            TranslateByTag(label1);
            TranslateByTag(ctrlTexto1);
            TranslateByTag(label4);
            TranslateByTag(label3);
            TranslateByTag(label5);
            TranslateByTag(btnAgregar);
            TranslateByTag(btnModificar);
            TranslateByTag(btnModificarAdvertencia);
            TranslateByTag(btnEliminar);
            TranslateDataGridViewColumns(dataGridView1);
        }

        private async Task UpdateUIAsync()
        {
            try
            {
                progressBar1.Visible = true;
                var categoriasTask = _categoriaBL.GetAll();
                var productosTask = _productoBL.GetAll();

                await Task.WhenAll(categoriasTask, productosTask);

                categorias = (List<Abstracciones.Entities.ICategoria>)await categoriasTask;
                productos = (List<Abstracciones.Entities.IProducto>)await productosTask;
                if (categorias.Count == 0)
                {
                    DisableControls(this);
                    EnterProductCategoriesFirst();
                    return;
                }

                comboCategorias.DataSource = null;
                comboCategorias.DataSource = categorias.AsReadOnly();
                comboCategorias.DisplayMember = "Nombre";
                if (comboCategorias.Items.Count == 0)
                {
                    comboCategorias.Enabled = false;
                }

                #region Cargar datagridview

                dataGridView1.SelectionChanged -= DataGridView1_SelectionChanged;
                dataGridView1.AutoGenerateColumns = false;
                dataGridView1.Columns.Clear();
                dataGridView1.DataSource = productos.AsReadOnly();
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "name"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "unit_price"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "category"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "quantity"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "quantity_in_warehouses"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "quantity_in_shelves"
                });
                TranslateDataGridViewColumns(dataGridView1);
                dataGridView1.ClearSelection();
                dataGridView1.SelectionChanged += DataGridView1_SelectionChanged;

                #endregion Cargar datagridview

                ctrlTexto1.Texto = "";
                numPrecioUnitario.Value = 0;
                progressBar1.Visible = false;
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                DisableControls(this);
                ShowError(ex);
            }
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count < 1) return;

            btnModificar.Enabled = true;
            btnEliminar.Enabled = true;
            var producto = (Abstracciones.Entities.IProducto)dataGridView1.SelectedRows[0].DataBoundItem;
            ctrlTexto1.Texto = producto.Nombre;
            numPrecioUnitario.Value = (decimal)producto.PrecioUnitario;
            numAdvertencia.Value = (decimal)producto.AdvertenciaBajoStock;
            foreach (Abstracciones.Entities.ICategoria categoria in comboCategorias.Items)
            {
                if (categoria.Equals(producto.Categoria))
                {
                    comboCategorias.SelectedItem = categoria;
                }
            }
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                ValidateControls(Controls);
                if (comboCategorias.SelectedItem == null)
                {
                    SelectOneFirst();
                    return;
                }

                var producto = new BE.Producto((Abstracciones.Entities.ICategoria)comboCategorias.SelectedItem)
                {
                    Nombre = ctrlTexto1.Texto,
                    PrecioUnitario = (double)numPrecioUnitario.Value
                };

                progressBar1.Visible = true;
                await _productoBL.Create(producto);
                await UpdateUIAsync();
                SuccessfulAddition();
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridView1.SelectedRows.Count < 1)
                {
                    SelectOneFirst();
                    return;
                }
                var producto = (Abstractions.Entities.IProducto)dataGridView1.SelectedRows[0].DataBoundItem;

                progressBar1.Visible = true;
                await _productoBL.Delete(producto);
                await UpdateUIAsync();
                SuccessfulDeletion();
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridView1.SelectedRows.Count < 1 || comboCategorias.SelectedItem == null)
                {
                    SelectOneFirst();
                    return;
                }
                var producto = (Abstractions.Entities.IProducto)dataGridView1.SelectedRows[0].DataBoundItem;

                ValidateControls(Controls);
                producto.Nombre = ctrlTexto1.Texto;
                producto.PrecioUnitario = (double)numPrecioUnitario.Value;
                producto.Categoria = (Abstractions.Entities.ICategoria)comboCategorias.SelectedItem;

                progressBar1.Visible = true;
                await _productoBL.Update(producto);
                await UpdateUIAsync();
                SuccessfulUpdate();
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private void FrmProductos_FormClosing(object sender, FormClosingEventArgs e)
        {
            Program.LanguageManager.QuitarObservador(this);
        }


        private void dataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            var producto = (Abstractions.Entities.IProducto)dataGridView1.Rows[e.RowIndex].DataBoundItem;
            if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "name")
            {
                e.Value = producto.Nombre;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "unit_price")
            {
                e.Value = "$" + producto.PrecioUnitario;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "category")
            {
                e.Value = producto.Categoria.Nombre;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "quantity")
            {
                int cantidadTotal = producto.CantidadAlmacenes + producto.CantidadGondolas;
                e.Value = cantidadTotal;
                if (cantidadTotal <= producto.AdvertenciaBajoStock)
                {
                    dataGridView1.Rows[e.RowIndex].Cells[e.ColumnIndex].Style.BackColor = Color.Red;
                    dataGridView1.Rows[e.RowIndex].Cells[e.ColumnIndex].Style.ForeColor = Color.White;
                }
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "quantity_in_warehouses")
            {
                e.Value = producto.CantidadAlmacenes;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "quantity_in_shelves")
            {
                e.Value = producto.CantidadGondolas;
            }
        }

        private void btnModificarAdvertencia_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridView1.SelectedRows.Count < 1)
                {
                    SelectOneFirst();
                    return;
                }
                var producto = (Abstractions.Entities.IProducto)dataGridView1.SelectedRows[0].DataBoundItem;
                progressBar1.Visible = true;
                await _productoBL.UpdateLowStockWarning(producto, int.Parse(numAdvertencia.Value.ToString()));
                await UpdateUIAsync();
                SuccessfulUpdate();
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }
    }
}
