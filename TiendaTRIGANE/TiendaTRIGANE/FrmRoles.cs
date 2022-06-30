using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TiendaTRIGANE
{
    public partial class FrmRoles : FormAbstracto, Abstracciones.IObserverIdioma
    {
        private readonly Abstracciones.BL.IRol _rolBL;

        public FrmRoles(Abstracciones.BL.IRol rolBL = null)
        {
            _rolBL = rolBL ?? new BLL.Rol();
            InitializeComponent();
        }

        private List<Abstracciones.Entities.IRol> roles;

        private async void FrmRoles_Load(object sender, EventArgs e)
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
                btnModificarRol.Enabled = false;
                btnEliminarRol.Enabled = false;
                roles = (List<Abstracciones.Entities.IRol>)await _rolBL.GetAll();

                #region Cargar datagridview1

                dataGridView1.SelectionChanged -= dataGridView1_SelectionChanged;
                dataGridView1.AutoGenerateColumns = false;
                dataGridView1.Columns.Clear();
                dataGridView1.DataSource = roles.AsReadOnly();
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "name",
                    DataPropertyName = "Nombre"
                });
                TranslateDataGridViewColumns(dataGridView1);
                dataGridView1.ClearSelection();
                dataGridView1.SelectionChanged += dataGridView1_SelectionChanged;

                #endregion Cargar datagridview1

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
            TranslateByTag(btnAgregarRol);
            TranslateByTag(btnModificarRol);
            TranslateByTag(btnEliminarRol);
            TranslateDataGridViewColumns(dataGridView1);
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count < 1) return;

            var Rol = (Abstracciones.Entities.IRol)dataGridView1.SelectedRows[0].DataBoundItem;
            btnModificarRol.Enabled = true;
            btnEliminarRol.Enabled = true;
            ctrlTexto2.Texto = Rol.Nombre;
        }

        private async void btnModificarRol_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridView1.SelectedRows.Count < 1)
                {
                    SelectOneFirst();
                    return;
                }

                var Rol = (Abstracciones.Entities.IRol)dataGridView1.SelectedRows[0].DataBoundItem;

                ValidateControls(ctrlTexto2);

                progressBar1.Visible = true;
                Rol.Nombre = ctrlTexto2.Texto;
                await _rolBL.Update(Rol);
                await UpdateUIAsync();
                SuccessfulUpdate();
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private async void btnEliminarRol_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridView1.SelectedRows.Count < 1)
                {
                    SelectOneFirst();
                    return;
                }

                var Rol = (Abstracciones.Entities.IRol)dataGridView1.SelectedRows[0].DataBoundItem;

                progressBar1.Visible = true;
                await _rolBL.Delete(Rol);
                await UpdateUIAsync();
                SuccessfulDeletion();
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private async void btnAgregarRol_Click(object sender, EventArgs e)
        {
            try
            {
                ValidateControls(ctrlTexto2);
                var rol = new BE.Rol
                {
                    Nombre = ctrlTexto2.Texto
                };
                await _rolBL.Create(rol);
                await UpdateUIAsync();
                SuccessfulAddition();
            }
            catch (Exception ex)
            {
                ShowError(ex);
            }
        }

        private void FrmRoles_FormClosing(object sender, FormClosingEventArgs e)
        {
            Program.LenguajeAdmin.QuitarObservador(this);
        }
    }
}
