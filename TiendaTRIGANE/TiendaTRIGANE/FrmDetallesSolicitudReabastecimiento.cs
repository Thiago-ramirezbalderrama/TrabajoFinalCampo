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
    public partial class FrmDetallesSolicitudReabastecimiento : FormAbstracto
    {
        public FrmDetallesSolicitudReabastecimiento(Abstracciones.Entities.IInformeReabastecimiento informeReabastecimiento)
        {
            InitializeComponent();
            InformeReabastecimiento = informeReabastecimiento;
        }

        private readonly Abstracciones.Entities.IInformeReabastecimiento InformeReabastecimiento;

        private void FrmDetallesSolicitudReabastecimiento_Load(object sender, EventArgs e)
        {
            TranslateByTag(this);
            TranslateByTag(label1);
            TranslateByTag(label2);
            richTextBox1.Text = InformeReabastecimiento.ComentarioSolicitud;
            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.Columns.Clear();
            dataGridView1.DataSource = InformeReabastecimiento.DetallesSolicitud;
            dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
            {
                Tag = "product"
            });
            dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
            {
                Tag = "quantity"
            });
            TranslateDataGridViewColumns(dataGridView1);
            dataGridView1.ClearSelection();
        }

        private void dataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            var detalle = (Abstracciones.Entities.IDetalle)dataGridView1.Rows[e.RowIndex].DataBoundItem;
            if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "product")
            {
                e.Value = detalle.Producto.Nombre;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "quantity")
            {
                e.Value = detalle.Cantidad;
            }
        }
    }
}
