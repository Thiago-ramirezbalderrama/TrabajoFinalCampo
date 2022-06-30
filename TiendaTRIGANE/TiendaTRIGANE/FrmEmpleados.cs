using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Abstracciones.Entities;

namespace TiendaTRIGANE
{
    public partial class FrmEmpleados : FormAbstracto, Abstracciones.IObserverIdioma
    {

        private readonly Abstracciones.BL.IRol _rolBL;
        private readonly Abstracciones.BL.IEmpleado _empleadoBL;

        public FrmEmpleados(Abstracciones.BL.IRol rolBL = null, Abstracciones.BL.IEmpleado empleadoBL = null)
        {
            _rolBL = rolBL ?? new BLL.Rol();
            _empleadoBL = empleadoBL ?? new BLL.Empleado();
            InitializeComponent();
        }

        private List<IEmpleado> empleados;
        private List<IRol> roles;


        public async Task UpdateUIAsync()
        {
            try
            {
                progressBar1.Visible = true;
                var rolesTask = _rolBL.GetAll();
                var empleadosTask = _empleadoBL.GetAll();

                await Task.WhenAll(
                    rolesTask,
                    empleadosTask
                );
                roles = (List<IRol>)await rolesTask;
                empleados = (List<IEmpleado>)await empleadosTask;

                comboBox1.DataSource = null;
                btnModificar.Enabled = false;
                btnEliminar.Enabled = false;

                #region Cargar datagridview

                comboBox1.DataSource = roles.AsReadOnly();
                comboBox1.DisplayMember = "Nombre";

                dataGridView1.SelectionChanged -= dataGridView1_SelectionChanged;
                dataGridView1.AutoGenerateColumns = false;
                dataGridView1.DataSource = empleados.AsReadOnly();
                dataGridView1.Columns.Clear();
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "dni"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "name"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "surname"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "role"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "email"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "birth_date"
                });
                TranslateDataGridViewColumns(dataGridView1);
                dataGridView1.ClearSelection();
                dataGridView1.SelectionChanged += dataGridView1_SelectionChanged;

                #endregion Cargar datagridview

                ctrlTexto1.Texto = "";
                ctrlTexto2.Texto = "";
                ctrlNum1.Texto = "";
                ctrlTexto3.Texto = "";
                ctrlTexto4.Texto = "";
                ctrlTexto5.Texto = "";
                progressBar1.Visible = false;
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                DisableControls(this);
                ShowError(ex);
            }
        }


        private async void FrmEmpleados_Load(object sender, EventArgs e)
        {
            Program.LenguajeAdmin.AgregarObservador(this);
            await UpdateUIAsync();
            ActualizarIdioma();
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count < 1) return;
            var empleado = (IEmpleado)dataGridView1.SelectedRows[0].DataBoundItem;
            ctrlTexto1.Texto = empleado.Nombre.ToString();
            ctrlTexto2.Texto = empleado.Apellido.ToString();
            ctrlTexto5.Texto = empleado.Email;
            dateTimePicker1.Value = empleado.FechaNacimiento;
            ctrlNum1.Texto = empleado.DNI.ToString();
            btnModificar.Enabled = true;
            btnEliminar.Enabled = empleado.DNI != Servicios.SesionAdmin.GetInstance.Empleado.DNI;
            foreach (IRol item in comboBox1.Items)
            {
                if (item.Nombre == empleado.Rol.Nombre)
                {
                    comboBox1.SelectedItem = item;
                }
            }
        }



        public void ActualizarIdioma()
        {
            TranslateByTag(label2);
            TranslateByTag(label5);
            TranslateByTag(label1);
            TranslateByTag(label5);
            TranslateByTag(ctrlNum1);
            TranslateByTag(ctrlTexto1);
            TranslateByTag(ctrlTexto2);
            TranslateByTag(ctrlTexto3);
            TranslateByTag(ctrlTexto4);
            TranslateByTag(ctrlTexto5);
            TranslateByTag(btnAgregar);
            TranslateByTag(btnModificar);
            TranslateByTag(btnEliminar);
            TranslateDataGridViewColumns(dataGridView1);
        }



        private async void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                if (comboBox1.SelectedItem == null)
                {
                    SelectOneFirst();
                    return;
                }

                ValidateControls(Controls);

                var PasswordsMatch = ctrlTexto3.Texto == ctrlTexto4.Texto;
                if (!PasswordsMatch)
                {
                    MessageBox.Show(Program.LenguajeAdmin.Traducir("passwords_dont_match"), "", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                var empleado = new BE.Empleado((IRol)comboBox1.SelectedItem)
                {
                    DNI = int.Parse(ctrlNum1.Texto),
                    Nombre = ctrlTexto1.Texto,
                    Apellido = ctrlTexto2.Texto,
                    FechaNacimiento = dateTimePicker1.Value.Date,
                    Email = ctrlTexto5.Texto
                };

                progressBar1.Visible = true;
                await _empleadoBL.Create(empleado, ctrlTexto3.Texto);
                await UpdateUIAsync();
                SuccessfulAddition();
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private async void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridView1.SelectedRows.Count < 1)
                {
                    SelectOneFirst();
                    return;
                }
                var empleado = (IEmpleado)dataGridView1.SelectedRows[0].DataBoundItem;

                //no validar los campos de contraseña
                Controls.Remove(ctrlTexto3);
                Controls.Remove(ctrlTexto4);
                ValidateControls(Controls);
                Controls.Add(ctrlTexto3);
                Controls.Add(ctrlTexto4);

                var nuevoEmpleado = empleado;
                nuevoEmpleado.Rol = (IRol)comboBox1.SelectedItem;
                nuevoEmpleado.Nombre = ctrlTexto1.Texto;
                nuevoEmpleado.Apellido = ctrlTexto2.Texto;
                nuevoEmpleado.FechaNacimiento = dateTimePicker1.Value.Date;
                nuevoEmpleado.Email = ctrlTexto5.Texto;

                progressBar1.Visible = true;
                await _empleadoBL.Update(empleado, nuevoEmpleado);
                await UpdateUIAsync();
                SuccessfulUpdate();
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private async void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridView1.SelectedRows.Count < 1)
                {
                    SelectOneFirst();
                    return;
                }

                var empleado = (IEmpleado)dataGridView1.SelectedRows[0].DataBoundItem;

                progressBar1.Visible = true;
                await _empleadoBL.Delete(empleado);
                await UpdateUIAsync();
                SuccessfulDeletion();
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private void dataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            var empleado = (IEmpleado)dataGridView1.Rows[e.RowIndex].DataBoundItem;
            if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "role")
            {
                e.Value = empleado.Rol.Nombre;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "dni")
            {
                e.Value = empleado.DNI;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "name")
            {
                e.Value = empleado.Nombre;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "surname")
            {
                e.Value = empleado.Apellido;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "role")
            {
                e.Value = empleado.Rol.Nombre;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "email")
            {
                e.Value = empleado.Email;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "birth_date")
            {
                e.Value = empleado.FechaNacimiento.ToShortDateString();
            }
        }

        private void FrmEmpleados_FormClosing(object sender, FormClosingEventArgs e)
        {
            Program.LenguajeAdmin.QuitarObservador(this);
        }
    }
}
