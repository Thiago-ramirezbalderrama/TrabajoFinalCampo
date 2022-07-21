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
    public partial class FrmCategorias : FormAbstracto, Abstracciones.IObserverIdioma
    {
        private readonly Abstracciones.BL.ICategoria _categoriaBL;
        private readonly Abstracciones.BL.IProducto _productosBL;
        public FrmCategorias(Abstracciones.BL.ICategoria categoriaBL = null, Abstracciones.BL.IProducto productosBL = null)
        {
            _categoriaBL = categoriaBL ?? new BLL.Categoria();
            _productosBL = productosBL ?? new BLL.Producto();
            InitializeComponent();
        }

        private List<Abstracciones.Entities.ICategoria> categorias;
        private List<Abstracciones.Entities.IProducto> productos;

        private async void FrmCategorias_Load(object sender, EventArgs e)
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
                btnModificar.Enabled = false;
                btnEliminar.Enabled = false;
                btnVerCambios.Enabled = false;
                var categoriasTask = _categoriaBL.GetAll();
                var productosTask = _productosBL.GetAll();

                await Task.WhenAll(
                    categoriasTask,
                    productosTask
                );

                categorias = (List<Abstracciones.Entities.ICategoria>)await categoriasTask;
                productos = (List<Abstracciones.Entities.IProducto>)await productosTask;

                #region Cargar datagridview

                dataGridView1.SelectionChanged -= dataGridView1_SelectionChanged;
                dataGridView1.AutoGenerateColumns = false;
                dataGridView1.Columns.Clear();
                dataGridView1.DataSource = categorias.AsReadOnly();
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "name"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "registered_products_count"
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
                dataGridView1.SelectionChanged += dataGridView1_SelectionChanged;

                #endregion Cargar datagridview

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
            TranslateByTag(label6);
            TranslateByTag(ctrlTexto2);
            TranslateByTag(btnAgregar);
            TranslateByTag(btnModificar);
            TranslateByTag(btnEliminar);
            TranslateByTag(btnVerCambios);
            TranslateDataGridViewColumns(dataGridView1);
        }

        private async void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                ValidateControls(ctrlTexto2);

                var categoria = new BE.Categoria
                {
                    Nombre = ctrlTexto2.Texto
                };
                progressBar1.Visible = true;
                await _categoriaBL.Create(categoria);
                await UpdateUIAsync();
                SuccessfulAddition();
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private async void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridView1.SelectedRows.Count < 1)
                {
                    SelectOneFirst();
                    return;
                }
                var categoria = (Abstracciones.Entities.ICategoria)dataGridView1.SelectedRows[0].DataBoundItem;
                ValidateControls(ctrlTexto2);

                categoria.Nombre = ctrlTexto2.Texto;
                progressBar1.Visible = true;
                await _categoriaBL.Update(categoria);
                await UpdateUIAsync();
                SuccessfulUpdate();
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private async void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridView1.SelectedRows.Count < 1)
                {
                    SelectOneFirst();
                    return;
                }
                var categoria = (Abstracciones.Entities.ICategoria)dataGridView1.SelectedRows[0].DataBoundItem;

                DialogResult dialogBox = MessageBox.Show(
                    Program.LenguajeAdmin.Traducir("products_suppliers_and_pending_replenishment_requests_will_be_deleted_warning"),
                    Program.LenguajeAdmin.Traducir("warning"),
                    MessageBoxButtons.YesNo,
                    MessageBoxIcon.Warning);

                if (dialogBox == DialogResult.Yes)
                {
                    progressBar1.Visible = true;
                    await _categoriaBL.Delete(categoria);
                    await UpdateUIAsync();
                    SuccessfulDeletion();
                }
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private void FrmCategorias_FormClosing(object sender, FormClosingEventArgs e)
        {
            Program.LenguajeAdmin.QuitarObservador(this);
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count < 1) return;

            btnModificar.Enabled = true;
            btnEliminar.Enabled = true;
            btnVerCambios.Enabled = true;
            var categoria = (Abstracciones.Entities.ICategoria)dataGridView1.SelectedRows[0].DataBoundItem;
            ctrlTexto2.Texto = categoria.Nombre;
        }

        private void dataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            var categoria = (Abstracciones.Entities.ICategoria)dataGridView1.Rows[e.RowIndex].DataBoundItem;
            if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "name")
            {
                e.Value = categoria.Nombre;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "registered_products_count")
            {
                e.Value = productos.Where(producto => producto.Categoria.Equals(categoria)).ToList().Count;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "quantity_in_warehouses")
            {
                var productosCategoria = productos.Where(producto => producto.Categoria.Equals(categoria)).ToList();
                e.Value = productosCategoria.Sum(producto => producto.CantidadDepositos);
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "quantity_in_shelves")
            {
                var productosCategoria = productos.Where(producto => producto.Categoria.Equals(categoria)).ToList();
                e.Value = productosCategoria.Sum(producto => producto.CantidadExhibidores);
            }
        }

        private async void btnVerCambios_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count < 1)
            {
                SelectOneFirst();
                return;
            }

            var categoria = (Abstracciones.Entities.ICategoria)dataGridView1.SelectedRows[0].DataBoundItem;
            var cambios = await _categoriaBL.GetAllChanges(categoria);
            Form f = new FrmCategoriasCambios(cambios);
            f.ShowDialog();
        }
    }
}
