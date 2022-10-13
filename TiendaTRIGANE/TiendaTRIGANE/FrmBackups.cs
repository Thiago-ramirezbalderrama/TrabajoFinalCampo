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
    public partial class FrmBackups : FormAbstracto, Abstracciones.IObserverIdioma
    {
        private readonly Abstracciones.BL.IBackups _backupsBL;
        private readonly FrmBase _frmBase;
        private IList<Abstracciones.Entities.IBackup> backups;

        public FrmBackups(FrmBase frmBase, Abstracciones.BL.IBackups backupsBL = null)
        {
            _frmBase = frmBase;
            _backupsBL = backupsBL ?? new BLL.Backups();
            InitializeComponent();
        }

        public void ActualizarIdioma()
        {
            TranslateByTag(label5);
            TranslateByTag(btnRealizarBackup);
            TranslateByTag(btnRestaurar);
        }

        private async Task UpdateUI()
        {
            try
            {
                progressBar1.Visible = true;

                var backupsTask = _backupsBL.GetAll();
                    await Task.WhenAll(
                    backupsTask
                );

                backups = await backupsTask;

                #region Cargar datagridview

                dataGridView1.AutoGenerateColumns = false;
                dataGridView1.Columns.Clear();
                dataGridView1.DataSource = backups;
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "date",
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "employee",
                });
                dataGridView1.ClearSelection();
                TranslateDataGridViewColumns(dataGridView1);

                #endregion Cargar datagridview

                progressBar1.Visible = false;
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                DisableControls(this);
                ShowError(ex);
            }
        }

        private async void btnRealizarBackup_Click(object sender, EventArgs e)
        {
            try
            {
                progressBar1.Visible = true;
                var backup = new BE.Backup()
                {
                    Empleado = Servicios.SesionAdmin.GetInstance.Empleado,
                    Fecha = DateTime.Now
                };
                await _backupsBL.Create(backup);
                await UpdateUI();
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private async void btnRestaurar_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridView1.SelectedRows.Count < 1)
                {
                    SelectOneFirst();
                    return;
                }

                DialogResult dialogBox = MessageBox.Show(
                    Program.LenguajeAdmin.Traducir("restore_from_backup_confirmation"),
                    Program.LenguajeAdmin.Traducir("warning"),
                    MessageBoxButtons.YesNo,
                    MessageBoxIcon.Warning);

                if (dialogBox == DialogResult.Yes)
                {
                    progressBar1.Visible = true;
                    _frmBase.DeshabilitarSecciones();
                    var backup = (Abstracciones.Entities.IBackup)dataGridView1.SelectedRows[0].DataBoundItem;
                    await _backupsBL.Restore(backup);
                    _frmBase.CerrarSesion();
                }
            }
            catch (Exception ex)
            {
                _frmBase.HabilitarSecciones();
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private async void FrmBackups_Load(object sender, EventArgs e)
        {
            Program.LenguajeAdmin.AgregarObservador(this);
            await UpdateUI();
            ActualizarIdioma();
        }

        private void dataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            var backup = (Abstracciones.Entities.IBackup)dataGridView1.Rows[e.RowIndex].DataBoundItem;
            if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "date")
            {
                e.Value = backup.Fecha;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "employee")
            {
                e.Value = $"(DNI {backup.Empleado.DNI}) {backup.Empleado.Presentacion}";
            }
        }

        private void FrmBackups_FormClosing(object sender, FormClosingEventArgs e)
        {
            Program.LenguajeAdmin.QuitarObservador(this);
        }
    }
}
