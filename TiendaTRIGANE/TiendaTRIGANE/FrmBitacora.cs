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
    public partial class FrmBitacora : FormAbstracto, Abstracciones.IObserverIdioma
    {
        private readonly Abstracciones.BL.IBitacora _bitacoraBL;
        public FrmBitacora(Abstracciones.BL.IBitacora bitacoraBL = null)
        {
            _bitacoraBL = bitacoraBL ?? new BLL.Bitacora();
            InitializeComponent();
        }

        private IList<Abstracciones.Entities.IEventoBitacora> eventosBitacora = new List<Abstracciones.Entities.IEventoBitacora>();
        private IList<Abstracciones.Entities.IEventoBitacora> eventosBitacoraFiltrados = new List<Abstracciones.Entities.IEventoBitacora>();
        private IList<Abstracciones.Entities.Traductor.IPalabra> NivelesSeveridad = new List<Abstracciones.Entities.Traductor.IPalabra>();

        private async void FrmBitacora_Load(object sender, EventArgs e)
        {
            Program.LenguajeAdmin.AgregarObservador(this);
            await UpdateUIAsync();
            ActualizarIdioma();
        }

        public void ActualizarIdioma()
        {
            TranslateByTag(label1);
            TranslateByTag(label2);
            TranslateByTag(checkBoxEmpleados);
            TranslateByTag(checkBoxSeveridad);
            TranslateDataGridViewColumns(dataGridView1);
        }

        private async Task UpdateUIAsync()
        {
            try
            {
                progressBar1.Visible = true;
                var eventosTask = _bitacoraBL.GetAll();
                var nivelesTask = _bitacoraBL.GetSeverityLevels();

                await Task.WhenAll(
                   eventosTask,
                   nivelesTask
                );

                eventosBitacora = eventosBitacoraFiltrados = await eventosTask;
                NivelesSeveridad = await nivelesTask;

                #region Cargar datagridview

                dataGridView1.AutoGenerateColumns = false;
                dataGridView1.Columns.Clear();
                dataGridView1.DataSource = eventosBitacoraFiltrados;
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "severity"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "activity"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "entity"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "date"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "employee"
                });

                TranslateDataGridViewColumns(dataGridView1);
                dataGridView1.ClearSelection();

                #endregion Cargar datagridview

                #region Cargar combobox empleados

                var empleados = new List<Abstracciones.Entities.IEmpleado>();
                foreach (var eventos in eventosBitacora)
                {
                    if (eventos.Empleado != null && empleados.FindIndex(empleado => empleado.DNI == eventos.Empleado.DNI) < 0)
                    {
                        empleados.Add(eventos.Empleado);
                    }
                }

                comboBoxEmpleados.DataSource = empleados;
                comboBoxEmpleados.Enabled = false;
                checkBoxEmpleados.Checked = false;
                dtpDesde.Enabled = false;
                dtpHasta.Enabled = false;
                dtpDesde.Text = DateTime.Now.AddMonths(-1).ToShortDateString();
                dtpHasta.Text = DateTime.Now.ToShortDateString();
                dtpHasta.MaxDate = DateTime.Now;
                dtpDesde.MaxDate = DateTime.Now;

                #endregion Cargar combobox empleados

                #region Cargar combobox severidad

                comboBoxSeveridad.DataSource = NivelesSeveridad;
                comboBoxSeveridad.Enabled = false;
                checkBoxSeveridad.Checked = false;

                #endregion Cargar combobox severidad

                progressBar1.Visible = false;
            }
            catch (Exception ex)
            {
                DisableControls(this);
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private void AplicarFiltros()
        {
            eventosBitacoraFiltrados = eventosBitacora;

            if (checkBoxEmpleados.Checked)
            {
                eventosBitacoraFiltrados = eventosBitacoraFiltrados
                    .Where(evento => evento.Empleado.Equals((Abstracciones.Entities.IEmpleado)comboBoxEmpleados.SelectedItem)).ToList();
            }

            if (checkBoxSeveridad.Checked)
            {
                eventosBitacoraFiltrados = eventosBitacoraFiltrados.
                    Where(evento => evento.Severidad.Equals((Abstracciones.Entities.Traductor.IPalabra)comboBoxSeveridad.SelectedItem)).ToList();
            }

            if (checkBoxFecha.Checked)
            {
                eventosBitacoraFiltrados = eventosBitacoraFiltrados.
                    Where(evento => evento.Fecha >= dtpDesde.Value && evento.Fecha <= dtpHasta.Value.AddDays(1)).ToList();
            }

            dataGridView1.DataSource = eventosBitacoraFiltrados;
        }

        private void dataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            var eventoBitacora = (Abstracciones.Entities.IEventoBitacora)dataGridView1.Rows[e.RowIndex].DataBoundItem;
            if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "severity")
            {
                e.Value = Program.LenguajeAdmin.Traducir(eventoBitacora.Severidad.NombrePalabra);
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "activity")
            {
                e.Value = Program.LenguajeAdmin.Traducir(eventoBitacora.Actividad.NombrePalabra);
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "entity")
            {
                e.Value = Program.LenguajeAdmin.Traducir(eventoBitacora.TipoEntidad.NombrePalabra);
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "date")
            {
                e.Value = eventoBitacora.Fecha;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "employee")
            {
                e.Value = eventoBitacora.Empleado.Presentacion;
            }
        }

        private void checkBoxEmpleados_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBoxEmpleados.Checked)
            {
                comboBoxEmpleados.Enabled = true;
            }
            else
            {
                comboBoxEmpleados.Enabled = false;
            }
            AplicarFiltros();
        }

        private void comboBoxEmpleados_SelectedIndexChanged(object sender, EventArgs e)
        {
            AplicarFiltros();
        }

        private void checkBoxSeveridad_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBoxSeveridad.Checked)
            {
                comboBoxSeveridad.Enabled = true;
            }
            else
            {
                comboBoxSeveridad.Enabled = false;
            }
            AplicarFiltros();
        }

        private void comboBoxSeveridad_SelectedIndexChanged(object sender, EventArgs e)
        {
            AplicarFiltros();
        }

        private void comboBoxEmpleados_Format(object sender, ListControlConvertEventArgs e)
        {
            if (e.ListItem == null) return;
            var empleado = (Abstracciones.Entities.IEmpleado)e.ListItem;
            e.Value = empleado.Presentacion;
        }

        private void comboBoxSeveridad_Format(object sender, ListControlConvertEventArgs e)
        {
            if (e.ListItem == null) return;
            var severidad = (Abstracciones.Entities.Traductor.IPalabra)e.ListItem;
            e.Value = Program.LenguajeAdmin.Traducir(severidad.NombrePalabra);
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count < 1)
            {
                richTextBox1.Text = "";
                return;
            }

            var evento = (Abstracciones.Entities.IEventoBitacora)dataGridView1.SelectedRows[0].DataBoundItem;
            richTextBox1.Text = evento.InfoAsociada;
        }

        private void checkBoxFecha_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBoxFecha.Checked)
            {
                dtpDesde.Enabled = true;
                dtpHasta.Enabled = true;
            }
            else
            {
                dtpDesde.Enabled = false;
                dtpHasta.Enabled = false;
            }
            AplicarFiltros();
        }

        private void dtpDesde_ValueChanged(object sender, EventArgs e)
        {
            AplicarFiltros();
        }

        private void dtpHasta_ValueChanged(object sender, EventArgs e)
        {
            AplicarFiltros();
        }
    }
}
