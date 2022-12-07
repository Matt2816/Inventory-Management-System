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
        public int ID { get; }
        public int invQuantity { get; set; }
        public decimal invSize { get; set; }
        public string invMeasure { get; set; }
        public decimal invPrice { get; set; }
        public int productID { get; set; }

        public Inventory(int id, int qty, decimal size, string measure, decimal price, int productId)
        {
            this.ID = id;
            this.invQuantity = qty;
            this.invSize = size;
            this.invMeasure = measure;
            this.invPrice = price;
            this.productID = productId;
        }

        public Inventory()
        {
           
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
