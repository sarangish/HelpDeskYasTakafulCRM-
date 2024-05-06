<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchCustomer.aspx.cs" Inherits="HelpDesk.SearchCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <form runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:HiddenField runat="server" ID="HiddenAction" />


        <section class="content home">
            <div class="container-fluid">

                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12">
                        <div class="">
                            <div class="alert alert-success" id="alert" style="display: none">
                            </div>
                        </div>
                        <div class="card">
                            <div class="header">
                                <strong>Search Customer</strong>
                            </div>


                            <div class="body search">


                                <div class="row clearfix">
                                    <div class="col-sm-3">

                                        <div class="form-group">
                                            <label>Customer Name</label>
                                            <asp:TextBox ID="txtCustomerName" class="form-control" placeholder="Customer Name" runat="server"></asp:TextBox>
                                        </div>

                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label>Email ID</label>
                                            <asp:TextBox ID="txtCustomerEmail" class="form-control" placeholder="Email ID" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label>Phone No</label>
                                            <asp:TextBox ID="txtCustomerPhone" class="form-control" placeholder="Phone No" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <br />
                                            <asp:Button ID="btnSearch" runat="server" class="btn btn-default" Text="Search" OnClick="serachcustomer_Click" />
                                            <button type="button" data-toggle="modal" class="btn btn-default" data-target="#Add-Customer-Modal">Create Customer</button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <asp:GridView ID="grdcustomer" runat="server" AutoGenerateColumns="false" CssClass="table table-striped " OnPageIndexChanging="grdcustomer_PageIndexChanging" AllowPaging="true" PageSize="10">
                                <Columns>


                                    <asp:TemplateField HeaderText="Customer Name">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbCustomer" Text='<%# Bind("Cust_CustomerFirstName") %>' runat="server" OnCommand="lbCustomer_Command" CommandArgument='<%# Bind("Cust_CustomerID") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Email" DataField="Cust_EmailID" />
                                    <asp:BoundField HeaderText="Home Number" DataField="Cust_Emirate" />
                                    <asp:BoundField HeaderText="Mobile Number" DataField="Cust_Mobile" />
                                    <asp:BoundField HeaderText="Office Number" DataField="Cust_OfficeNum" />
                                </Columns>
                                <HeaderStyle CssClass="l-slategray grvHeader" />
                            </asp:GridView>


                        </div>
                    </div>
                </div>
            </div>

        </section>
        <%--ADD CUSTOMER DETAILS--%>

        <div class="modal fade" id="Add-Customer-Modal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="title">New Customer</h4>
                            </div>
                            <div class="">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <div class="card">
                                            <div class="body">
                                                <fieldset>
                                                    <asp:HiddenField ID="hdnCustID" runat="server" />
                                                    <div class="row clearfix">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                            <label for="title">Title</label>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                                            <div class="form-group">
                                                                <asp:DropDownList ID="ddlCustTitle" CssClass="form-control show-tick ms select2" runat="server">
                                                                    <asp:ListItem>Mr.</asp:ListItem>
                                                                    <asp:ListItem>Ms.</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                                        </div>
                                                    </div>
                                                    <div class="row clearfix">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                            <label for="title">First Name</label>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                                            <div class="form-group">
                                                                <%--<asp:RequiredFieldValidator ControlToValidate="txtFname" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your name"></asp:RequiredFieldValidator>--%>
                                                                <asp:TextBox ID="txtFname" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                                <span id="spanContentPlaceholder1_txtFname"></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                            <label for="title">Middle Name</label>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                                            <div class="form-group">
                                                                <asp:TextBox ID="txtMName" runat="server" class="form-control" placeholder="Middle Name"></asp:TextBox>
                                                                <span id="spanContentPlaceholder1_txtMName"></span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row clearfix">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                            <label for="title">Last Name</label>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                                            <div class="form-group">
                                                                <asp:TextBox ID="txtLName" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                            <label for="title">Email ID</label>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                                            <div class="form-group">
                                                                <asp:TextBox ID="txtEmailID" runat="server" class="form-control" placeholder="Email ID"></asp:TextBox>
                                                                <span id="spanContentPlaceholder1_txtEmailID"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row clearfix">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                            <label for="title">P Phone</label>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                                            <div class="form-group">
                                                                <asp:TextBox ID="txtprimaryPhone" runat="server" class="form-control" placeholder="Primary Phone"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <%--change by sarang-----------------------%>
                                                        <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                            <label for="title">Emirate</label>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                                            <div class="form-group">
                                                                <asp:TextBox ID="txtEmirate" runat="server" class="form-control" placeholder="Emirate"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <%--c--------------------------------------%>
                                                    </div>
                                                    <div class="row clearfix">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                            <label for="title">Work Phone</label>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                                            <div class="form-group">
                                                                <asp:TextBox ID="txtWorkPhone" runat="server" class="form-control" placeholder="Work Phone"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <%--change by sarang-----------------------%>
                                                        <div class="col-lg-2">
                                                            <label for="channel">Nationality</label>
                                                        </div>
                                                        <div class="col-lg-4">
                                                            <div class="form-group">
                                                                <asp:TextBox ID="txtNationality" runat="server" class="form-control" placeholder="Nationality"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <%--c--------------------------------------%>
                                                        <%--<div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Facebook ID</label>
                                                      <asp:Label ID="facebookid" runat="server" Text="Facebook ID"></asp:Label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtFBID" runat="server" class="form-control" placeholder="facebook ID" Visible="false"></asp:TextBox>
                                                    </div>
                                                </div>--%>
                                                    </div>
                                                    <%--<div class="row clearfix">                                             
                                                 <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Instagram ID </label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtInstaID" runat="server" class="form-control" placeholder="Instagram ID" Visible="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                                 <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Twitter ID</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtTwitterID" runat="server" class="form-control" placeholder="Twitter ID" Visible="false"></asp:TextBox>
                                                    </div>
                                                </div>

                                            </div>--%>

                                                    <div class="row clearfix">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                            <label for="title">Company</label>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                                            <div class="form-group">
                                                                <asp:TextBox ID="txtCompany" runat="server" class="form-control" placeholder="Company"></asp:TextBox>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <%--change by sarang-----------------------%>
                                                    <div class="row clearfix">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                            <label>Product Category</label>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                                            <div class="form-group">
                                                                <asp:CheckBoxList ID="chkProductCategory" runat="server">
                                                                    <asp:ListItem Text="<span style='margin-left: 10px;'>Motor Insurance</span>" Value="Motor"></asp:ListItem>
                                                                    <asp:ListItem Text="<span style='margin-left: 10px;'>Medical Insurance</span>" Value="Medical"></asp:ListItem>
                                                                    <asp:ListItem Text="<span style='margin-left: 10px;'>Other Insurance</span>" Value="Other"></asp:ListItem>
                                                                </asp:CheckBoxList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%--c--------------------------------------%>
                                                    <%--change by sarang-----------------------%>
                                                    <div class="row clearfix">
                                                        <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                            <label for="title">Notes</label>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-8">
                                                            <div class="form-group">
                                                                <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Rows="3" class="form-control" placeholder="Enter important notes"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%--c--------------------------------------%>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="dvMsg" class="alert alert-success" runat="server" visible="false">
                                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-md-8 col-lg-8">
                                    </div>
                                    <div class="col-md-4 col-lg-4">
                                        <p>
                                            <button type="button" class="btn btn-default" onclick="AddCustomer()">Save</button>
                                            <asp:Button ID="btnAddCustomer" CssClass="btn btn-default" runat="server" Text="Save" Style="display: none" OnClick="btnAddCustomer_Click" />
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>



            </div>
        </div>
        <div id="divMsgMain" class="alert alert-success" runat="server" visible="false">
            <asp:Label ID="lblMsgmain" runat="server"></asp:Label>
        </div>


        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
        <script>

            $(document).ready(function () {
                $('#<%=dvMsg.ClientID%>').fadeOut(10000, function () {
                    $(this).html("");
                });

                var action = $("#ContentPlaceholder1_HiddenAction").val();
                if (action !== undefined && action !== null && action !== "") {
                    $('#alert').css('display', 'block');
                }

                $('.swal2-select').hide();
            });
        </script>
        <script>
            <%--document.getElementById('<%= .facebookid%>').style.visibility = "hidden"; --%>
</script>
    </form>


</asp:Content>
