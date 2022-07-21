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
    public partial class FrmReabastecimiento : FormAbstracto, Abstracciones.IObserverIdioma
    {
        private readonly Abstracciones.BL.IInformeReabastecimiento _informeReabastecimientoBL;
        public FrmReabastecimiento(Abstracciones.BL.IInformeReabastecimiento informeReabastecimientoBL = null)
        {
            _informeReabastecimientoBL = informeReabastecimientoBL ?? new BLL.InformeReabastecimiento();
            InitializeComponent();
        }

        private IList<Abstracciones.Entities.IInformeReabastecimiento> informes;
        private IList<Abstracciones.Entities.IInformeReabastecimiento> informesFiltrados;

        private async void FrmReabastecimiento_Load(object sender, EventArgs e)
        {
            Program.LenguajeAdmin.AgregarObservador(this);
            await UpdateUIAsync();
            ActualizarIdioma();
        }


        public void ActualizarIdioma()
        {
            TranslateByTag(label1);
            TranslateByTag(label2);
            TranslateByTag(btnSolicitarReabastecimiento);
            TranslateByTag(comboBoxCategoria);
            TranslateByTag(checkBoxCategoria);
            TranslateByTag(btnTerminarSolicitud);
            TranslateByTag(btnVerDetallesSolicitud);
            TranslateByTag(btnVerDetallesEntrega);
            TranslateDataGridViewColumns(dataGridView1);
        }

        private async Task UpdateUIAsync()
        {
            try
            {
                progressBar1.Visible = true;
                btnTerminarSolicitud.Enabled = false;
                btnVerDetallesEntrega.Enabled = false;
                btnVerDetallesSolicitud.Enabled = false;

                var informesTask = _informeReabastecimientoBL.GetAll();
                await Task.WhenAll(informesTask);

                informes = informesFiltrados = await informesTask;

                #region Cargar combobox categorias

                var categorias = new List<Abstracciones.Entities.ICategoria>();
                foreach (var informe in informes)
                {
                    if (informe.Proveedor.Categoria != null && categorias.FindIndex(categoria => categoria.Equals(informe.Proveedor.Categoria)) < 0)
                    {
                        categorias.Add(informe.Proveedor.Categoria);
                    }
                }

                comboBoxCategoria.DataSource = categorias;
                comboBoxCategoria.Enabled = false;
                checkBoxCategoria.Checked = false;

                #endregion Cargar combobox categorias

                #region Cargar datagridview1

                dataGridView1.SelectionChanged -= dataGridView1_SelectionChanged;
                dataGridView1.AutoGenerateColumns = false;
                dataGridView1.Columns.Clear();
                dataGridView1.DataSource = informesFiltrados;
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "category"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "supplier"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "time_of_request"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "agreed_time_of_delivery"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "real_time_of_delivery"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "requesting_employee"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "employee_who_received_the_delivery"
                });
                dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
                {
                    Tag = "state"
                });

                TranslateDataGridViewColumns(dataGridView1);
                dataGridView1.ClearSelection();
                dataGridView1.SelectionChanged += dataGridView1_SelectionChanged;

                #endregion Cargar datagridview1

                progressBar1.Visible = false;
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                DisableControls(this);
                ShowError(ex);
            }
        }

        private async void btnSolicitarReabastecimiento_Click(object sender, EventArgs e)
        {
            Form f = new FrmGenerarSolicitudReabastecimiento();
            f.ShowDialog();
            await UpdateUIAsync();
        }

        private void btnVerDetallesEntrega_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count < 1)
            {
                SelectOneFirst();
                return;
            }

            var informe = (Abstracciones.Entities.IInformeReabastecimiento)dataGridView1.SelectedRows[0].DataBoundItem;
            Form f = new FrmDetallesEntregaReabastecimiento(informe);
            f.ShowDialog();
        }

        private void FrmReabastecimiento_FormClosing(object sender, FormClosingEventArgs e)
        {
            Program.LenguajeAdmin.QuitarObservador(this);
        }

        private async void btnTerminarSolicitud_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count < 1)
            {
                SelectOneFirst();
                return;
            }

            var informe = (Abstracciones.Entities.IInformeReabastecimiento)dataGridView1.SelectedRows[0].DataBoundItem;
            Form form = new FrmGenerarEntregaReabastecimiento(informe);
            form.ShowDialog();
            await UpdateUIAsync();
        }

        private void dataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            var informe = (BE.InformeReabastecimiento)dataGridView1.Rows[e.RowIndex].DataBoundItem;

            if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "agreed_time_of_delivery")
            {
                e.Value = informe.FechaEntregaAcordada;
            }
            if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "time_of_request")
            {
                e.Value = informe.FechaSolicitud;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "category")
            {
                e.Value = informe.Proveedor.Categoria.Nombre;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "supplier")
            {
                e.Value = informe.Proveedor.Presentacion;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "supplier")
            {
                e.Value = informe.Proveedor.Presentacion;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "real_time_of_delivery")
            {
                if (informe.SolicitudTerminada)
                {
                    e.Value = informe.FechaEntregaReal.ToString();
                }
                else
                {
                    e.Value = "-";
                }
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "requesting_employee")
            {
                e.Value = informe.EmpleadoSolicitante.Presentacion;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "employee_who_received_the_delivery")
            {
                if (informe.EmpleadoReceptor != null)
                {
                    e.Value = informe.EmpleadoReceptor.Presentacion;
                }
                else
                {
                    e.Value = "-";
                }
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "state")
            {
                if (informe.SolicitudTerminada)
                {
                    if (informe.EntregaAceptada)
                    {
                        e.Value = Program.LenguajeAdmin.Traducir("accepted");
                        dataGridView1.Rows[e.RowIndex].Cells[e.ColumnIndex].Style.BackColor = Color.Green;
                        dataGridView1.Rows[e.RowIndex].Cells[e.ColumnIndex].Style.ForeColor = Color.White;
                    }
                    else
                    {
                        e.Value = Program.LenguajeAdmin.Traducir("rejected");
                        dataGridView1.Rows[e.RowIndex].Cells[e.ColumnIndex].Style.BackColor = Color.Red;
                        dataGridView1.Rows[e.RowIndex].Cells[e.ColumnIndex].Style.ForeColor = Color.White;
                    }
                }
                else
                {
                    e.Value = Program.LenguajeAdmin.Traducir("pending");
                    dataGridView1.Rows[e.RowIndex].Cells[e.ColumnIndex].Style.BackColor = Color.Gray;
                    dataGridView1.Rows[e.RowIndex].Cells[e.ColumnIndex].Style.ForeColor = Color.White;
                }
            }
        }

        private void btnVerDetallesSolicitud_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count < 1)
            {
                SelectOneFirst();
                return;
            }
            var informe = (Abstracciones.Entities.IInformeReabastecimiento)dataGridView1.SelectedRows[0].DataBoundItem;

            Form form = new FrmDetallesSolicitudReabastecimiento(informe);
            form.ShowDialog();
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count < 1) return;

            btnVerDetallesSolicitud.Enabled = true;
            btnVerDetallesEntrega.Enabled = true;
            var informe = (Abstracciones.Entities.IInformeReabastecimiento)dataGridView1.SelectedRows[0].DataBoundItem;
            if (informe.SolicitudTerminada)
            {
                btnTerminarSolicitud.Enabled = false;
                btnVerDetallesEntrega.Enabled = true;
            }
            else //entrega pendiente
            {
                btnTerminarSolicitud.Enabled = true;
                btnVerDetallesEntrega.Enabled = false;
            }
        }

        private void comboBoxCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            AplicarFiltros();
        }


        private void AplicarFiltros()
        {
            informesFiltrados = informes;

            if (checkBoxCategoria.Checked)
            {
                informesFiltrados = informesFiltrados
                    .Where(informe => informe.Proveedor.Categoria.Equals((Abstracciones.Entities.ICategoria)comboBoxCategoria.SelectedItem)).ToList();
                dataGridView1.DataSource = informesFiltrados;
            }

            
        }

        private void checkBoxCategoria_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBoxCategoria.Checked)
            {
                comboBoxCategoria.Enabled = true;
            }
            else
            {
                comboBoxCategoria.Enabled = false;
            }
            AplicarFiltros();
        }

        private void comboBoxCategoria_Format(object sender, ListControlConvertEventArgs e)
        {
            {
                if (e.ListItem == null) return;
                var categoria = (Abstracciones.Entities.ICategoria)e.ListItem;
                e.Value = Program.LenguajeAdmin.Traducir(categoria.Nombre);
            }
        }
    }
}
