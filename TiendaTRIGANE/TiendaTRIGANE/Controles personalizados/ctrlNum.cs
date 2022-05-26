using System.Windows.Forms;

namespace TiendaTRIGANE.Controles_personalizados
{
    public partial class ctrlNum : ctrlAbstracto, IValidable
    {
        public ctrlNum()
        {
            InitializeComponent();
        }

        public override void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar);
        }

        public new void Validate()
        {
            if (string.IsNullOrEmpty(Texto))
            {
                throw new EmptyFieldException(Etiqueta);
            }

            if (!float.TryParse(Texto, out _))
            {
                throw new InvalidInputException(Etiqueta);
            }
        }


    }
}
