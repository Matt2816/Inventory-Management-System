<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RADFinal_Matthew_Marzec._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">

            <div class="col-sm-5">
                <h1>Login</h1>

                <div class="form-outline">
                    <asp:TextBox ID="loginName" class="form-control" runat="server"></asp:TextBox>
                    <label class="form-label" for="loginName">User Name</label>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="loginName" ErrorMessage="Username is required"></asp:RequiredFieldValidator>
                </div>
                <div class="form-outline">
                    <asp:TextBox ID="loginPassword" runat="server" TextMode="Password" class="form-control"></asp:TextBox>
                    <label class="form-label" for="loginPassword">Password</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="loginPassword" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
                    <br /><asp:Button ID="BtnLogin" runat="server" Text="Sign In" class="btn btn-primary" OnClick="BtnLogin_Click"/>
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </div>
            </div>

            <div class="col-sm-5">
                <h1>Register</h1>

                <div class="form-outline">
                    <asp:TextBox ID="TextBox1" class="form-control" runat="server"></asp:TextBox>
                    <label class="form-label" for="loginName">Email or username</label>
                </div>

                <div class="form-outline">
                    <asp:TextBox ID="regPass" runat="server" TextMode="Password" class="form-control"></asp:TextBox>
                    <label class="form-label" for="regPass">Password</label>

                    <asp:TextBox ID="regPassConfirm" runat="server" TextMode="Password" class="form-control"></asp:TextBox>
                    <label class="form-label" for="regPassConfirm">Confirm Password</label>
                    <br /><asp:Button ID="BtnRegister" runat="server" Text="Sign Up" class="btn btn-primary" OnClick="BtnRegister_Click"/>
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
