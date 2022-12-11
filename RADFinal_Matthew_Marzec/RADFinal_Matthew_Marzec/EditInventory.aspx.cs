//MATTHEW MARZEC
//RAD FINAL 2022
//DEC 10, 2022
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
using System.Diagnostics;

namespace RADFinal_Matthew_Marzec
{
    public partial class EditInventory : System.Web.UI.Page
    {
        private static InventoryDataSet dsInventory;
        private static DataRow[] InventoryData;
        public int ID = 0;
        static EditInventory()
        {
            dsInventory = new InventoryDataSet();
            EditInventoryTableAdapter daEditInventory = new EditInventoryTableAdapter();
            InventoryTableAdapter daInventory = new InventoryTableAdapter();

            try
            {
                daInventory.Fill(dsInventory.Inventory);
            }
            catch { }
        }
        void LoadMyData()
        {

            ID = Convert.ToInt32(Request.QueryString["ID"]);
            Session["ID"] = ID;
            var record = dsInventory.Inventory.Where(k => k.id == ID).FirstOrDefault();
            var productRecord = dsInventory.Inventory.Where(k => k.id == ID).FirstOrDefault();

            if (record != null)
            {
                txtProdID.Text = record.productID.ToString();
                txtInvQty.Text = record.invQuantity.ToString();
                txtInvSize.Text = record.invSize.ToString();
                txtInvMeasure.Text = record.invMeasure.ToString();
                txtInvPrice.Text = record.invPrice.ToString();
                txtProdName.Text = record.prodName;
                txtProdDesc.Text = "test";
                txtProdBrand.Text = record.prodBrand;
            }
            else
            {
                Response.Redirect("~/Inventory.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton LogOutBtn = this.Master.FindControl("LogoutBtn") as LinkButton;
            LogOutBtn.Visible = true;
            if (!User.Identity.IsAuthenticated) Response.Redirect("~/Default.aspx");
            if (!IsPostBack)
            {
                LoadMyData();
            }
        }

        protected void UpdateRecord_Btn_Click(object sender, EventArgs e)
        {
            ID = Convert.ToInt32(Request.QueryString["ID"]);
            Session["ID"] = ID;
            try
            {
                EmmaFinalDLL.Inventory inventory = new EmmaFinalDLL.Inventory(ID, Convert.ToInt32(txtInvQty.Text), Convert.ToDecimal(txtInvSize.Text), txtInvMeasure.Text, Convert.ToDecimal(txtInvPrice.Text), ID);
                inventory.UpdateInventory(out string status);

                EmmaFinalDLL.Product product = new EmmaFinalDLL.Product(ID,txtProdName.Text, txtProdDesc.Text, txtProdBrand.Text);
                product.UpdateProduct(out string productStatus);
                txtProdDesc.Text= status;
                successPanel.Visible = true;
            }
            catch(Exception ex)
            {
                txtProdBrand.Text = ex.Message;
                failedPanel.Visible = true;

            }
        }
    }
}