using System;
using System.Windows.Forms;

namespace TiendaTRIGANE
{
    public partial class FrmDetallesVenta : FormAbstracto
    {
        public FrmDetallesVenta(Abstracciones.Entities.IVenta venta)
        {
            InitializeComponent();
            Venta = venta;
        }

        private readonly Abstracciones.Entities.IVenta Venta;

        private void FrmDetallesVenta_Load(object sender, EventArgs e)
        {
            TranslateByTag(this);
            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.DataSource = Venta.Detalles;
            dataGridView1.Columns.Clear();
            dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
            {
                Tag = "product"
            });
            dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
            {
                Tag = "quantity"
            });
            dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
            {
                Tag = "price"
            });

            TranslateDataGridViewColumns(dataGridView1);
            dataGridView1.ClearSelection();
        }

        private void dataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            var detalle = (BE.DetalleVenta)dataGridView1.Rows[e.RowIndex].DataBoundItem;
            if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "product")
            {
                e.Value = detalle.Producto.Nombre;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "price")
            {
                e.Value = "$ " + detalle.Importe;
            }
            else if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "quantity")
            {
                e.Value = detalle.Cantidad;
            }
        }
    }
}
