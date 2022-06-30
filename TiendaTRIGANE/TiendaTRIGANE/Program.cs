using Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TiendaTRIGANE
{
    internal static class Program
    {
        public static bool VolverAlInicioSesion { get; set; }
        public static LenguajeAdmin LenguajeAdmin { get; set; }

        /// <summary>
        /// Punto de entrada principal para la aplicación.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            try
            {
                //Lógica de autenticación
                do
                {
                    var empleado_BL = new BLL.Empleado();
                    var traduccionBL = new BLL.Traduccion();
                    var idiomaBL = new BLL.Idioma();
                    LenguajeAdmin = new LenguajeAdmin();
                    var idiomaPorDefecto = idiomaBL.GetDefault().Result;
                    LenguajeAdmin.CambiarIdioma(idiomaPorDefecto, traduccionBL.GetAll(idiomaPorDefecto).Result);
                    if (empleado_BL.GetCount().Result > 0)
                    {
                        Application.Run(new FrmInicioSesion());
                        //Application.Run(new FrmBase()); //comentar desp
                    }
                    else //Si no hay empleados para iniciar sesion, se manda al usuario a crear uno.
                    {
                        Application.Run(new FrmPrimerEmpleado());
                        //Application.Run(new FrmBase()); // comentar desp
                    }

                    var session = SesionAdmin.GetInstance;

                    if (session != null)
                    {
                        var idiomaPreferidoPorElEmpleado = SesionAdmin.GetInstance.Empleado.Idioma;
                        if (idiomaPreferidoPorElEmpleado == null)
                        {
                            idiomaPreferidoPorElEmpleado = idiomaBL.GetDefault().Result;
                        }
                        LenguajeAdmin.CambiarIdioma(idiomaPreferidoPorElEmpleado, traduccionBL.GetAll(idiomaPreferidoPorElEmpleado).Result);
                        if (LenguajeAdmin.Idioma != null)
                        {
                            var idioma = LenguajeAdmin.Idioma;
                            LenguajeAdmin.CambiarIdioma(idioma, traduccionBL.GetAll(idioma).Result);
                        }

                        Application.Run(new FrmBase());
                    }
                }
                while (VolverAlInicioSesion);
            }
            catch (AggregateException ex)
            {
                foreach (Exception excepcionInterna in ex.InnerExceptions)
                {
                    if (excepcionInterna is Servicios.Excepciones.CustomTranslatableException exTraducible)
                    {
                        MessageBox.Show(LenguajeAdmin.Traducir(exTraducible.Palabra), "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else
                    {
                        MessageBox.Show(excepcionInterna.Message, "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
