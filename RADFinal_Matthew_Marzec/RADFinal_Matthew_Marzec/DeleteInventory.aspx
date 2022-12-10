<%@ Page Title="Delete Record" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteInventory.aspx.cs" Inherits="RADFinal_Matthew_Marzec.DeleteInventory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p>&nbsp;</p>
    <div class="container">
        <asp:Panel ID="successPanel" Visible="false" runat="server">

            <div class="alert alert-dismissible alert-success">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>Record successfully deleted.</strong> <a href="Inventory.aspx" class="alert-link">Return to inventory</a>.
            </div>
        </asp:Panel>

        <asp:Panel ID="failedPanel" Visible="false" runat="server">

            <div class="alert alert-dismissible alert-danger">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>Record could not be deleted due to it being on order. Please try again later or contact your system admin</strong>
            </div>
        </asp:Panel>
        <div class="modal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Confirm Record Deletion</h4>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to delete this record?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <asp:Button ID="DeleteRecordConfirmBtn" runat="server" Text="Yes" Class="btn btn-danger" OnClick="DeleteRecordConfirmBtn_Click" />
                    </div>
                </div>
            </div>
</div>
        <asp:GridView ID="DeleteInvGV" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="DeleteInvODS">
            <Columns>
                <asp:BoundField DataField="prodName" HeaderText="Name" SortExpression="prodName" />
                <asp:BoundField DataField="prodDescription" HeaderText="Description" SortExpression="prodDescription" />
                <asp:BoundField DataField="prodBrand" HeaderText="Brand" SortExpression="prodBrand" />
                <asp:BoundField DataField="invQuantity" HeaderText="Inventory Qty" SortExpression="invQuantity" />
                <asp:BoundField DataField="invPrice" HeaderText="Price" SortExpression="invPrice" DataFormatString="{0:C}" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="DeleteInvODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaFinalDLL.InventoryDataSetTableAdapters.InventoryDetailTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="" Name="InventoryID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:Button ID="DeleteRecord_Btn" runat="server" OnClick="DeleteRecord_Btn_Click" Text="Delete Record" Class="btn btn-danger" />
    </div>
</asp:Content>
