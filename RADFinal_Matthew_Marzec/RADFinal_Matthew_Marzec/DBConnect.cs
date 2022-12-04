using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RADFinal_Matthew_Marzec
{
   
    internal static class DBConnect
    {
        internal static SqlConnection con = new SqlConnection();
        static DBConnect()
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["EmmaDBConnection"].ConnectionString;
        }
    }
    
}