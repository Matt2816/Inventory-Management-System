﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RADFinal_Matthew_Marzec
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogOut(object sender, EventArgs e)
        {
            if(LogoutBtn.Text != "Logout")
            {
                var auth = HttpContext.Current.GetOwinContext().Authentication;
                auth.SignOut();
            }
            Response.Redirect("Default.aspx");

        }
    }
}