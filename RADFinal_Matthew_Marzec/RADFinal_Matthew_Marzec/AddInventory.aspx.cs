using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RADFinal_Matthew_Marzec
{
    public partial class AddInventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void AddRecord_Btn_Click(object sender, EventArgs e)
        {
            EmmaFinalDLL.Product newProduct = new EmmaFinalDLL.Product(txtProdName.Text, txtProdDesc.Text, txtProdBrand.Text);
            newProduct.AddProduct(out string status);
            //txtInvQty.Text = Convert.ToString(id);
            txtInvPrice.Text = status;
        }
    }
}