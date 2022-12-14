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
              <asp:Button id="btnFilter" class="btn btn-info btn-sm" style="margin-left: 25px" runat="server" text="Search" /><br /><br />
                <asp:GridView ID="CustomerGV" runat="server" AllowPaging="True" AllowSorting="True" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="CustomerODS" Width="1858px" OnRowUpdated="CustomerGV_RowUpdated">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
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
                          <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js" charset="utf-8">
            </script>
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
            </div>         
</asp:Content>
