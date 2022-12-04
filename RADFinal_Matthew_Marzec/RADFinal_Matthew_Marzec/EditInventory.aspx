<%@ Page Title="Edit Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditInventory.aspx.cs" Inherits="RADFinal_Matthew_Marzec.EditInventory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p>&nbsp;</p>
    <div class="container">
        <div class="row">
            <div class="col-sm-5">
                <h1>Login</h1>
                <p>
                    &nbsp;</p>
                <p>
                    &nbsp;</p>
                <p>
                    <asp:Button ID="UpdateRecord_Btn" runat="server" OnClick="UpdateRecord_Btn_Click" Text="Button" />
                </p>
                <p>
                    &nbsp;</p>

            </div>

            <div class="col-sm-5">
                <h1>Register</h1>
                </div>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
    </div>
   
    
</asp:Content>
