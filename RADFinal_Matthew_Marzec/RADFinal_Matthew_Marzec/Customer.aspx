<%@ Page Title="Customer" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="RADFinal_Matthew_Marzec.Customer" %>

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

              <asp:textbox id="txtFilter" runat="server"/>
              <p><asp:Button id="btnFilter" runat="server" text="Search" /></p>
                <asp:GridView ID="CustomerGV" runat="server" AllowPaging="True" AllowSorting="True" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="CustomerODS" Width="1858px">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="custFirst" HeaderText="custFirst" SortExpression="custFirst" />
                        <asp:BoundField DataField="custLast" HeaderText="custLast" SortExpression="custLast" />
                        <asp:BoundField DataField="custPhone" HeaderText="custPhone" SortExpression="custPhone" />
                        <asp:BoundField DataField="custAddress" HeaderText="custAddress" SortExpression="custAddress" />
                        <asp:BoundField DataField="custCity" HeaderText="custCity" SortExpression="custCity" />
                        <asp:BoundField DataField="custPostal" HeaderText="custPostal" SortExpression="custPostal" />
                        <asp:BoundField DataField="custEmail" HeaderText="custEmail" SortExpression="custEmail" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="CustomerODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="EmmaFinalDLL.CustomerDataSetTableAdapters.customerTableAdapter" UpdateMethod="Update" DeleteMethod="Delete" InsertMethod="Insert"
                    filterexpression="(custFirst LIKE'*{0}*' OR '{0}' LIKE '')" OnFiltering="CustomerODS_Filtering">
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
            </div>         
</asp:Content>
