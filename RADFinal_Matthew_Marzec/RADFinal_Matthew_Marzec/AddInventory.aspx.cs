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
            if (!User.Identity.IsAuthenticated) Response.Redirect("~/Default.aspx");
        }

        protected void AddRecord_Btn_Click(object sender, EventArgs e)
        {
            try
            {
                EmmaFinalDLL.Product newProduct = new EmmaFinalDLL.Product(txtProdName.Text, txtProdDesc.Text, txtProdBrand.Text);
                newProduct.AddProduct(out string status);

                EmmaFinalDLL.Inventory newInventory = new EmmaFinalDLL.Inventory(Convert.ToInt32(txtInvQty.Text), Convert.ToDecimal(txtInvSize.Text), txtInvMeasure.Text, Convert.ToDecimal(txtInvPrice.Text), Convert.ToInt16(status));
                newInventory.AddInventory(out string n);
                successPanel.Visible = true;
            }
            catch
            {
                failedPanel.Visible = true;
            }
           
        }
    }
}