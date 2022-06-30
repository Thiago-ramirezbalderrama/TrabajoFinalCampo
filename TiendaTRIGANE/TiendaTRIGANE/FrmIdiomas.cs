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
    public partial class FrmIdiomas : FormAbstracto, Abstracciones.IObserverIdioma
    {
        private readonly Abstracciones.BL.Traductor.IIdioma _idiomaBL;

        public FrmIdiomas(Abstracciones.BL.Traductor.IIdioma idiomaBL = null)
        {
            _idiomaBL = idiomaBL ?? new BLL.Idioma();
            InitializeComponent();
        }

        private List<Abstracciones.Entities.Traductor.IIdioma> idiomas;

        private async void FrmIdiomas_Load(object sender, EventArgs e)
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
                idiomas = (List<Abstracciones.Entities.Traductor.IIdioma>)await _idiomaBL.GetAll();
                btnMostrarDefault.Enabled = false;

                #region Cargar datagridviewIdiomas

                dataGridViewIdiomas.SelectionChanged -= dataGridViewIdiomas_SelectionChanged;
                dataGridViewIdiomas.AutoGenerateColumns = false;
                dataGridViewIdiomas.Columns.Clear();
                dataGridViewIdiomas.DataSource = idiomas.AsReadOnly();
                dataGridViewIdiomas.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "name"
                });
                dataGridViewIdiomas.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "enabled",
                });
                dataGridViewIdiomas.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "default",
                });
                TranslateDataGridViewColumns(dataGridViewIdiomas);
                dataGridViewIdiomas.ClearSelection();
                dataGridViewIdiomas.SelectionChanged += dataGridViewIdiomas_SelectionChanged;

                #endregion Cargar datagridviewIdiomas

                ctrlTexto1.Texto = "";
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
            TranslateByTag(ctrlTexto1);
            TranslateByTag(btnCrearNuevoIdioma);
            TranslateByTag(btnMostrarDefault);
            TranslateByTag(btnHabilitar);
            TranslateByTag(btnDeshabilitar);
            TranslateDataGridViewColumns(dataGridViewIdiomas);
        }

        private async void btnMostrarDefault_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridViewIdiomas.SelectedRows.Count < 1)
                {
                    SelectOneFirst();
                    return;
                }

                var idioma = (Abstracciones.Entities.Traductor.IIdioma)dataGridViewIdiomas.SelectedRows[0].DataBoundItem;
                if (idioma == null)
                {
                    SelectOneFirst();
                    return;
                }
                progressBar1.Visible = true;
                await _idiomaBL.MostrarPorDefecto(idioma);
                await UpdateUIAsync();
                SuccessfulUpdate();
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }



        private async void btnHabilitar_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridViewIdiomas.SelectedRows.Count < 1)
                {
                    SelectOneFirst();
                    return;
                }
                var idioma = (Abstracciones.Entities.Traductor.IIdioma)dataGridViewIdiomas.SelectedRows[0].DataBoundItem;

                idioma.Habilitado = true;
                progressBar1.Visible = true;
                await _idiomaBL.UpdateHabilitado(idioma);
                await UpdateUIAsync();
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private async void btnDeshabilitar_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridViewIdiomas.SelectedRows.Count < 1)
                {
                    SelectOneFirst();
                    return;
                }
                var idioma = (Abstracciones.Entities.Traductor.IIdioma)dataGridViewIdiomas.SelectedRows[0].DataBoundItem;
                idioma.Habilitado = false;
                progressBar1.Visible = true;
                await _idiomaBL.UpdateHabilitado(idioma);
                await UpdateUIAsync();
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private void dataGridViewIdiomas_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            var idioma = (Abstracciones.Entities.Traductor.IIdioma)dataGridViewIdiomas.Rows[e.RowIndex].DataBoundItem;
            if (dataGridViewIdiomas.Columns[e.ColumnIndex].Tag.ToString() == "name")
            {
                e.Value = idioma.Nombre;
            }
            else if (dataGridViewIdiomas.Columns[e.ColumnIndex].Tag.ToString() == "enabled")
            {
                if (idioma.Habilitado)
                {
                    e.Value = Program.LenguajeAdmin.Traducir("yes");
                }
                else
                {
                    e.Value = Program.LenguajeAdmin.Traducir("no");
                }
            }
            else if (dataGridViewIdiomas.Columns[e.ColumnIndex].Tag.ToString() == "default")
            {
                if (idioma.MostrarPorDefecto)
                {
                    e.Value = Program.LenguajeAdmin.Traducir("yes");
                }
                else
                {
                    e.Value = Program.LenguajeAdmin.Traducir("no");
                }
            }
        }

        private async void btnCrearNuevoIdioma_Click(object sender, EventArgs e)
        {
            try
            {
                var idioma = new BE.Idioma
                {
                    Nombre = ctrlTexto1.Texto
                };

                progressBar1.Visible = true;
                await _idiomaBL.Create(idioma);
                await UpdateUIAsync();
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private void FrmIdiomas_FormClosing(object sender, FormClosingEventArgs e)
        {
            Program.LenguajeAdmin.QuitarObservador(this);
        }

        private void dataGridViewIdiomas_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridViewIdiomas.SelectedRows.Count < 1) return;
            var idioma = (Abstracciones.Entities.Traductor.IIdioma)dataGridViewIdiomas.SelectedRows[0].DataBoundItem;

            if (idioma.MostrarPorDefecto)
            {
                btnMostrarDefault.Enabled = false;
            }
            else
            {
                btnMostrarDefault.Enabled = true;
            }

            if (idioma.Habilitado)
            {
                btnDeshabilitar.Enabled = true;
                btnHabilitar.Enabled = false;
            }
            else
            {
                btnDeshabilitar.Enabled = false;
                btnHabilitar.Enabled = true;
            }
        }
    }
}
