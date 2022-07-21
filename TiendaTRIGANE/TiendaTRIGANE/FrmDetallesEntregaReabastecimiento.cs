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
    public partial class FrmDetallesEntregaReabastecimiento : FormAbstracto
    {
        public FrmDetallesEntregaReabastecimiento(Abstracciones.Entities.IInformeReabastecimiento informeReabastecimiento)
        {
            InitializeComponent();
            InformeReabastecimiento = informeReabastecimiento;
        }

        private readonly Abstracciones.Entities.IInformeReabastecimiento InformeReabastecimiento;

        private void FrmDetallesEntregaReabastecimiento_Load(object sender, EventArgs e)
        {
            Size = InformeReabastecimiento.EntregaAceptada ? new Size(603, 582) : new Size(603, 181);
            TranslateByTag(this);
            TranslateByTag(label1);
            TranslateByTag(label2);
            richTextBox1.Text = InformeReabastecimiento.ComentarioEntrega;
            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.Columns.Clear();
            dataGridView1.DataSource = InformeReabastecimiento.DetallesEntrega;
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
            var detalle = (BE.Detalle)dataGridView1.Rows[e.RowIndex].DataBoundItem;
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
