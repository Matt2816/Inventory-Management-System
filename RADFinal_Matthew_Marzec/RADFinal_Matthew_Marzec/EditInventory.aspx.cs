using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using EmmaFinalDLL;
using EmmaFinalDLL.InventoryDataSetTableAdapters;
using System.Data.SqlClient;
using System.Drawing;
using System.Reflection.Emit;

namespace RADFinal_Matthew_Marzec
{
    public partial class EditInventory : System.Web.UI.Page
    {
        private static InventoryDataSet dsEditInventory;
        private static InventoryDataSet dsInventory;

        // Declare a reference to the rows of search records
        private static DataRow EditInventoryData;
        private static DataRow[] InventoryData;

        static EditInventory()
        {
            // Initialize the dataset
            dsEditInventory = new InventoryDataSet();
            dsInventory = new InventoryDataSet();

            // Initialize the table adapters
            EditInventoryTableAdapter daEditInventory = new EditInventoryTableAdapter();
            InventoryTableAdapter daInventory = new InventoryTableAdapter();

            try
            {
                // Fill the data adapter with data from the dataset
                daInventory.Fill(dsInventory.Inventory);
                daEditInventory.Update(EditInventoryData);

            }
            catch { }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //int id = Convert.ToInt32(Request.QueryString["ID"]);
            //Session["ID"] = id;
            
            //var x = dsInventory.Inventory.Where(k => k.id == id).FirstOrDefault();
          
        }

        protected void UpdateRecord_Btn_Click(object sender, EventArgs e)
        {
            //SqlCommand cmd = new SqlCommand("UPDATE Inventory ('invQuantity', 'invSize', 'invMeasure','invPrice','productID') " +
            //    "VALUES ('@invQuantity', '@invSize', '@invMeasure','@invPrice','@productID') WHERE productID ='@productID'",
            //    DBConnect.con);

            SqlCommand cmdInventory = new SqlCommand("UPDATE Inventory SET invQuantity = @invQuantity, invSize = @invSize, invMeasure = @invMeasure, invPrice = @invPrice, productID = @productID WHERE productID = @productID",
               DBConnect.con);
            SqlCommand cmdProduct = new SqlCommand("UPDATE Product SET prodName = @prodName, prodDescription = @prodDescription, prodBrand = @prodBrand WHERE id = @productID",
               DBConnect.con);

            int id = Convert.ToInt32(Request.QueryString["ID"]);
            Session["ID"] = id;
           
            var x = dsInventory.Inventory.Where(k => k.id == id).FirstOrDefault();
            cmdInventory.Connection = DBConnect.con;
            try
            {
                cmdInventory.Parameters.AddWithValue("@invQuantity", 5544);
                cmdInventory.Parameters.AddWithValue("@invSize", 12);
                cmdInventory.Parameters.AddWithValue("@invMeasure", "FL");
                cmdInventory.Parameters.AddWithValue("@invPrice", 12.99);
                cmdInventory.Parameters.AddWithValue("@productID", x.productID);

                cmdProduct.Parameters.AddWithValue("@prodName", "5W30");
                cmdProduct.Parameters.AddWithValue("@prodDescription", "Test");
                cmdProduct.Parameters.AddWithValue("@prodBrand", "Honda");
                cmdProduct.Parameters.AddWithValue("@productID", x.productID);

                DBConnect.con.Open();
                cmdInventory.ExecuteNonQuery();
                cmdProduct.ExecuteNonQuery();
                DBConnect.con.Close();
            }
            catch
            {

            }
        }
    }
}