using EmmaFinalDLL;
using EmmaFinalDLL.InventoryDataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RADFinal_Matthew_Marzec
{
    public partial class Inventory : System.Web.UI.Page
    {
        private static InventoryDataSet dsInventory;

        // Declare a reference to the rows of search records
        private static DataRow[] InventoryData;
        private int tblCount = 0;
     
        protected void Page_Load(object sender, EventArgs e)
        {
           
            // Initialize the dataset
            dsInventory = new InventoryDataSet();

            // Initialize the table adapters
            InventoryTableAdapter daInventory = new InventoryTableAdapter();

            try
            {
                // Fill the data adapter with data from the dataset
                daInventory.Fill(dsInventory.Inventory);
            }
            catch { }
            
            //if (!User.Identity.IsAuthenticated) Response.Redirect("~/Default.aspx");
            var search = from inventory in dsInventory.Inventory
                          orderby inventory.prodName
                          select inventory;
            DisplayTable(search);
           

        }
       
        public void DisplayTable(IEnumerable<DataRow> search)
        {
            if (search.Count() > 0)
            {

                lblInventoryResults.Text = search.Count().ToString() + " record(s) found.";
                tblTableHeadings.Visible = lblInventoryResults.Visible = true;
            }
            
            foreach (DataRow row in search)
            {
                // Declare table rows to hold table
                TableRow tblRow = new TableRow();
                // Declare table cells that will hold all cell data
                TableCell id = new TableCell();
                TableCell invQty = new TableCell();
                TableCell invPrice = new TableCell();
                TableCell prodName = new TableCell();
                TableCell prodBrand = new TableCell();
                TableCell edit = new TableCell();
                TableCell delete = new TableCell();


                HyperLink editLink = new HyperLink();
                editLink.NavigateUrl = "EditInventory?ID=" + row.ItemArray[0].ToString() + "";
                editLink.Text = "Edit"; 
              

                // Add data to each table cell
                id.Text = row.ItemArray[0].ToString();
                invQty.Text = row.ItemArray[1].ToString();
                invPrice.Text = "$"+row.ItemArray[4].ToString();
                prodName.Text = row.ItemArray[6].ToString();
                prodBrand.Text = row.ItemArray[7].ToString();
                edit.Controls.Add(editLink);
                //edit.Controls.Add(editLink);
                delete.Text = "Delete";

                 



                // Add each table cell to the table row
                tblRow.Cells.Add(id);
                tblRow.Cells.Add(invQty);
                tblRow.Cells.Add(invPrice);
                tblRow.Cells.Add(prodName);
                tblRow.Cells.Add(prodBrand);
                tblRow.Cells.Add(edit);
                tblRow.Cells.Add(delete);
                // Add the row to the table
                this.tblInventory.Rows.Add(tblRow);
            }
        }

        protected void InventorySearchBtn_Click(object sender, EventArgs e)
        {
            var search = from inventory in dsInventory.Inventory
                         where inventory.prodName.ToUpper().Contains(prodNameTxt.Text.ToUpper())
                         orderby inventory.prodName
                         select inventory;
            this.tblInventory.Rows.Clear();
            DisplayTable(search);
        }

        protected void LowInvCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            
            if(LowInvCheckBox.Checked)
            {
                var search = from inventory in dsInventory.Inventory
                             where inventory.invQuantity <= 10
                             orderby inventory.prodName
                             select inventory;
                this.tblInventory.Rows.Clear();
                DisplayTable(search);
            }
           
        }
    }
}