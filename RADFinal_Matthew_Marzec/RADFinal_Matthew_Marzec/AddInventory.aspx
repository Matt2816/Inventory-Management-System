<%@ Page Title="Add Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddInventory.aspx.cs" Inherits="RADFinal_Matthew_Marzec.AddInventory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p>&nbsp;</p>
    <div class="container">
       
        <asp:Panel ID="successPanel" Visible="false" runat="server">

            <div class="alert alert-dismissible alert-success">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>Record successfully added.</strong> <a href="Inventory.aspx" class="alert-link">Return to inventory</a>.
            </div>
        </asp:Panel>
        <asp:Panel ID="failedPanel" Visible="false" runat="server">

            <div class="alert alert-dismissible alert-danger">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>Failed to insert record. Please try again or contact your system admin</strong>
            </div>
        </asp:Panel>
        <div class="row">
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
            <div class="col-sm-4">
                <div class="form-outline">
                     <label class="form-label" for="prodName">Product Name</label>
                    <asp:TextBox class="form-control" ID="txtProdName" runat="server"></asp:TextBox>
 
                    <label class="form-label" for="prodDesc">Product Desc</label>
                    <asp:TextBox class="form-control" ID="txtProdDesc" runat="server"></asp:TextBox>
                    <label class="form-label" for="prodBrand">Product Brand</label>
                    <asp:TextBox class="form-control" ID="txtProdBrand" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-outline">                  
                    <label class="form-label" for="invQty">Inventory Qty</label>
                    <asp:TextBox class="form-control" ID="txtInvQty" runat="server"></asp:TextBox>
                    <label class="form-label" for="invSize">Inventory Size</label>
                    <asp:TextBox class="form-control" ID="txtInvSize" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-outline">
                    <label class="form-label" for="invMeasure">Inventory Measure</label>
                    <asp:TextBox class="form-control" ID="txtInvMeasure" runat="server"></asp:TextBox>
                    <label class="form-label" for="invPrice">Inventory Price</label>
                    <asp:TextBox class="form-control" ID="txtInvPrice" runat="server"></asp:TextBox>
                   
                </div>
            </div>
        </div>
        <asp:Button ID="AddRecord_Btn" ClientIDMode="Static" runat="server" Text="Add Record" class="btn btn-info btn-sm" OnClick="AddRecord_Btn_Click" />
    </div>
</asp:Content>
