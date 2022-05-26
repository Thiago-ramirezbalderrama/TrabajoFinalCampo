using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Excepciones
{
    public class TheresStillProductsLeftToSellException : Servicios.Excepciones.CustomTranslatableException
    {
        public TheresStillProductsLeftToSellException() : base("theres_still_products_left_to_sell")
        {

        }
    }
}
