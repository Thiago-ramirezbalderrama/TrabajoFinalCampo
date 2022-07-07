using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TiendaTRIGANE.Controles_personalizados
{
    public partial class ctrlTexto : ctrlAbstracto, IValidable
    {
        public ctrlTexto()
        {
            InitializeComponent();
        }

        public new void Validate()
        {
            if (string.IsNullOrEmpty(Texto))
            {
                throw new EmptyFieldException(Etiqueta);
            }
        }

        public override void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
        }
    }
}
