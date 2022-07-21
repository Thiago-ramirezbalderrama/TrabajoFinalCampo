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
    public partial class FrmPrimerEmpleado : FormAbstracto
    {
        private readonly Abstracciones.BL.IRol _rolBL;
        private readonly Abstracciones.BL.IEmpleado _empleadoBL;

        public FrmPrimerEmpleado(Abstracciones.BL.IRol rolBL = null, Abstracciones.BL.IEmpleado empleadoBL = null)
        {
            _rolBL = rolBL ?? new BLL.Rol();
            _empleadoBL = empleadoBL ?? new BLL.Empleado();
            InitializeComponent();
        }

        private List<Abstracciones.Entities.IRol> roles;



        private async void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                ValidateControls(Controls);
                var PasswordsMatch = ctrlTexto3.Texto == ctrlTexto4.Texto;
                if (!PasswordsMatch)
                {
                    MessageBox.Show(Program.LenguajeAdmin.Traducir("passwords_dont_match"), "", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                StartProgressBar(progressBar1);
                var empleado = new BE.Empleado(roles.Find(rol => rol.AdministradorSistema))
                {
                    DNI = int.Parse(ctrlNum1.Texto),
                    Nombre = ctrlTexto1.Texto,
                    Apellido = ctrlTexto2.Texto,
                    FechaNacimiento = dateTimePicker1.Value.Date,
                    Email = ctrlTexto5.Texto
                };

                await _empleadoBL.Create(empleado, ctrlTexto3.Texto);
                Program.VolverAlInicioSesion = true;
                MessageBox.Show("Administrador del sistema creado exitosamente", "",MessageBoxButtons.OK,MessageBoxIcon.Information);
                Close();
            }
            catch (Exception ex)
            {
                StopProgressBar(progressBar1);
                ShowError(ex);
            }
        }

        private async void FrmPrimerEmpleado_Load(object sender, EventArgs e)
        {
            StartProgressBar(progressBar1);

            //el unico rol que deberia estar cargado despues de la instalacion es el de administrador de sistema
            roles = (List<Abstracciones.Entities.IRol>)await _rolBL.GetAll();
            ActualizarIdioma();
            StopProgressBar(progressBar1);
        }

        public void ActualizarIdioma()
        {
            TranslateByTag(label2);
            TranslateByTag(ctrlNum1);
            TranslateByTag(ctrlTexto1);
            TranslateByTag(ctrlTexto2);
            TranslateByTag(ctrlTexto3);
            TranslateByTag(ctrlTexto4);
            TranslateByTag(ctrlTexto5);
            TranslateByTag(btnRegistrarse);
            TranslateByTag(this);
        }
    }
}
