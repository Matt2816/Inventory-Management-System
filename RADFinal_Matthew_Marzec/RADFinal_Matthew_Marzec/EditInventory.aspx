<%@ Page Title="Edit Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditInventory.aspx.cs" Inherits="RADFinal_Matthew_Marzec.EditInventory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p>&nbsp;</p>
    <div class="container">
        <div class="row">
            <div class="col-sm-5">
                <h1>Login</h1>
                <p>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ObjectDataSource1">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="invQuantity" HeaderText="invQuantity" SortExpression="invQuantity" />
                            <asp:BoundField DataField="invSize" HeaderText="invSize" SortExpression="invSize" />
                            <asp:BoundField DataField="invMeasure" HeaderText="invMeasure" SortExpression="invMeasure" />
                            <asp:BoundField DataField="invPrice" HeaderText="invPrice" SortExpression="invPrice" />
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaFinalDLL.InventoryDataSetTableAdapters.EditInventoryTableAdapter" UpdateMethod="GetData">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="1" Name="ProductID" SessionField="ID" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ProductID" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                </p>

            </div>

            <div class="col-sm-5">
                <h1>Register</h1>
                </div>
        </div>
    </div>
   
    
</asp:Content>
