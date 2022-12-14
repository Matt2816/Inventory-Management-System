<%@ Page Title="Add Customer" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="RADFinal_Matthew_Marzec.AddCustomer" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p>&nbsp;</p>
    <div class="container">
        <asp:Panel ID="successPanel" Visible="false"  runat="server">

            <div class="alert alert-dismissible alert-success">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>Record successfully added.</strong> <a href="Customer.aspx" class="alert-link">Return to Customers</a>.
            </div>
        </asp:Panel>
        <asp:Panel ID="failedPanel" Visible="false" runat="server">

            <div class="alert alert-dismissible alert-danger">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>Failed to insert record. Please try again or contact your system admin</strong>
            </div>
        </asp:Panel>
         <div class="row">
            
            <div class="col-sm-4">
                <div class="form-outline">
                     <label class="form-label" for="custFirst">First Name</label>
                     <asp:TextBox class="form-control" ID="custFirst" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" style="font-size: 15px" runat="server" ControlToValidate="custFirst" ErrorMessage="First Name is required" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <label class="form-label" for="custAddress">Address</label>
                    <asp:TextBox class="form-control" ID="custAddress" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" style="font-size: 15px" runat="server" ControlToValidate="custAddress" ErrorMessage="Address is required" ForeColor="Red"></asp:RequiredFieldValidator><br />
                     <label class="form-label" for="custEmail">Email</label>
                    <asp:TextBox class="form-control" ID="custEmail" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" style="font-size: 15px" runat="server" ControlToValidate="custEmail" ErrorMessage="Email is required" ForeColor="Red"></asp:RequiredFieldValidator><br />
                </div>
            </div>       
             <div class="col-sm-4">
                <div class="form-outline">
                  <label class="form-label" for="custLast">Last Name</label>
                     <asp:TextBox class="form-control" ID="custLast" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" style="font-size: 15px" runat="server" ControlToValidate="custLast" ErrorMessage="Last Name is required" ForeColor="Red"></asp:RequiredFieldValidator><br />
                      <label class="form-label" for="custCity">City</label>
                    <asp:TextBox class="form-control" ID="custCity" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" style="font-size: 15px" runat="server" ControlToValidate="custCity" ErrorMessage="City is required" ForeColor="Red"></asp:RequiredFieldValidator><br />
                </div>
            </div>       
             <div class="col-sm-4">
                <div class="form-outline">
                     <label class="form-label" for="custPhone">Phone</label>
                    <asp:TextBox class="form-control" ID="custPhone" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" style="font-size: 15px" runat="server" ControlToValidate="custPhone" ErrorMessage="Phone Number is required" ForeColor="Red"></asp:RequiredFieldValidator><br />
                     <label class="form-label" for="custPostal">Postal Code</label>
                    <asp:TextBox class="form-control" ID="custPostal" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" style="font-size: 15px" runat="server" ControlToValidate="custPostal" ErrorMessage="Postal Code is required" ForeColor="Red"></asp:RequiredFieldValidator><br />
                </div>
            </div>
          </div><br /><br />
                <asp:Button ID="AddRecord_Btn" ClientIDMode="Static" runat="server" Text="Add Customer" class="btn btn-info btn-sm" OnClick="AddRecord_Btn_Click" />

             <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js" charset="utf-8">
            </script>
            <script>
                $(document).ready(function () {
                    $('#<%=AddRecord_Btn.ClientID%>').click(function (e) {
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
