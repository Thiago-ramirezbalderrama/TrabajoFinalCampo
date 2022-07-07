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
    public partial class FrmCambiarClave : FormAbstracto, Abstracciones.IObserverIdioma
    {
        private readonly Abstracciones.BL.IEmpleado _empleadoBL;

        public FrmCambiarClave(Abstracciones.BL.IEmpleado empleadoBL = null)
        {
            _empleadoBL = empleadoBL ?? new BLL.Empleado();
            InitializeComponent();
        }

        private void FrmCambiarClave_Load(object sender, EventArgs e)
        {
            progressBar1.Visible = false;
            Program.LenguajeAdmin.AgregarObservador(this);
            ActualizarIdioma();
        }

        public void ActualizarIdioma()
        {
            TranslateByTag(label1);
            TranslateByTag(ctrlTexto1);
            TranslateByTag(ctrlTexto2);
            TranslateByTag(ctrlTexto3);
            TranslateByTag(button1);
        }


        private async void button1_Click(object sender, EventArgs e)
        {
            try
            {
                ValidateControls(Controls);

                var PasswordsMatch = ctrlTexto2.Texto == ctrlTexto3.Texto;
                if (PasswordsMatch)
                {
                    progressBar1.Visible = true;
                    await _empleadoBL.CambiarClave(ctrlTexto1.Texto, ctrlTexto2.Texto);
                    progressBar1.Visible = false;
                    ctrlTexto1.Texto = "";
                    ctrlTexto2.Texto = "";
                    ctrlTexto3.Texto = "";
                    MessageBox.Show(Program.LenguajeAdmin.Traducir("password_has_been_changed"), "", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                {
                    ShowError(Program.LenguajeAdmin.Traducir("passwords_dont_match"));
                }
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private void FrmCambiarClave_FormClosing(object sender, FormClosingEventArgs e)
        {
            Program.LenguajeAdmin.QuitarObservador(this);
        }
    }
}
