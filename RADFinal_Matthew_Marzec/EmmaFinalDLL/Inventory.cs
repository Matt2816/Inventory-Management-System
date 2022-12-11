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
    public class Inventory
    {
        private int ID { get; }
        private int invQuantity { get; set; }
        private decimal invSize { get; set; }
        private string invMeasure { get; set; }
        private decimal invPrice { get; set; }
        private int productID { get; set; }

        public Inventory(int id, int qty, decimal size, string measure, decimal price, int productId)
        {
            this.ID = id;
            this.InvQty = qty;
            this.InvSize = size;
            this.InvMeasure = measure;
            this.InvPrice = price;
            this.ProductID = productId;
        }
        public Inventory(int qty, decimal size, string measure, decimal price, int productId)
        {
            this.InvQty = qty;
            this.InvSize = size;
            this.InvMeasure = measure;
            this.InvPrice = price;
            this.ProductID = productId;
        }

        public Inventory()
        {
           
        }
        public int InvQty
        {
            get { return this.invQuantity; }
            set
            {
                if (value > 0 || value <= 10000)
                {
                    this.invQuantity = value;
                }
            }
        }
        public decimal InvSize
        {
            get { return this.invSize; }
            set
            {
                if (value > 0 || value <= 10000)
                {
                    this.invSize = value;
                }
            }
        }
        public string InvMeasure
        {
            get { return this.invMeasure; }
            set
            {
                if (value.Length > 0 || value.Length <= 20)
                {
                    this.invMeasure = value;
                }
            }
        }
        public decimal InvPrice
        {
            get { return this.invPrice; }
            set
            {
                if (value > 0 || value <= 10000)
                {
                    this.invPrice = value;
                }
            }
        }
        public int ProductID
        {
            get { return this.productID; }
            set
            {
                if (value > 0)
                {
                    this.productID = value;
                }
            }
        }
        public void UpdateInventory(out string status)
        {

            SqlCommand cmdInventory = new SqlCommand("UPDATE Inventory SET invQuantity = @invQuantity, invSize = @invSize, invMeasure = @invMeasure, invPrice = @invPrice, productID = @productID WHERE productID = @productID",
               DBConnect.con);
            status = "";
            cmdInventory.Connection = DBConnect.con;
            try
            {
                cmdInventory.Parameters.AddWithValue("@invQuantity", SqlDbType.Int).Value = invQuantity;
                cmdInventory.Parameters.AddWithValue("@invSize", SqlDbType.Decimal).Value = invSize;
                cmdInventory.Parameters.AddWithValue("@invMeasure", SqlDbType.VarChar).Value = invMeasure;
                cmdInventory.Parameters.AddWithValue("@invPrice", SqlDbType.Decimal).Value = invPrice;
                cmdInventory.Parameters.AddWithValue("@productID", SqlDbType.Int).Value = productID;
                DBConnect.con.Open();
                cmdInventory.ExecuteNonQuery();
                DBConnect.con.Close();
                status = "Record Updated";
            }
            catch (Exception ex)
            {
                status= ex.Message;
            }
            finally
            {
                if (DBConnect.con.State == System.Data.ConnectionState.Open)
                    DBConnect.con.Close();
            }
        }
        public void DeleteInventory(int id, out string status)
        {
            status = "";
            SqlCommand cmdInventory = new SqlCommand("DELETE FROM INVENTORY WHERE id = @ID", DBConnect.con);
            cmdInventory.Connection = DBConnect.con;
            try
            {
                cmdInventory.Parameters.AddWithValue("@ID", SqlDbType.Int).Value = id;
                DBConnect.con.Open();
                cmdInventory.ExecuteNonQuery();
                DBConnect.con.Close();
            }
            catch(Exception ex)
            {
                status = ex.Message;
            }
            finally
            {
                if (DBConnect.con.State == System.Data.ConnectionState.Open)
                    DBConnect.con.Close();
            }
        }

        public void AddInventory(out string status)
        {
            status = "";
            SqlCommand cmdInventory = new SqlCommand("INSERT INTO Inventory (invQuantity,invSize,invMeasure,invPrice,productID) " +
                "VALUES(@invQuantity, @invSize, @invMeasure, @invPrice, @productID)", DBConnect.con);
            cmdInventory.Connection = DBConnect.con;
            try
            {
                cmdInventory.Parameters.AddWithValue("@invQuantity", SqlDbType.Int).Value = invQuantity;
                cmdInventory.Parameters.AddWithValue("@invSize", SqlDbType.Decimal).Value = invSize;
                cmdInventory.Parameters.AddWithValue("@invMeasure", SqlDbType.VarChar).Value = invMeasure;
                cmdInventory.Parameters.AddWithValue("@invPrice", SqlDbType.Decimal).Value = invPrice;
                cmdInventory.Parameters.AddWithValue("@productID", SqlDbType.Int).Value = productID;
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
