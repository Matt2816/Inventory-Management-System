<%@ Page Title="Customer" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="RADFinal_Matthew_Marzec.Customer" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Customer Manager</h2>
    <div class="container">
        <asp:Panel ID="successPanel" Visible="false"  runat="server">
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
            <asp:Button id="AddCustomerBtn" class="btn btn-info btn-sm" runat="server" text="Add Customer" OnClick="AddCustomerBtn_Click" /><br /><br />
            <asp:Label ID="lblCustomerResults" runat="server" Text="Filter customers by Name, Email, and Phone Number:" Font-Bold="true"></asp:Label><br />
        <asp:TextBox Type="null" ID="txtFilter" style="display: inline" class="form-control" runat="server" />
              <asp:Button id="btnFilter" class="btn btn-info btn-sm" style="margin-left: 25px" runat="server" text="Search" /><br />
        <br />
            <asp:Label ID="lblCustomerResults0" runat="server" Text="Select a customer to view there orders" Font-Bold="true"></asp:Label><br /><br />
                <asp:GridView ID="CustomerGV" runat="server" AllowPaging="True" AllowSorting="True" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="CustomerODS" Width="1858px" OnRowUpdated="CustomerGV_RowUpdated">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="custFirst" HeaderText="First Name" SortExpression="custFirst" />
                        <asp:BoundField DataField="custLast" HeaderText="Last Name" SortExpression="custLast" />
                        <asp:BoundField DataField="custPhone" HeaderText="Phone" SortExpression="custPhone" />
                        <asp:BoundField DataField="custAddress" HeaderText="Address" SortExpression="custAddress" />
                        <asp:BoundField DataField="custCity" HeaderText="City" SortExpression="custCity" />
                        <asp:BoundField DataField="custPostal" HeaderText="Postal Code" SortExpression="custPostal" />
                        <asp:BoundField DataField="custEmail" HeaderText="Email" SortExpression="custEmail" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="CustomerODS" runat="server"  OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaFinalDLL.CustomerDataSetTableAdapters.customerTableAdapter" UpdateMethod="Update" DeleteMethod="Delete" InsertMethod="Insert"
                    filterexpression="(custFirst LIKE'*{0}*' OR '{0}' LIKE '' OR custLast LIKE'*{0}*' OR custEmail LIKE'*{0}*' OR custPhone LIKE'*{0}*')" OnFiltering="CustomerODS_Filtering">
                    <FilterParameters>
                       <asp:ControlParameter ConvertEmptyStringToNull="false" ControlID="txtFilter" PropertyName="Text" />
                    </FilterParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="Original_id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="custFirst" Type="String" />
                        <asp:Parameter Name="custLast" Type="String" />
                        <asp:Parameter Name="custPhone" Type="String" />
                        <asp:Parameter Name="custAddress" Type="String" />
                        <asp:Parameter Name="custCity" Type="String" />
                        <asp:Parameter Name="custPostal" Type="String" />
                        <asp:Parameter Name="custEmail" Type="String" />
                    </InsertParameters>

                    <UpdateParameters>
            
                        <asp:Parameter Name="custFirst" Type="String" />
                        <asp:Parameter Name="custLast" Type="String" />
                        <asp:Parameter Name="custPhone" Type="String" />
                        <asp:Parameter Name="custAddress" Type="String" />
                        <asp:Parameter Name="custCity" Type="String" />
                        <asp:Parameter Name="custPostal" Type="String" />
                        <asp:Parameter Name="custEmail" Type="String" />
                        <asp:Parameter Name="Original_id" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>  
                          <br />
            <script>
                $(document).ready(function () {
                    $('#<%=CustomerGV.ClientID%>').click(function (e) {
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
            <asp:GridView ID="EditOrderGV" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="EditOrderODS">
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="ordNumber" HeaderText="Order #" ReadOnly="True" SortExpression="ordNumber" />
                    <asp:BoundField DataField="ordDate" DataFormatString="{0:D}" HeaderText="Date" SortExpression="ordDate" />
                    <asp:CheckBoxField DataField="ordPaid" HeaderText="Paid" SortExpression="ordPaid" />
                    <asp:TemplateField HeaderText="Payment Type" SortExpression="paymentID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="PaymentODS" DataTextField="payType" DataValueField="id">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="PaymentODS" DataTextField="payType" DataValueField="id" Enabled="False">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Employee" SortExpression="empID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="EmployeeODS" DataTextField="FullName" DataValueField="id">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="EmployeeODS" DataTextField="FullName" DataValueField="id" Enabled="False">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
        </asp:GridView>
        <br />
        <asp:ObjectDataSource ID="EditOrderODS" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaFinalDLL.CustomerDataSetTableAdapters.CustomerReceiptTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ordNumber" Type="String" />
                <asp:Parameter Name="ordDate" Type="DateTime" />
                <asp:Parameter Name="ordPaid" Type="Boolean" />
                <asp:Parameter Name="paymentID" Type="Int32" />
                <asp:Parameter Name="custID" Type="Int32" />
                <asp:Parameter Name="empID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="CustomerGV" Name="custID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ordNumber" Type="String" />
                <asp:Parameter Name="ordDate" Type="DateTime" />
                <asp:Parameter Name="ordPaid" Type="Boolean" />
                <asp:Parameter Name="paymentID" Type="Int32" />
                <asp:Parameter Name="custID" Type="Int32" />
                <asp:Parameter Name="empID" Type="Int32" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
            <br />
        <asp:GridView ID="OrderDetailsGV" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="OrderDetailsODS" FooterStyle-BackColor="White" OnRowDataBound="OrderDetailsGV_RowDataBound" ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="prodName" HeaderText="Product" SortExpression="prodName" />
                <asp:BoundField DataField="orlQuantity" HeaderText="Qty" SortExpression="orlQuantity" />
                <asp:BoundField DataField="orlPrice" HeaderText="Price" SortExpression="orlPrice" DataFormatString="{0:C}" />
                <asp:BoundField DataField="total" HeaderText="Total" SortExpression="total" DataFormatString="{0:C}" ReadOnly="True" />
            </Columns>

<FooterStyle BackColor="White"></FooterStyle>
        </asp:GridView>
        <br />
        <asp:ObjectDataSource ID="EmployeeODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaFinalDLL.CustomerDataSetTableAdapters.EmployeeTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="PaymentODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaFinalDLL.CustomerDataSetTableAdapters.PaymentTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="OrderDetailsODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaFinalDLL.CustomerDataSetTableAdapters.OrderDetailsTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="EditOrderGV" Name="ID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
            </div>   
            
</asp:Content>
