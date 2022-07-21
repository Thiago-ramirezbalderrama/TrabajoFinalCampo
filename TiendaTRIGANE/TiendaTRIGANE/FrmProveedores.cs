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
    public partial class FrmProveedores : FormAbstracto, Abstracciones.IObserverIdioma
    {
        private readonly Abstracciones.BL.IProveedor _proveedorBL;
        private readonly Abstracciones.BL.ICategoria _categoriaBL;
        public FrmProveedores(Abstracciones.BL.IProveedor proveedorBL = null, Abstracciones.BL.ICategoria categoriaBL = null)
        {
            _proveedorBL = proveedorBL ?? new BLL.Proveedor();
            _categoriaBL = categoriaBL ?? new BLL.Categoria();
            InitializeComponent();
        }

        private List<Abstracciones.Entities.IProveedor> proveedores;
        private List<Abstracciones.Entities.ICategoria> categorias;

        private async void FrmProveedores_Load(object sender, EventArgs e)
        {
            Program.LenguajeAdmin.AgregarObservador(this);
            await UpdateUIAsync();
            ActualizarIdioma();
        }



        public void ActualizarIdioma()
        {
            TranslateByTag(label1);
            TranslateByTag(label2);
            TranslateByTag(label3);
            TranslateByTag(btnAgregar);
            TranslateByTag(btnModificar);
            TranslateByTag(btnEliminar);
            TranslateByTag(ctrlTexto1);
            TranslateByTag(ctrlTexto2);
            TranslateByTag(ctrlTexto4);
            TranslateByTag(ctrlNum1);
            TranslateByTag(ctrlTexto1);
            TranslateDataGridViewColumns(dataGridView1);
        }

        private async Task UpdateUIAsync()
        {
            try
            {
                progressBar1.Visible = true;
                var categoriasTask = _categoriaBL.GetAll();
                var proveedoresTask = _proveedorBL.GetAll();

                await Task.WhenAll(categoriasTask, proveedoresTask);

                comboBox1.DataSource = null;
                categorias = (List<Abstracciones.Entities.ICategoria>)await categoriasTask;
                proveedores = (List<Abstracciones.Entities.IProveedor>)await proveedoresTask;

                if (categorias.Count == 0)
                {
                    DisableControls(this);
                    EnterProductCategoriesFirst();
                    return;
                }
                comboBox1.DataSource = categorias.AsReadOnly();

                comboBox1.DisplayMember = "Nombre";
                if (comboBox1.Items.Count == 0)
                {
                    comboBox1.Enabled = false;
                }
                btnModificar.Enabled = false;
                btnEliminar.Enabled = false;

                #region Cargar datagridview

                dataGridView1.SelectionChanged -= dataGridView1_SelectionChanged;
                dataGridView1.AutoGenerateColumns = false;
                dataGridView1.Columns.Clear();
                dataGridView1.DataSource = proveedores.AsReadOnly();
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "dni"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "name"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "surname"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "category"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "email"
                });
                TranslateDataGridViewColumns(dataGridView1);
                dataGridView1.ClearSelection();
                dataGridView1.SelectionChanged += dataGridView1_SelectionChanged;

                #endregion Cargar datagridview

                ctrlTexto1.Texto = "";
                ctrlTexto2.Texto = "";
                ctrlNum1.Texto = "";
                ctrlTexto4.Texto = "";
                progressBar1.Visible = false;
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                DisableControls(this);
                ShowError(ex);
            }
        }

        private async void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                if (comboBox1.SelectedItem == null)
                {
                    SelectOneFirst();
                    return;
                }

                ValidateControls(Controls);

                progressBar1.Visible = true;
                var proveedor = new BE.Proveedor((Abstracciones.Entities.ICategoria)comboBox1.SelectedItem)
                {
                    DNI = int.Parse(ctrlNum1.Texto),
                    Nombre = ctrlTexto1.Texto,
                    Apellido = ctrlTexto2.Texto,
                    FechaNacimiento = dateTimePicker1.Value.Date,
                    Email = ctrlTexto4.Texto
                };
                await _proveedorBL.Create(proveedor);
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
                var proveedor = (Abstracciones.Entities.IProveedor)dataGridView1.SelectedRows[0].DataBoundItem;

                ValidateControls(Controls);

                progressBar1.Visible = true;
                proveedor.Nombre = ctrlTexto1.Texto;
                proveedor.Apellido = ctrlTexto2.Texto;
                proveedor.Categoria = (BE.Categoria)comboBox1.SelectedItem;
                proveedor.Email = ctrlTexto4.Texto;
                proveedor.FechaNacimiento = dateTimePicker1.Value.Date;
                await _proveedorBL.Update(proveedor);
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
                var proveedor = (Abstracciones.Entities.IProveedor)dataGridView1.SelectedRows[0].DataBoundItem;

                progressBar1.Visible = true;
                await _proveedorBL.Delete(proveedor);
                await UpdateUIAsync();
                SuccessfulDeletion();
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private void FrmProveedores_FormClosing(object sender, FormClosingEventArgs e)
        {
            Program.LenguajeAdmin.QuitarObservador(this);
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count < 1) return;

            btnModificar.Enabled = true;
            btnEliminar.Enabled = true;
            var proveedor = (Abstracciones.Entities.IProveedor)dataGridView1.SelectedRows[0].DataBoundItem;
            ctrlTexto1.Texto = proveedor.Nombre.ToString();
            ctrlTexto2.Texto = proveedor.Apellido.ToString();
            ctrlTexto4.Texto = proveedor.Email.ToString();
            ctrlNum1.Texto = proveedor.DNI.ToString();
            dateTimePicker1.Value = proveedor.FechaNacimiento;
            foreach (Abstracciones.Entities.ICategoria item in comboBox1.Items)
            {
                if (item.Equals(proveedor.Categoria))
                {
                    comboBox1.SelectedItem = item;
                }
            }
        }

        private void dataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            var proveedor = (Abstracciones.Entities.IProveedor)dataGridView1.Rows[e.RowIndex].DataBoundItem;
            if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "category")
            {
                e.Value = proveedor.Categoria.Nombre;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "name")
            {
                e.Value = proveedor.Nombre;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "surname")
            {
                e.Value = proveedor.Apellido;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "dni")
            {
                e.Value = proveedor.DNI;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "email")
            {
                e.Value = proveedor.Email;
            }
        }
    }
}
