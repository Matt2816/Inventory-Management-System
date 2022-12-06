using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmmaFinalDLL
{
    internal static class DBConnect
    {
        internal static SqlConnection con = new SqlConnection();
        static DBConnect()
        {
            con.ConnectionString = global::EmmaFinalDLL.Properties.Settings.Default.EmmasConnectionString;
        }
    }
}
