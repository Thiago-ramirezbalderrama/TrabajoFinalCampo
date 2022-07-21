using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TiendaTRIGANE
{
    public partial class FrmTraducciones : FormAbstracto, Abstracciones.IObserverIdioma
    {
        private readonly Abstracciones.BL.Traductor.IIdioma _idiomaBL;
        private readonly Abstracciones.BL.Traductor.IPalabra _palabraBL;
        private readonly Abstracciones.BL.Traductor.ITraduccion _traduccionBL;

        public FrmTraducciones(Abstracciones.BL.Traductor.IIdioma idiomaBL = null,
            Abstracciones.BL.Traductor.IPalabra palabraBL = null,
            Abstracciones.BL.Traductor.ITraduccion traduccionBL = null)
        {
            _idiomaBL = idiomaBL ?? new BLL.Idioma();
            _palabraBL = palabraBL ?? new BLL.Palabra();
            _traduccionBL = traduccionBL ?? new BLL.Traduccion();
            InitializeComponent();
        }

        private IList<Abstracciones.Entities.Traductor.IIdioma> idiomas;
        private IList<Abstracciones.Entities.Traductor.IPalabra> palabras;
        private IList<Abstracciones.Entities.Traductor.ITraduccion> traducciones;

        private async void FrmTraducciones_Load(object sender, EventArgs e)
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
                var idiomasTask = _idiomaBL.GetAll();
                var traduccionesTask = _traduccionBL.GetAllFromLanguages();
                var palabrasTask = _palabraBL.GetAll();

                await Task.WhenAll(
                    idiomasTask,
                    traduccionesTask,
                    palabrasTask
                );

                idiomas = await idiomasTask;
                traducciones = await traduccionesTask;
                palabras = await palabrasTask;

                #region Cargar comboBoxIdiomas

                comboBoxIdiomas.SelectedIndexChanged -= comboBoxIdiomas_SelectedIndexChanged;
                comboBoxIdiomas.DataSource = idiomas;
                comboBoxIdiomas.DisplayMember = "Nombre";
                comboBoxIdiomas.SelectedIndex = -1;
                comboBoxIdiomas.SelectedIndexChanged += comboBoxIdiomas_SelectedIndexChanged;
                try
                {
                    comboBoxIdiomas.SelectedIndex = 0;
                }
                catch
                {
                }

                #endregion Cargar comboBoxIdiomas

                #region Cargar datagridviewTraducciones

                dataGridViewPalabras.SelectionChanged -= dataGridViewTraducciones_SelectionChanged;
                dataGridViewPalabras.AutoGenerateColumns = false;
                dataGridViewPalabras.DataSource = palabras;
                dataGridViewPalabras.Columns.Clear();
                dataGridViewPalabras.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "words"
                });
                dataGridViewPalabras.ClearSelection();
                dataGridViewPalabras.SelectionChanged += dataGridViewTraducciones_SelectionChanged;
                dataGridViewPalabras.Rows[0].Selected = true;
                TranslateDataGridViewColumns(dataGridViewPalabras);

                #endregion Cargar datagridviewTraducciones

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
            TranslateByTag(label4);
            TranslateByTag(btnActualizar);
            TranslateDataGridViewColumns(dataGridViewPalabras);
        }

        private void dataGridViewTraducciones_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                if (dataGridViewPalabras.SelectedRows.Count < 1) return;

                var palabra = (Abstracciones.Entities.Traductor.IPalabra)dataGridViewPalabras.SelectedRows[0].DataBoundItem;

                var traduccion = GetTraduccion(palabra, (Abstracciones.Entities.Traductor.IIdioma)comboBoxIdiomas.SelectedItem);
                if (traduccion != null)
                {
                    richTextBox1.Text = traduccion.Texto;
                    btnActualizar.Enabled = true;
                }
                else
                {
                    richTextBox1.Text = "";
                    btnActualizar.Enabled = true;
                }
            }
            catch (NullReferenceException)
            {
                richTextBox1.Text = "";
                btnActualizar.Enabled = true;
            }
            catch (Exception ex)
            {
                ShowError(ex);
            }
        }

        private void comboBoxIdiomas_SelectedIndexChanged(object sender, EventArgs e)
        {
            //try porque las palabras que no tienen traduccion en el idioma seleccionada
            try
            {
                if (dataGridViewPalabras.SelectedRows.Count < 1)
                {
                    richTextBox1.Text = "";
                    btnActualizar.Enabled = true;
                    return;
                }

                if (comboBoxIdiomas.SelectedIndex < 0)
                {
                    btnActualizar.Enabled = false;
                    return;
                }

                var palabra = (Abstracciones.Entities.Traductor.IPalabra)dataGridViewPalabras.SelectedRows[0].DataBoundItem;

                var traduccion = GetTraduccion(palabra, (Abstracciones.Entities.Traductor.IIdioma)comboBoxIdiomas.SelectedItem);
                richTextBox1.Text = traduccion != null ? traduccion.Texto : "";
                btnActualizar.Enabled = true;
            }
            catch (NullReferenceException) //la traduccion no existe para este idioma
            {
                richTextBox1.Text = "";
                btnActualizar.Enabled = true;
            }
            catch (Exception ex)
            {
                ShowError(ex);
            }
        }

        private async void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridViewPalabras.SelectedRows.Count < 1)
                {
                    SelectOneFirst();
                    return;
                }

                var palabra = (Abstracciones.Entities.Traductor.IPalabra)dataGridViewPalabras.SelectedRows[0].DataBoundItem;
                var traduccion = GetTraduccion(palabra, (Abstracciones.Entities.Traductor.IIdioma)comboBoxIdiomas.SelectedItem);
                progressBar1.Visible = true;

                if (traduccion != null)
                {
                    traduccion.Texto = richTextBox1.Text;
                    await _traduccionBL.Update(traduccion);
                }
                else
                {
                    var idioma = (Abstracciones.Entities.Traductor.IIdioma)comboBoxIdiomas.SelectedItem;
                    traduccion = new BE.Traduccion(idioma, palabra)
                    {
                        Texto = richTextBox1.Text
                    };
                    await _traduccionBL.Update(traduccion);
                }
                await UpdateUIAsync();
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }


        private Abstracciones.Entities.Traductor.ITraduccion GetTraduccion(Abstracciones.Entities.Traductor.IPalabra palabra, Abstracciones.Entities.Traductor.IIdioma idioma)
        {
            try
            {
                return ((List<Abstracciones.Entities.Traductor.ITraduccion>)traducciones).Find(traduccion => traduccion.Palabra.Equals(palabra) && traduccion.Idioma.Equals(idioma));
            }
            catch
            {
                return null;
            }
        }

        private void dataGridViewPalabras_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            var palabra = (Abstracciones.Entities.Traductor.IPalabra)dataGridViewPalabras.Rows[e.RowIndex].DataBoundItem;
            if (dataGridViewPalabras.Columns[e.ColumnIndex].Tag.ToString() == "words")
            {
                e.Value = palabra.NombrePalabra;
            }
        }
    }
}
