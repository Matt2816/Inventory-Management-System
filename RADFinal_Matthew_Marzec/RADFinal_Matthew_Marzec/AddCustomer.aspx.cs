using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RADFinal_Matthew_Marzec
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //LinkButton LogOutBtn = this.Master.FindControl("LogoutBtn") as LinkButton;
            //LogOutBtn.Visible = true;
            //if (!User.Identity.IsAuthenticated) Response.Redirect("~/Default.aspx");
        }

        protected void AddRecord_Btn_Click(object sender, EventArgs e)
        {
            try
            {
                EmmaFinalDLL.Customer newCustomer = new EmmaFinalDLL.Customer(custFirst.Text, custLast.Text, custPhone.Text, custAddress.Text, custCity.Text, custPostal.Text, custEmail.Text);
                newCustomer.AddCustomer(out string status);
                if(custFirst.Text == "") successPanel.Visible = true;
                else failedPanel.Visible = true;
            }
            catch
            {
                failedPanel.Visible = true;
            }
        }
    }
}