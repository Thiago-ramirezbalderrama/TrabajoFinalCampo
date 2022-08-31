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
    public partial class FrmProductosCambios : FormAbstracto
    {
        public FrmProductosCambios(IList<Abstracciones.Entities.ICambioProducto> cambiosProducto)
        {
            InitializeComponent();
            CambiosProducto = cambiosProducto;
        }

        private readonly IList<Abstracciones.Entities.ICambioProducto> CambiosProducto;

        private void FrmProductosCambios_Load(object sender, EventArgs e)
        {
            TranslateByTag(this);

            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.DataSource = CambiosProducto;
            dataGridView1.Columns.Clear();
            dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
            {
                Tag = "name"
            });
            dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
            {
                Tag = "unit_price"
            });
            dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
            {
                Tag = "change_type"
            });
            dataGridView1.Columns.Add(new DataGridViewTextBoxColumn
            {
                Tag = "low_stock_warning_for_this_product"
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
            var cambio = (Abstracciones.Entities.ICambioProducto)dataGridView1.Rows[e.RowIndex].DataBoundItem;
            if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "name")
            {
                e.Value = cambio.EstadoProducto.Nombre;
            }
            if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "unit_price")
            {
                e.Value = cambio.EstadoProducto.PrecioUnitario;
            }
            if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "low_stock_warning_for_this_product")
            {
                e.Value = cambio.EstadoProducto.Nombre;
            }
            if (dataGridView1.Columns[e.ColumnIndex].Tag.ToString() == "change_type")
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
