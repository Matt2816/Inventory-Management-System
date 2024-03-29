﻿<%@ Page Title="Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="RADFinal_Matthew_Marzec.Inventory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome
        <asp:LoginName ID="LoginName" Style='text-transform: uppercase' runat="server" />
    </h2>
    <asp:Button ID="AddInventoryBtn" class="btn btn-info btn-sm" runat="server" Text="Add Inventory" OnClick="AddInventoryBtn_Click" /><br /><br/>
    <div class="row">
        <div class="col-sm-5">
            <asp:Label runat="server" Text="Filter Inventory by Name or Brand:" Font-Bold="true"></asp:Label>
            <asp:TextBox ID="prodNameTxt" Style="display: inline;" class="form-control" runat="server"></asp:TextBox>
            <asp:Button ID="InventorySearchBtn" Style="margin-left: 20px;" class="btn btn-info btn-sm" runat="server" Text="Search" OnClick="InventorySearchBtn_Click" />
        </div>
        <div class="col-sm-5">
            <asp:Label runat="server" Text="Filter Inventory Qty in Stock:" Font-Bold="true"></asp:Label>
            <asp:DropDownList class="form-control" ID="InvQtyFilterDDL" runat="server" AutoPostBack="True" OnSelectedIndexChanged="InvQtyFilterDDL_SelectedIndexChanged">
                <asp:ListItem Selected="True">Select a Qty</asp:ListItem>
                <asp:ListItem>In Stock (&lt;10)</asp:ListItem>
                <asp:ListItem>In Stock (&lt;50)</asp:ListItem>
                <asp:ListItem>In Stock (&gt;100)</asp:ListItem>
                <asp:ListItem>Out of Stock</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div><br />
    <asp:Button ID="FilterClearBtn" class="btn btn-info btn-sm" runat="server" Text="Clear Filter" OnClick="FilterClearBtn_Click" /><br/><br/>
    <asp:Panel ID="pnlResults" runat="server">
        <div class="col-xs-12">
            <div class="form-group">
                <asp:Label ID="lblInventoryResults" runat="server" Text="Inventory:" Font-Bold="true" Visible="false"></asp:Label>
            </div>
        </div>
        <br/><br/>
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
