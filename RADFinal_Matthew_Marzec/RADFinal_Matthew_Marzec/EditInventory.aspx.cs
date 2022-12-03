using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using EmmaFinalDLL;
using EmmaFinalDLL.EmmasDataSetTableAdapters;
using EmmaFinalDLL.InventoryDataSetTableAdapters;

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
            int id = Convert.ToInt32(Request.QueryString["ID"]);
            Session["ID"] = id;
            var search = from inventory in dsEditInventory.Inventory
                         where inventory.productID == id
                         select inventory;

            EditInventoryData = dsInventory.Inventory.FindByid(id);

        }
    }
}