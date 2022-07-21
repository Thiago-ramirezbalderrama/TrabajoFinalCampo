using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.InteropServices;

namespace TiendaTRIGANE
{
    public partial class FrmBase : FormAbstracto, Abstracciones.IObserverIdioma
    {
        public FrmBase()
        {
            InitializeComponent();
        }

        private Form activo = null;

        private void FrmBase_Load(object sender, EventArgs e)
        {
            Program.LenguajeAdmin.AgregarObservador(this);
            ShowUIBasedOnPermissions();
            ActualizarIdioma();
            Program.VolverAlInicioSesion = false;
        }


        public void ShowUIBasedOnPermissions()
        {
            ShowControlBasedOnPermissions(btnEmpleados, "employeesREAD");
            //ShowControlBasedOnPermissions(seccion_RegVentas, "salesRecordREAD");
            ShowControlBasedOnPermissions(btnReabastecimiento, "replenishmentREAD");
            ShowControlBasedOnPermissions(btnProveedores, "suppliersREAD");
            ShowControlBasedOnPermissions(btnProductos, "productsREAD");
            //ShowControlBasedOnPermissions(seccion_RealizarVenta, "makeSale");
            //ShowControlBasedOnPermissions(btnReponerMostradores, "productsREPLENISH");
            //ShowControlBasedOnPermissions(seccion_Categorias, "categoriesREAD");
            ShowControlBasedOnPermissions(btnPermisos, "permissions");
            ShowControlBasedOnPermissions(btnRoles, "roleREAD");
            ShowControlBasedOnPermissions(btnIdiomas, "languagesREAD");
            ShowControlBasedOnPermissions(btnTraducciones, "translationsREAD");
        }


        public void openChildForm(Form child)
        {
            if (activo != null) activo.Close();
            activo = child;
            child.TopLevel = false;
            child.FormBorderStyle = FormBorderStyle.None;
            child.Dock = DockStyle.Fill;
            panelChildForm.Controls.Add(child);
            panelChildForm.Tag = child;
            child.BringToFront();
            child.Show();
        }

        [DllImport("user32.dll", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.dll", EntryPoint ="SendMessage")]
        private extern static void SendMessage(System.IntPtr hWnd, int wMsg, int wParam, int lParam);


        private void panel2_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }


        public void CerrarSesion()
        {
            Program.VolverAlInicioSesion = true;
            Servicios.SesionAdmin.CerrarSesion();
            Close();
        }

        

        private void btnCerrarApp_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnMaximizar_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Maximized;
            btnMaximizar.Visible = false;
            btnRestaurar.Visible = true;
        }

        private void btnMinimizar_Click(object sender, EventArgs e)
        {
            this.WindowState=FormWindowState.Minimized;
        }

        private void btnRestaurar_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Normal;
            btnRestaurar.Visible = false;
            btnMaximizar.Visible = true;
        }

        

        private void btnRoles_Click(object sender, EventArgs e)
        {
            openChildForm(new FrmRoles());
        }
        
        
        private void btnEmpleados_Click(object sender, EventArgs e)
        {
            openChildForm(new FrmEmpleados());
        }

        private void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            CerrarSesion();
        }

        private void btnCambiarContraseña_Click(object sender, EventArgs e)
        {
            openChildForm(new FrmCambiarClave());
        }

        public void ActualizarIdioma()
        {
            TranslateByTag(this);
            TranslateByTag(btnCambiarContraseña);
            TranslateByTag(btnCerrarSesion);
            TranslateByTag(btnEmpleados);
            TranslateByTag(btnRegistroVentas);
            TranslateByTag(btnProveedores);
            TranslateByTag(btnProductos);
            TranslateByTag(btnVenta);
            TranslateByTag(btnReponerMostradores);
            TranslateByTag(btnCambiarIdioma);
            TranslateByTag(btnReabastecimiento);
            TranslateByTag(btnPermisos);
            TranslateByTag(btnTraducciones);
            TranslateByTag(btnIdiomas);
        }

        private void btnTraducciones_Click(object sender, EventArgs e)
        {
            openChildForm(new FrmTraducciones());
        }

        private void btnIdiomas_Click(object sender, EventArgs e)
        {
            openChildForm(new FrmIdiomas());
        }

        private void btnPermisos_Click(object sender, EventArgs e)
        {
            openChildForm(new FrmPermisos(this));
        }

        private void btnCambiarIdioma_Click(object sender, EventArgs e)
        {
            new FrmCambiarIdioma().ShowDialog();
        }

        private void btnProductos_Click(object sender, EventArgs e)
        {
            openChildForm(new FrmProducto());
        }

        private void btnCategorias_Click(object sender, EventArgs e)
        {
            openChildForm(new FrmCategorias());
        }

        private void btnProveedores_Click(object sender, EventArgs e)
        {
            openChildForm(new FrmProveedores());
        }

        private void btnVenta_Click(object sender, EventArgs e)
        {
            openChildForm(new FrmRealizarVenta());
        }

        private void btnRegistroVentas_Click(object sender, EventArgs e)
        {
            openChildForm(new FrmRegistrosVentas());
        }

        private void btnReabastecimiento_Click(object sender, EventArgs e)
        {
            openChildForm(new FrmReabastecimiento());
        }

        private void btnReponerMostradores_Click(object sender, EventArgs e)
        {
            openChildForm(new FrmReponerExhibidores());
        }
    }
}
