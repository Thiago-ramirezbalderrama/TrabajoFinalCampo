using System;
using System.Windows.Forms;
using System.IO;
using System.Diagnostics;
using TiendaTRIGANE.Controles_personalizados;

namespace TiendaTRIGANE
{
    public partial class FormAbstracto : Form
    {
        public FormAbstracto()
        {
            InitializeComponent();
        }

        internal static void SuccessfulAddition()
        {
            MessageBox.Show(("successful_addition"), "", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        internal static void SuccessfulUpdate()
        {
            MessageBox.Show(("successful_update"), "", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        internal static void SuccessfulDeletion()
        {
            MessageBox.Show(("successful_deletion"), "", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        internal static void ShowError(string message)
        {
            MessageBox.Show(message, "", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        internal static void ShowError(Exception ex)
        {
            if (ex is Servicios.Excepciones.NotAllowedException exPermisoFaltante)
            {
                MessageBox.Show(/*Program.LanguageManager.Traducir*/(exPermisoFaltante.Palabra), /*Program.LanguageManager.Traducir*/(exPermisoFaltante.Permiso), MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (ex is Servicios.Excepciones.CustomTranslatableException exTraducible)
            {
                MessageBox.Show(/*Program.LanguageManager.Traducir*/(exTraducible.Palabra), "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                Trace.TraceInformation(ex.ToString());
                Trace.WriteLine(ex);
                MessageBox.Show(ex.Message, "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        internal static void StartProgressBar(ProgressBar progressBar)
        {
            progressBar.MarqueeAnimationSpeed = 20;
            progressBar.Style = ProgressBarStyle.Marquee;
        }

        internal static void StopProgressBar(ProgressBar progressBar)
        {
            progressBar.MarqueeAnimationSpeed = 0;
            progressBar.Style = ProgressBarStyle.Continuous;
        }

        internal static void SelectOneFirst()
        {
            MessageBox.Show(("select_one_from_the_list"), "", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        internal static void EnterProductCategoriesFirst()
        {
            MessageBox.Show(Program.LenguajeAdmin.Traducir("enter_product_categories_first"), "", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        internal static void ThereAreNoProductsInShelves()
        {
            MessageBox.Show(Program.LenguajeAdmin.Traducir("there_are_no_products_in_shelves"), "", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        internal static void ThereAreNoProductsInWarehouses()
        {
            MessageBox.Show(Program.LenguajeAdmin.Traducir("there_are_no_products_in_warehouses"), "", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        internal static void ThereAreNoSuppliers()
        {
            MessageBox.Show(Program.LenguajeAdmin.Traducir("enter_a_supplier_first"), "", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        internal static void ThereAreNoProductsFromThisCategory()
        {
            MessageBox.Show(Program.LenguajeAdmin.Traducir("there_are_no_products_from_this_category"), "", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        internal static void ThereAreNoProducts()
        {
            MessageBox.Show(Program.LenguajeAdmin.Traducir("there_are_no_products"), "", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        internal static void TranslateByTag(Control control, string strAppend = "")
        {
            if (control.Tag != null)
            {
                var Texto = Program.LenguajeAdmin.Traducir(control.Tag.ToString()) + strAppend;
                if (control is ctrlAbstracto ctrl)
                {
                    ctrl.Etiqueta = Texto;
                }
                else
                {
                    control.Text = Texto;
                }
            }
        }

        internal static void ShowControlBasedOnPermissions(Control control, string NombrePermiso)
        {
            try
            {
                Servicios.PermisosAdmin.CheckPermission(NombrePermiso);
                control.Visible = true;
            }
            catch
            {
                control.Visible = false;
            }
        }

        internal static void TranslateDataGridViewColumns(DataGridView dv)
        {
            foreach (DataGridViewColumn col in dv.Columns)
            {
                if (col.Tag != null)
                {
                    col.Name = col.HeaderText = Program.LenguajeAdmin.Traducir(col.Tag.ToString());
                }
            }
        }

        internal static void DisableControls(Form form)
        {
            foreach (Control control in form.Controls)
            {
                if (!(control is Label))
                {
                    control.Enabled = false;
                }
            }
        }

        internal static void ValidateControls(Control.ControlCollection Controls)
        {
            foreach (Control ctr in Controls)
            {
                if (ctr is IValidable validable)
                {
                    validable.Validate();
                }
            }
        }

        internal static void ValidateControls(IValidable control)
        {
            if (control is IValidable validable)
            {
                validable.Validate();
            }
        }
    }
}
