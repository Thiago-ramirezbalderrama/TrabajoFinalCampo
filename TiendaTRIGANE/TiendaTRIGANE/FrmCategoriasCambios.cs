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
    public partial class FrmCategoriasCambios : FormAbstracto
    {
        public FrmCategoriasCambios(IList<Abstracciones.Entities.ICambioCategoria> cambiosCategoria)
        {
            InitializeComponent();
            CambiosCategoria = cambiosCategoria;
        }

        private readonly IList<Abstracciones.Entities.ICambioCategoria> CambiosCategoria;

        private void FrmCategoriasCambios_Load(object sender, EventArgs e)
        {
            TranslateByTag(this);

            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.DataSource = CambiosCategoria;
            dataGridView1.Columns.Clear();
            dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
            {
                Tag = "name"
            });
            dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
            {
                Tag = "change_type"
            });
            dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
            {
                Tag = "change_date"
            });
            dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
            {
                Tag = "change_employee"
            });

            TranslateDataGridViewColumns(dataGridView1);
            dataGridView1.ClearSelection();
        }

        private void dataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            var cambio = (Abstracciones.Entities.ICambioCategoria)dataGridView1.Rows[e.RowIndex].DataBoundItem;
            if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "name")
            {
                e.Value = cambio.EstadoCategoria.Nombre;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "change_type")
            {
                e.Value = Program.LenguajeAdmin.Traducir(cambio.TipoCambio.NombrePalabra);
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "change_date")
            {
                e.Value = cambio.FechaCambio;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "change_employee")
            {
                e.Value = cambio.EmpleadoCambio.Presentacion;
            }
        }
    }
}
