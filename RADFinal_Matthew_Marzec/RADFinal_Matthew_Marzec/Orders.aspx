
<%@ Page Title="Orders" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="RADFinal_Matthew_Marzec.Orders" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p>&nbsp;</p>
      <asp:Label ID="lblOrderResults" runat="server" Text="Filter Order by Name, Email, and Phone Number:" Font-Bold="true"></asp:Label><br />
        <asp:TextBox Type="null" ID="txtFilter" class="form-control" runat="server" />
              <asp:Button id="btnFilter" class="btn btn-info btn-sm" runat="server" text="Search" />
<asp:GridView ID="OrderInfoGV" runat="server" CssClass="table table-bordered table-hover" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="OrdersODS" OnSelectedIndexChanged="OrderInfoGV_SelectedIndexChanged">
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="id" HeaderText="Order ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
        <asp:BoundField DataField="prodName" HeaderText="Name" SortExpression="prodName" />
        <asp:BoundField DataField="invQuantity" HeaderText="Current Inv Qty" SortExpression="invQuantity" />
        <asp:BoundField DataField="onordInvoiceNum" HeaderText="Invoice #" SortExpression="onordInvoiceNum" />
        <asp:BoundField DataField="onordArriveDate" HeaderText="Est Arrival Date" SortExpression="onordArriveDate" DataFormatString="{0:d}" />
        <asp:BoundField DataField="pordDateOrdered" HeaderText="Date Ordered" SortExpression="pordDateOrdered" DataFormatString="{0:d}" />
        <asp:BoundField DataField="onordNumInOrder" HeaderText="Qty of Items in Order" SortExpression="onordNumInOrder" />
        <asp:BoundField DataField="onordPrice" HeaderText="Supplier Item Price" SortExpression="onordPrice" DataFormatString="{0:C}" />
        <asp:CheckBoxField DataField="pordPaid" HeaderText="Paid" SortExpression="pordPaid" />
    </Columns>
</asp:GridView>
<asp:ObjectDataSource ID="OrdersODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaFinalDLL.OrdersTableAdapters.OrderDetailsTableAdapter"
    filterexpression="(prodName LIKE'*{0}*' OR '{0}' LIKE '' OR onordInvoiceNum LIKE'*{0}*')">
                    <FilterParameters>
                       <asp:ControlParameter ConvertEmptyStringToNull="false" ControlID="txtFilter" PropertyName="Text" />
                    </FilterParameters>
</asp:ObjectDataSource>
    <asp:Label ID="InvDetailsLbl" Font-Bold="true" runat="server"></asp:Label><br /><br />
    <asp:GridView ID="InvDetailsGV" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" DataSourceID="InventoryDetailsODS">
        <Columns>
            <asp:BoundField DataField="invQuantity" HeaderText="Inv Qty" SortExpression="invQuantity" />
            <asp:BoundField DataField="invPrice" DataFormatString="{0:C}" HeaderText="Price" SortExpression="invPrice" />
            <asp:BoundField DataField="invSize" HeaderText="Size" SortExpression="invSize" />
            <asp:BoundField DataField="prodName" HeaderText="Name" SortExpression="prodName" />
            <asp:BoundField DataField="prodDescription" HeaderText="Description" SortExpression="prodDescription" />
            <asp:BoundField DataField="prodBrand" HeaderText="Brand" SortExpression="prodBrand" />
            <asp:BoundField DataField="productID" HeaderText="Product ID" SortExpression="productID" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="InventoryDetailsODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaFinalDLL.OrdersTableAdapters.OrderInventoryTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="OrderInfoGV" Name="ProductID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
</asp:Content>
