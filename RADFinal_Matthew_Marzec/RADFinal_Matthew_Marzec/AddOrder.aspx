<%@ Page Title="Add Order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddOrder.aspx.cs" Inherits="RADFinal_Matthew_Marzec.AddOrder" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p>&nbsp;</p>
    <div class="container">
       <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js" charset="utf-8">
            </script>
            <script>
                $(document).ready(function () {
                    $('#<%=AddRecord_Btn.ClientID%>').click(function (e) {
                        var isValid = true;
                        $('input[type="text"]').each(function () {
                            if ($.trim($(this).val()) == '') {
                                isValid = false;
                                $(this).css({
                                    "border": "3px solid red"
                                });
                            }
                            else {
                                $(this).css({
                                    "border": "3px solid green"
                                });
                            }
                        });
                        if (isValid == false)
                            e.preventDefault();
                    });
                });
            </script>
        <asp:Panel ID="successPanel" Visible="false" runat="server">

            <div class="alert alert-dismissible alert-success">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>Order successfully created.</strong> <a href="Orders.aspx" class="alert-link">Return to Orders</a>.
            </div>
        </asp:Panel>
        <asp:Panel ID="failedPanel" Visible="false" runat="server">

            <div class="alert alert-dismissible alert-danger">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>Failed to create a new order, this can be caused by the item already being on order. Please try again or contact your system admin</strong>
            </div>
        </asp:Panel>
        <div class="row">
            
            <div class="col-sm-4">
                <div class="form-outline">
                     <label class="form-label" for="prodName">Select a Product to Order</label>
                     <asp:DropDownList class="form-control" ID="InventoryDDL" runat="server" DataSourceID="InventoryODS" DataTextField="prodName" DataValueField="id">
                     </asp:DropDownList>
                </div>
            </div>       
             <div class="col-sm-4">
                <div class="form-outline">
                   <label class="form-label" for="prodQtyOrder">Qty to Order</label>
                    <asp:TextBox class="form-control" ID="txtQtyOrder" runat="server"></asp:TextBox>
                </div>
            </div>       
             <div class="col-sm-4">
                <div class="form-outline">
                     <label class="form-label" for="prodSupplierPrice">Supplier Price</label>
                    <asp:TextBox class="form-control" ID="txtSupplierPrice" runat="server"></asp:TextBox>
                </div>
            </div>       
        </div>
        <br />
        <asp:Button ID="AddRecord_Btn" ClientIDMode="Static" runat="server" Text="Add Record" class="btn btn-info btn-sm" OnClick="AddRecord_Btn_Click" />
        <asp:ObjectDataSource ID="InventoryODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaFinalDLL.InventoryDataSetTableAdapters.InventoryDDLTableAdapter"></asp:ObjectDataSource>
    </div>
</asp:Content>
