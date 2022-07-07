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
    public partial class FrmCambiarIdioma : FormAbstracto, Abstracciones.IObserverIdioma
    {
        public FrmCambiarIdioma(Abstracciones.BL.IEmpleado empleadoBL = null,
            Abstracciones.BL.Traductor.ITraduccion traduccionBL = null,
            Abstracciones.BL.Traductor.IIdioma idiomaBL = null)
        {
            _empleadoBL = empleadoBL ?? new BLL.Empleado();
            _traduccionBL = traduccionBL ?? new BLL.Traduccion();
            _idiomaBL = idiomaBL ?? new BLL.Idioma();

            InitializeComponent();
        }

        private readonly Abstracciones.BL.IEmpleado _empleadoBL;
        private readonly Abstracciones.BL.Traductor.ITraduccion _traduccionBL;
        private readonly Abstracciones.BL.Traductor.IIdioma _idiomaBL;

        private void FrmCambiarIdioma_Load(object sender, EventArgs e)
        {
            Program.LenguajeAdmin.AgregarObservador(this);
            ActualizarIdioma();
        }

        private IList<Abstracciones.Entities.Traductor.IIdioma> idiomas = new List<Abstracciones.Entities.Traductor.IIdioma>();
        private readonly List<Abstracciones.Entities.Traductor.IIdioma> idiomasTraducidos = new List<Abstracciones.Entities.Traductor.IIdioma>();



        public async void ActualizarIdioma()
        {
            try
            {
                StartProgressBar(progressBar1);
                comboBox1.DataSource = null;
                idiomas = await _idiomaBL.GetAllHabilitados();
                idiomasTraducidos.Clear();
                comboBox1.SelectedIndexChanged -= comboBox1_SelectedIndexChanged;
                foreach (var idioma in idiomas)
                {
                    idioma.Nombre = Program.LenguajeAdmin.Traducir(idioma.Nombre);
                    idiomasTraducidos.Add(idioma);
                }

                comboBox1.DisplayMember = "Nombre";
                comboBox1.DataSource = idiomasTraducidos.AsReadOnly();
                comboBox1.SelectedIndex = idiomasTraducidos.FindIndex(idioma => idioma.Equals(Program.LenguajeAdmin.Idioma)); //todo testear
                comboBox1.SelectedIndexChanged += comboBox1_SelectedIndexChanged;
                StopProgressBar(progressBar1);
            }
            catch (Exception ex)
            {
                StopProgressBar(progressBar1);
                DisableControls(this);
                ShowError(ex);
            }
        }

        private async void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                var idioma = (Abstracciones.Entities.Traductor.IIdioma)comboBox1.SelectedItem;
                if (idioma != null && !idioma.Equals(Program.LenguajeAdmin.Idioma))
                {
                    StartProgressBar(progressBar1);
                    Servicios.SesionAdmin.GetInstance.Empleado.Idioma = idioma;
                    await _empleadoBL.CambiarIdiomaPreferido(Servicios.SesionAdmin.GetInstance.Empleado);
                    Program.LenguajeAdmin.CambiarIdioma(idioma, await _traduccionBL.GetAll(idioma));
                    StopProgressBar(progressBar1);
                }
            }
            catch (Exception ex)
            {
                StopProgressBar(progressBar1);
                DisableControls(this);
                ShowError(ex);
            }
        }

        private void FrmCambiarIdioma_FormClosing(object sender, FormClosingEventArgs e)
        {
            Program.LenguajeAdmin.QuitarObservador(this);
        }
    }
}
