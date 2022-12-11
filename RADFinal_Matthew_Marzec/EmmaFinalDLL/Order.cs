//MATTHEW MARZEC
//RAD FINAL 2022
//DEC 10, 2022
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmmaFinalDLL
{
    public class Order
    {
        private int ID { get; }
        private string onordInvoiceNum { get; set; }
        private DateTime? onordArriveDate { get; set; }
        private int onordNumInOrder { get; set; }
        private decimal onordPrice { get; set; }
        private int inventoryID { get; set; }
        private int prodorderID { get; set; }


        public Order(string onordInvoiceNum,DateTime? onordArriveDate, int onordNumInOrder, decimal onordPrice, int inventoryID, int prodorderID)
        {
            this.OnordInvoiceNum = onordInvoiceNum;
            this.OnordArriveDate = onordArriveDate;
            this.OnordNumInOrder = onordNumInOrder;
            this.OnordPrice = onordPrice;
            this.InventoryID = inventoryID;
            this.ProdorderID = prodorderID;
        }



        public DateTime? OnordArriveDate
        {
            get { return this.onordArriveDate; }
            set
            {
                if (value > DateTime.Today)
                {
                    this.onordArriveDate = value;
                }
            }
        }
        public int OnordNumInOrder
        {
            get { return this.onordNumInOrder; }
            set
            {
                if (value > 0 || value <= 10000)
                {
                    this.onordNumInOrder = value;
                }
            }
        }
        public int InventoryID
        {
            get { return this.inventoryID; }
            set
            {
                if (value > 0)
                {
                    this.inventoryID = value;
                }
            }
        }
        public int ProdorderID
        {
            get { return this.prodorderID; }
            set
            {
                if (value > 0)
                {
                    this.prodorderID = value;
                }
            }
        }

        public string OnordInvoiceNum
        {
            get { return this.onordInvoiceNum; }
            set
            {
                if (value.Length > 0 || value.Length <= 20)
                {
                    this.onordInvoiceNum = value;
                }
            }
        }
        public decimal OnordPrice
        {
            get { return this.onordPrice; }
            set
            {
                if (value > 0 || value <= 10000)
                {
                    this.onordPrice = value;
                }
            }
        }

        public void CreateOrder(out string status)
        {
            status = "";
            SqlCommand cmdInventory = new SqlCommand("INSERT INTO on_order (onordInvoiceNum,onordArriveDate,onordNumInOrder,onordPrice,inventoryID,prodorderID) " +
                "VALUES(@onordInvoiceNum, @onordArriveDate, @onordNumInOrder, @onordPrice, @inventoryID, @prodorderID)", DBConnect.con);
            cmdInventory.Connection = DBConnect.con;
            try
            {
                cmdInventory.Parameters.AddWithValue("@onordInvoiceNum", SqlDbType.VarChar).Value = onordInvoiceNum;
                cmdInventory.Parameters.AddWithValue("@onordArriveDate", SqlDbType.DateTime).Value = onordArriveDate;
                cmdInventory.Parameters.AddWithValue("@onordNumInOrder", SqlDbType.Int).Value = onordNumInOrder;
                cmdInventory.Parameters.AddWithValue("@onordPrice", SqlDbType.Decimal).Value = onordPrice;

                cmdInventory.Parameters.AddWithValue("@inventoryID", SqlDbType.Int).Value = inventoryID;
                cmdInventory.Parameters.AddWithValue("@prodorderID", SqlDbType.Int).Value = prodorderID;

                DBConnect.con.Open();
                cmdInventory.ExecuteNonQuery();
                DBConnect.con.Close();
            }
            catch (Exception ex)
            {
                status = ex.Message;
            }
            finally
            {
                if (DBConnect.con.State == System.Data.ConnectionState.Open)
                    DBConnect.con.Close();
            }
        }
    }
}
