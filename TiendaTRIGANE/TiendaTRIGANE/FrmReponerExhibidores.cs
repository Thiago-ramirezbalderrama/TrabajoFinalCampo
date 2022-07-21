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
    public partial class FrmReponerExhibidores : FormAbstracto, Abstracciones.IObserverIdioma
    {
        private readonly Abstracciones.BL.IProducto _productoBL;
        public FrmReponerExhibidores(Abstracciones.BL.IProducto productoBL = null)
        {
            _productoBL = productoBL ?? new BLL.Producto();
            InitializeComponent();
        }

        private async void FrmReponerExhibidores_Load(object sender, EventArgs e)
        {
            Program.LenguajeAdmin.AgregarObservador(this);
            await UpdateUIAsync();
            ActualizarIdioma();
        }


        public void ActualizarIdioma()
        {
            TranslateByTag(label1);
            TranslateByTag(label2);
            TranslateByTag(label3);
            TranslateByTag(label5);
            TranslateByTag(btnReponerProductos);
        }

        private async Task UpdateUIAsync()
        {
            try
            {
                progressBar1.Visible = true;
                var productos = await _productoBL.GetAllInWarehouses();
                if (productos.Count == 0)
                {
                    DisableControls(this);
                    ThereAreNoProductsInWarehouses();
                    return;
                }
                comboBox1.SelectedIndexChanged -= comboBox1_SelectedIndexChanged;
                comboBox1.DataSource = productos;
                comboBox1.DisplayMember = "Nombre";
                comboBox1.SelectedIndexChanged += comboBox1_SelectedIndexChanged;
                btnReponerProductos.Enabled = true;
                numCantidad.Value = 1;
                label4.Text = ((Abstracciones.Entities.IProducto)comboBox1.SelectedItem).CantidadDepositos.ToString();
                progressBar1.Visible = false;
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                DisableControls(this);
                ShowError(ex);
            }
        }

        private async void btnReponerProductos_Click(object sender, EventArgs e)
        {
            try
            {
                if (comboBox1.SelectedItem == null)
                {
                    SelectOneFirst();
                    return;
                }

                progressBar1.Visible = true;
                await _productoBL.ReponerExhibidores((BE.Producto)comboBox1.SelectedItem, (int)numCantidad.Value);
                await UpdateUIAsync();
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (comboBox1.SelectedItem != null)
                {
                    var producto = (BE.Producto)comboBox1.SelectedItem;
                    btnReponerProductos.Enabled = true;

                    label4.Text = producto.CantidadDepositos.ToString();
                    numCantidad.Maximum = producto.CantidadDepositos;
                    numCantidad.Value = 1;
                }
                else
                {
                    btnReponerProductos.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                progressBar1.Visible = false;
                ShowError(ex);
            }
        }

        private void FrmReponerExhibidores_FormClosing(object sender, FormClosingEventArgs e)
        {
            Program.LenguajeAdmin.QuitarObservador(this);
        }
    }
}
