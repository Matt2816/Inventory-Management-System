
<%@ Page Title="Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="RADFinal_Matthew_Marzec.Inventory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome <asp:LoginName ID="LoginName" style='text-transform:uppercase'  runat="server" /></h2>
        <asp:Button ID="AddInventoryBtn" class="btn btn-info btn-sm" runat="server" Text="Add Inventory" OnClick="AddInventoryBtn_Click" /><br /><br />
        <asp:Label runat="server" Text="Filter Inventory by Name, Brand, and Qty:" Font-Bold="true"></asp:Label><br/>
        <asp:TextBox ID="prodNameTxt" class="form-control" runat="server"></asp:TextBox>
        <asp:Button ID="InventorySearchBtn" class="btn btn-info btn-sm" runat="server" Text="Search" OnClick="InventorySearchBtn_Click" /><br />
        <br /><br />
        <asp:CheckBox ID="LowInvCheckBox" runat="server" OnCheckedChanged="LowInvCheckBox_CheckedChanged" AutoPostBack="true" Text="Low Stock (<10)" /><br /><br />
    <asp:Panel ID="pnlResults" runat="server">
            <div class="col-xs-12">
                <div class="form-group">
                    <asp:Label ID="lblInventoryResults" runat="server" Text="Inventory:" Font-Bold="true" Visible="false"></asp:Label>
                </div>
            </div>
            <div class="col-xs-12">
                <asp:Table ID="tblInventory" runat="server" CssClass="table table-bordered table-hover" EnableViewState="True">

                    <asp:TableRow ID="tblTableHeadings" runat="server" Visible="false">
                        <asp:TableCell runat="server" Font-Bold="True">Inventory ID</asp:TableCell>
                        <asp:TableCell runat="server" Font-Bold="True" Font-Italic="False">Inventory Qty</asp:TableCell>
                        <asp:TableCell runat="server" Font-Bold="True">Price</asp:TableCell>
                        <asp:TableCell runat="server" Font-Bold="True">Name</asp:TableCell>
                        <asp:TableCell runat="server" Font-Bold="True">Brand</asp:TableCell>
                        <asp:TableCell runat="server" Font-Bold="True">Edit</asp:TableCell>
                        <asp:TableCell runat="server" Font-Bold="True">Delete</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </asp:Panel>
</asp:Content>
