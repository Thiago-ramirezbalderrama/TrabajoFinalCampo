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
    public partial class FrmInicioSesion : FormAbstracto
    {
        private readonly Abstracciones.BL.IEmpleado _empleadoBL;

        public FrmInicioSesion(Abstracciones.BL.IEmpleado empleadoBL = null)
        {
            _empleadoBL = empleadoBL ?? new BLL.Empleado();
            InitializeComponent();
        }

        private async void button1_Click(object sender, EventArgs e)
        {
            try
            {
                ValidateControls(Controls);
                var DNI = int.Parse(ctrlNum1.Texto);
                var Clave = ctrlTexto1.Texto;

                StartProgressBar(progressBar1);
                await _empleadoBL.IniciarSesion(DNI, Clave);
                Close();
            }
            catch (Exception ex)
            {
                StopProgressBar(progressBar1);
                ShowError(ex);
            }
        }

        private void FrmInicioSesion_Load(object sender, EventArgs e)
        {
            StopProgressBar(progressBar1);
            Program.VolverAlInicioSesion = false;
        }

        public void ActualizarIdioma()
        {
            TranslateByTag(ctrlNum1);
            TranslateByTag(ctrlTexto1);
            TranslateByTag(button1);
            TranslateByTag(this);
        }
    }
}
