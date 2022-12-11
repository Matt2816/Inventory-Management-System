//MATTHEW MARZEC
//RAD FINAL 2022
//DEC 10, 2022
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RADFinal_Matthew_Marzec
{
    public partial class AddOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton LogOutBtn = this.Master.FindControl("LogoutBtn") as LinkButton;
            LogOutBtn.Visible = true;
            if (!User.Identity.IsAuthenticated) Response.Redirect("~/Default.aspx");
        }

        protected void AddRecord_Btn_Click(object sender, EventArgs e)
        {

            try
            {
                Random randomNum = new Random();
                int invNum = randomNum.Next();
                Random randomDate = new Random();
                int dateRange = randomDate.Next(1, 7);
                EmmaFinalDLL.ProductOrder newProductOrder = new EmmaFinalDLL.ProductOrder(txtQtyOrder.Text, Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yyyy")), false);
                newProductOrder.CreateProdOrder(out string id);
                EmmaFinalDLL.Order newOrder = new EmmaFinalDLL.Order(invNum.ToString(),Convert.ToDateTime(DateTime.Now.AddDays(dateRange).ToString("MM/dd/yyyy")), Convert.ToInt16(txtQtyOrder.Text), Convert.ToDecimal(txtSupplierPrice.Text), Convert.ToInt16(InventoryDDL.SelectedValue), Convert.ToInt16(id));
                newOrder.CreateOrder(out string y);
                successPanel.Visible = true;
            }
            catch
            {
                failedPanel.Visible = true;

            }

        }
    }
}