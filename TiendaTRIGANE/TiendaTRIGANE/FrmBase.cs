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
    public partial class FrmBase : Form
    {
        public FrmBase()
        {
            InitializeComponent();
        }

        private Form activo = null;

        private void FrmBase_Load(object sender, EventArgs e)
        {
            Program.VolverAlInicioSesion = false;
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

        public void CerrarSesion()
        {
            Program.VolverAlInicioSesion = true;
            Servicios.SesionAdmin.CerrarSesion();
            Close();
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

        private void panel2_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }
    }
}
