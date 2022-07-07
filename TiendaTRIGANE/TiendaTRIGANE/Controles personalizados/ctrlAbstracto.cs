using System.Windows.Forms;

namespace TiendaTRIGANE.Controles_personalizados
{
    public abstract partial class ctrlAbstracto : UserControl
    {
        public ctrlAbstracto()
        {
            InitializeComponent();
        }

        public string Etiqueta
        {
            get { return lblEtiqueta.Text; }
            set { lblEtiqueta.Text = value; }
        }

        public string Texto
        {
            get { return textBox1.Text.Trim(); }
            set { textBox1.Text = value; }
        }

        public bool isPassword
        {
            get { return textBox1.UseSystemPasswordChar; }
            set { textBox1.UseSystemPasswordChar = value; }
        }

        public int MaxLenght
        {
            get { return textBox1.MaxLength; }
            set { textBox1.MaxLength = value; }
        }

        public abstract void textBox1_KeyPress(object sender, KeyPressEventArgs e);
    }
}
