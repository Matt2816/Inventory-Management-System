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

        }

        protected void OrderInfoGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            InvDetailsLbl.Text = "Inventory Details for Current Selected Item on Order:";
        }

    }
}