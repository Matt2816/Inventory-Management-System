using EmmaFinalDLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RADFinal_Matthew_Marzec
{
    public partial class DeleteInventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated) Response.Redirect("~/Default.aspx");
        }

        protected void DeleteRecord_Btn_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script language='javascript'>");
            sb.Append(@"$('.modal').modal('show');");
            sb.Append(@"</script>");

            ClientScript.RegisterStartupScript(this.GetType(), "JSScript", sb.ToString());
           
        }

        protected void DeleteRecordConfirmBtn_Click(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(Request.QueryString["ID"]);
            Session["ID"] = ID;

            EmmaFinalDLL.Inventory delete = new EmmaFinalDLL.Inventory();
            delete.DeleteInventory(ID, out string status);
            if(status.Contains("The DELETE statement conflicted with the REFERENCE constraint \"onorder_fk_inventoryID\"")) failedPanel.Visible = true;
            else successPanel.Visible = true;    
        }
    }
}

     