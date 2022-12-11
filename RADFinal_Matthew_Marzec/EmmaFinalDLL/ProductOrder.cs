//MATTHEW MARZEC
//RAD FINAL 2022
//DEC 10, 2022
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmmaFinalDLL
{
    public class ProductOrder
    {
        private int ID { get; }
        private string pordNumber { get; set; }
        private DateTime? pordDateOrdered { get; set; }
        private bool pordPaid { get; set; }

        public ProductOrder(string pordNumber,DateTime? pordDateOrdered, bool pordPaid)
        {
            this.PordNumber = pordNumber;
            this.PordDateOrdered = pordDateOrdered;

            this.PordPaid = pordPaid;
        }
        public DateTime? PordDateOrdered
        {

            get { return this.pordDateOrdered; }
            set { this.pordDateOrdered = value; }
        }
        public string PordNumber
        {
            get { return this.pordNumber; }
            set
            {
                if (value.Length > 0 || value.Length <= 50)
                {
                    this.pordNumber = value;
                }
            }
        }
        public bool PordPaid
        {
            get { return this.pordPaid; }
            set { this.pordPaid = value; }
        }

        public void CreateProdOrder(out string id)
        {
            id = "";
            SqlCommand cmdInventory = new SqlCommand("INSERT INTO prod_order (pordNumber,pordDateOrdered,pordPaid) " +
                "OUTPUT Inserted.id VALUES(@pordNumber, @pordDateOrdered, @pordPaid)", DBConnect.con);
            cmdInventory.Connection = DBConnect.con;
            try
            {
                cmdInventory.Parameters.AddWithValue("@pordNumber", SqlDbType.VarChar).Value = pordNumber;
                cmdInventory.Parameters.AddWithValue("@pordDateOrdered", SqlDbType.DateTime).Value = pordDateOrdered;
                cmdInventory.Parameters.AddWithValue("@pordPaid", SqlDbType.Bit).Value = pordPaid;


                DBConnect.con.Open();
                id = Convert.ToString(cmdInventory.ExecuteScalar());
                DBConnect.con.Close();
            }
            catch (Exception ex)
            {
                id = ex.Message;
            }
            finally
            {
                if (DBConnect.con.State == System.Data.ConnectionState.Open)
                    DBConnect.con.Close();
            }
        }
    }
}
