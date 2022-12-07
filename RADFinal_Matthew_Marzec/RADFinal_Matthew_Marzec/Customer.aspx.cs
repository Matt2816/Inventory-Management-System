using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RADFinal_Matthew_Marzec
{
    public partial class Customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomerODS_Filtering(object sender, ObjectDataSourceFilteringEventArgs e)
        {
            if (txtFilter.Text == "")
            {
                e.ParameterValues.Clear();
                e.ParameterValues.Add("custFisrt", "");
            }
        }
    }
}