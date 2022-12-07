using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmmaFinalDLL
{
    public class Product
    {
        public int ID { get; }
        public string prodName { get; set; }
        public string prodDesc { get; set; }
        public string prodBrand { get; set; }
     

        public Product(int id,string name,string desc, string brand )
        {
            this.ID = id;
            this.prodName = name;
            this.prodDesc = desc;
            this.prodBrand = brand;
        }
        public Product(string name, string desc, string brand)
        {
            this.prodName = name;
            this.prodDesc = desc;
            this.prodBrand = brand;
        }

        public void UpdateProduct(out string status)
        {
            SqlCommand cmdProduct = new SqlCommand("UPDATE Product SET prodName = @prodName, prodDescription = @prodDescription, prodBrand = @prodBrand WHERE id = @productID",
            DBConnect.con);
            status = "";
            cmdProduct.Connection = DBConnect.con;
            try
            {
                cmdProduct.Parameters.AddWithValue("@prodName", prodName);
                cmdProduct.Parameters.AddWithValue("@prodDescription", prodDesc);
                cmdProduct.Parameters.AddWithValue("@prodBrand", prodBrand);
                cmdProduct.Parameters.AddWithValue("@productID", ID);

                DBConnect.con.Open();
                cmdProduct.ExecuteNonQuery();
                DBConnect.con.Close();
                status = "Record Updated";
            }
            catch (Exception ex)
            {
                status = ex.Message;
            }
            finally
            {
                //make sure the connection is closed
                if (DBConnect.con.State == System.Data.ConnectionState.Open)
                    DBConnect.con.Close();
            }
        }
        public void AddProduct(out string status)
        {
           
            SqlCommand cmdProduct= new SqlCommand("INSERT INTO Product (prodName,prodDescription,prodBrand) OUTPUT Inserted.id VALUES(@prodName, @prodDescription, @prodBrand);", DBConnect.con);

            status = "";
            cmdProduct.Connection = DBConnect.con;
            try
            {
                cmdProduct.Parameters.AddWithValue("@prodName", SqlDbType.VarChar).Value = prodName;
                cmdProduct.Parameters.AddWithValue("@prodDescription", SqlDbType.VarChar).Value = prodDesc;
                cmdProduct.Parameters.AddWithValue("@prodBrand", SqlDbType.VarChar).Value = prodBrand;

                DBConnect.con.Open();
                status = Convert.ToString(cmdProduct.ExecuteScalar());
                //cmdProduct.ExecuteNonQuery();

                DBConnect.con.Close();
            }
            catch (Exception ex)
            {
                status = ex.Message;
            }
            finally
            {
                //make sure the connection is closed
                if (DBConnect.con.State == System.Data.ConnectionState.Open)
                    DBConnect.con.Close();
            }
        }
    }
}
