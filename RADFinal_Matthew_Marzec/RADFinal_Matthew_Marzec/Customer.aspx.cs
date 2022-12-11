﻿//MATTHEW MARZEC
//RAD FINAL 2022
//DEC 10, 2022
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RADFinal_Matthew_Marzec
{
    public partial class Customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton LogOutBtn = this.Master.FindControl("LogoutBtn") as LinkButton;
            LogOutBtn.Visible = true;
            if (!User.Identity.IsAuthenticated) Response.Redirect("~/Default.aspx");
        }

        protected void CustomerODS_Filtering(object sender, ObjectDataSourceFilteringEventArgs e)
        {
            if (txtFilter.Text == "")
            {
                e.ParameterValues.Clear();
                e.ParameterValues.Add("custFisrt", "");
            }
           
        }

        protected void CustomerGV_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if(e.Exception!= null)
            {
                failedPanel.Visible = true;
            }
            else
            {
                successPanel.Visible = true;

            }
        }
    }
}