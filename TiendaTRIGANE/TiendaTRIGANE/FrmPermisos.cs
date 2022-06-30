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
    public partial class FrmPermisos : FormAbstracto, Abstracciones.IObserverIdioma
    {
        private readonly Abstracciones.BL.IPermiso _permisoBL;
        private readonly Abstracciones.BL.IEmpleado _empleadoBL;
        private readonly Abstracciones.BL.IRol _rolBL;
        private readonly FrmBase _frmBase;

        public FrmPermisos(FrmBase frmBase, Abstracciones.BL.IPermiso permisoBL = null, Abstracciones.BL.IEmpleado empleadoBL = null, Abstracciones.BL.IRol rolBL = null)
        {
            _frmBase = frmBase;
            _permisoBL = permisoBL ?? new BLL.Permiso();
            _empleadoBL = empleadoBL ?? new BLL.Empleado();
            _rolBL = rolBL ?? new BLL.Rol();
            InitializeComponent();
        }

        private Abstracciones.Entities.IPermiso permisoBaseRol { get; set; }
        private Abstracciones.Entities.IPermiso permisoBaseDisponibles { get; set; }

        private async void FrmPermisos_Load(object sender, EventArgs e)
        {
            try
            {
                progressBar1.Visible = true;
                Program.LenguajeAdmin.AgregarObservador(this);
                var permisosDisponiblesTask = _permisoBL.GetAll(null);
                var rolesTask = _rolBL.GetAll();

                await Task.WhenAll(
                    permisosDisponiblesTask,
                    rolesTask
                );

                permisoBaseDisponibles = await permisosDisponiblesTask;
                comboBox1.DataSource = await rolesTask;
                comboBox1.DisplayMember = "Nombre";
                UpdatePermisosDisponiblesUI();
                ActualizarIdioma();
                progressBar1.Visible = false;
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                DisableControls(this);
                ShowError(ex);
            }
        }



        private void UpdatePermisosDisponiblesUI()
        {
            //permisos disponibles
            tvPermisosDisponibles.Nodes.Clear();
            if (permisoBaseDisponibles == null) return;

            var root = new TreeNode(Program.LenguajeAdmin.Traducir(permisoBaseDisponibles.Descripcion.NombrePalabra))
            {
                Tag = permisoBaseDisponibles //asignar el objeto de permiso al tag del treenode para accederlo despues
            };
            foreach (var permiso in permisoBaseDisponibles.Hijos)
            {
                LlenarTreeView(root, permiso);
            }

            tvPermisosDisponibles.Nodes.Add(root);
            tvPermisosDisponibles.Nodes[0].Expand();
            foreach (TreeNode node in tvPermisosDisponibles.Nodes[0].Nodes)
            {
                node.Expand();
            }

            //actualizar treeview del rol
            comboBox1_SelectedIndexChanged(new object(), new EventArgs());
        }


        public void ActualizarIdioma()
        {
            UpdatePermisosDisponiblesUI();
            TranslateByTag(label1);
            TranslateByTag(label2);
            TranslateByTag(label3);
            TranslateByTag(btnAgregarPermisoRol);
            TranslateByTag(btnRemoverPermisoRol);
        }

        private void FrmPermisos_FormClosing(object sender, FormClosingEventArgs e)
        {
            Program.LenguajeAdmin.QuitarObservador(this);
        }



        private void LlenarTreeView(TreeNode padre, Abstracciones.Entities.IPermiso child)
        {
            var hijo = new TreeNode(Program.LenguajeAdmin.Traducir(child.Descripcion.NombrePalabra))
            {
                Tag = child //asignar el objeto de permiso al tag del treenode para accederlo despues
            };
            padre.Nodes.Add(hijo);

            if (child.Hijos == null) return;

            foreach (var item in child.Hijos)
            {
                LlenarTreeView(hijo, item);
            }
        }

        private async void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (comboBox1.SelectedItem == null) return;

                progressBar1.Visible = true;
                permisoBaseRol = await _permisoBL.GetAllByRole((Abstracciones.Entities.IRol)comboBox1.SelectedItem);
                tvPermisosDisponibles.Nodes.Clear();
                if (permisoBaseRol == null) return;

                var root = new TreeNode(Program.LenguajeAdmin.Traducir(permisoBaseRol.Descripcion.NombrePalabra))
                {
                    Tag = permisoBaseRol //asignar el objeto de permiso al tag del treenode para accederlo despues
                };
                foreach (var permiso in permisoBaseRol.Hijos)
                {
                    LlenarTreeView(root, permiso);
                }

                tvPermisosDisponibles.Nodes.Add(root);
                tvPermisosDisponibles.Nodes[0].Expand();
                foreach (TreeNode node in tvPermisosDisponibles.Nodes[0].Nodes)
                {
                    node.Collapse();
                }
                progressBar1.Visible = false;
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private async void btnAgregarPermisoRol_Click(object sender, EventArgs e)
        {
            try
            {
                var PermisoDisponible = (Abstracciones.Entities.IPermiso)tvPermisosDisponibles.SelectedNode.Tag;
                if (PermisoDisponible != null)
                {
                    await _permisoBL.AsignarPermiso(((Abstracciones.Entities.IRol)comboBox1.SelectedItem), PermisoDisponible);
                    UpdatePermisosDisponiblesUI();
                    if (((Abstracciones.Entities.IRol)comboBox1.SelectedItem).Equals(Servicios.SesionAdmin.GetInstance.Empleado.Rol))
                    {
                        progressBar1.Visible = true;
                        await _empleadoBL.ActualizarPermisosUsuario();
                        _frmBase.ShowUIBasedOnPermissions();
                    }
                }
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private async void btnRemoverPermisoRol_Click(object sender, EventArgs e)
        {
            try
            {
                var PermisoRol = (Abstracciones.Entities.IPermiso)tvPermisosDisponibles.SelectedNode.Tag;
                if (PermisoRol != null)
                {
                    await _permisoBL.RemoverPermiso(((BE.Rol)comboBox1.SelectedItem), PermisoRol);
                    UpdatePermisosDisponiblesUI();
                    if (((Abstracciones.Entities.IRol)comboBox1.SelectedItem).Equals(Servicios.SesionAdmin.GetInstance.Empleado.Rol))
                    {
                        progressBar1.Visible = true;
                        await _empleadoBL.ActualizarPermisosUsuario();
                        _frmBase.ShowUIBasedOnPermissions();
                    }
                }
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }
    }
}
