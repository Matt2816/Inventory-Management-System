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
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton LogOutBtn = this.Master.FindControl("LogoutBtn") as LinkButton;
            LogOutBtn.Visible = true;
            if (!User.Identity.IsAuthenticated) Response.Redirect("~/Default.aspx");
        }

        protected void OrderInfoGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            InvDetailsLbl.Text = "Inventory Details for Current Selected Item on Order:";
            OrderStatuslbl.Text = "Update Order Payment Status:";
        }

        protected void AddOrderBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddOrder.aspx");
        }

    }
}