<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerSummary.aspx.cs" Inherits="HelpDesk.CustomerSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <form runat="server">
    <section class="content">
        <style>
            .block-header {
            padding: 3px;
        }
        </style>
        <div class="block-header" style="background-color:silver" >
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <h6>Customer</h6>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6" style="text-align:right">
                    <button type="button" class="btn btn-primary btn-round"  data-toggle="modal" data-target="#Create-Case-Modal">
                                <%--<i class="zmdi zmdi-plus-circle"></i>--%>
                        Create Case
                            </button>
                    <button type="button" class="btn btn-primary btn-round" style="margin-bottom: -10px; margin-top: -10px; margin-left: 10px;" data-toggle="modal" data-target="#Edit-Customer-Modal">
                                <%--<i class="zmdi zmdi-edit"></i>--%> Edit Customer
                            </button>
                   
                   <%-- <ul class="breadcrumb float-md-right" style="height:20px">
                        <li class="breadcrumb-item" style="margin:-10px"><a href="index.html">New </a></li>
                        <li class="breadcrumb-item" style="margin:-10px"><a href="javascript:void(0);">Edit</a></li>
                    </ul>--%>
                </div>

            </div>
        </div>
        <div class="container-fluid padding-0">
            <div class="row clearfix">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="body">
                            <fieldset>
                            <div class="row clearfix" style="margin-top:25px;">
                                
                                    <div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                        <b><asp:Label ID="lblcustid" runat="server" Text="Customer ID:&nbsp"></asp:Label></b>
                                        <asp:Label ID="Customerid" runat="server" ></asp:Label>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                        <b><asp:Label ID="lblCustfirstname" runat="server" Text="First Name:&nbsp"></asp:Label></b>
                                        <asp:Label ID="Custfirstname" runat="server" ></asp:Label>
                                    </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                        <b><asp:Label ID="lblcustmiddlename" runat="server" Text="Middle Name:&nbsp"></asp:Label></b>
                                        <asp:Label ID="custmiddlename" runat="server"></asp:Label>
                                    </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                        <b><asp:Label ID="lblcustlastname" runat="server" Text="Last Name:&nbsp"></asp:Label></b>
                                        <asp:Label ID="custlastname" runat="server"></asp:Label>
                                    </div>
                                
                            </div>

                                <div class="row clearfix" style="margin-top:25px;">
                                
                                    <div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                        <b><asp:Label ID="lblofficenumber" runat="server" Text="Office Number:&nbsp"></asp:Label></b>
                                        <asp:Label ID="custofficenumber" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                        <b><asp:Label ID="lblcustmobilenumber" runat="server" Text="Mobile Number:&nbsp"></asp:Label></b>
                                        <asp:Label ID="custmobilenumber" runat="server"></asp:Label>
                                    </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                        <b><asp:Label ID="lblcusthomenumber" runat="server" Text="Home Number:&nbsp"></asp:Label></b>
                                        <asp:Label ID="custhomenumber" runat="server"></asp:Label>
                                    </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                        <b><asp:Label ID="lblcustemail" runat="server" Text="Email:&nbsp"></asp:Label></b>
                                        <asp:Label ID="custemail" runat="server"></asp:Label>
                                    </div>
                                
                            </div>

                                <div class="row clearfix" style="margin-top:25px;">
                                
                                    <div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                        <b><asp:Label ID="lblcustlocation" runat="server" Text="Location:&nbsp"></asp:Label></b>
                                        <asp:Label ID="custlocation" runat="server" Text="123"></asp:Label>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                       <b><asp:Label ID="lblcustpobox" runat="server" Text="PO BOX Number:&nbsp"></asp:Label></b>
                                        <asp:Label ID="custpobox" runat="server" Text="123"></asp:Label>
                                    </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                        <b><asp:Label ID="lblcustcompany" runat="server" Text="Company Name:&nbsp"></asp:Label></b>
                                        <asp:Label ID="custcompany" runat="server" Text="123"></asp:Label>
                                    </div>
                                <%--<div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                       <b> <asp:Label ID="lblcusttwitter" runat="server" Text="Twitter:&nbsp"></asp:Label></b>
                                        <asp:Label ID="custtwitter" runat="server" Text="123"></asp:Label>
                                    </div>--%>
                                
                            </div>

                                <div class="row clearfix" style="margin-top:25px;">
                                
                                   <%-- <div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                       <b> <asp:Label ID="lblcustfacebook" runat="server" Text="Facebook:&nbsp"></asp:Label></b>
                                        <asp:Label ID="custfacebook" runat="server" Text="123"></asp:Label>
                                    </div>--%>
                                    <div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                        <b><asp:Label ID="lblcustlinkdin" runat="server" Text="LinkdIn:&nbsp"></asp:Label></b>
                                        <asp:Label ID="custlinkdin" runat="server" Text="123"></asp:Label>
                                    </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                       <b> <asp:Label ID="lblcuststatus" runat="server" Text="Status:&nbsp"></asp:Label></b>
                                        <asp:Label ID="custstatus" runat="server" Text="123"></asp:Label>
                                    </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                       <b> <asp:Label ID="lblcustcreatedby" runat="server" Text="Created By:&nbsp"></asp:Label><//b>
                                        <asp:Label ID="custcreatedby" runat="server" Text="123"></asp:Label>
                                    </div>
                                
                            </div>

                                <div class="row clearfix" style="margin-top:25px;">
                                
                                    <div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                      <b>  <asp:Label ID="lblcustcreatedon" runat="server" Text="Created On:&nbsp"></asp:Label></b>
                                        <asp:Label ID="custcreatedon" runat="server" Text="123"></asp:Label>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                        <b><asp:Label ID="lblcustupdatedby" runat="server" Text="Updated By:&nbsp"></asp:Label></b>
                                        <asp:Label ID="custupdatedby" runat="server" Text="123"></asp:Label>
                                    </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                       <b> <asp:Label ID="lblcustupdatedon" runat="server" Text="Updated On:&nbsp"></asp:Label></b>
                                        <asp:Label ID="custupdatedon" runat="server" Text="123"></asp:Label>
                                    </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label" >
                                    </div>
                                
                            </div>
                            </fieldset>
                        </div>
                        <h4>Case List</h4>
                        <asp:GridView ID="grdcustomercase" runat="server" AutoGenerateColumns="false" CssClass="table table-striped" PageSize="5" AllowPaging="true" OnPageIndexChanging="grdcustomercase_PageIndexChanging">
                                <Columns>
                                    
                                    <asp:TemplateField HeaderText="Ref No">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblcaseref" Text='<%# Bind("Ca_RefNo") %>' runat="server" OnCommand="lblcaseref_Command" CommandArgument='<%# Bind("Ca_CaseID") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Title" DataField="Ca_Title"/>
                                    <asp:BoundField HeaderText="Case Description" DataField="Ca_CaseDescription"/>
                                    <asp:BoundField HeaderText="Channel" DataField="Ca_Channel"/>
                                    <asp:BoundField HeaderText="Created By" DataField="Username"/>
                                </Columns>
                               <%--<FooterStyle BackColor="#99CCCC" ForeColor="#003399" />--%>
                                <HeaderStyle CssClass="l-slategray" />
                                 <%--<PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                <RowStyle BackColor="White" ForeColor="#003399" />
                                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                <SortedDescendingHeaderStyle BackColor="#002876" />--%>
                            </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </section>
        <%--CREATE NEW CASE POPUP--%>
        <div class="modal fade" id="Create-Case-Modal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="title">New Case</h4>
                    </div>
                    <div class="">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="card">
                                    <div class="body">
                                        <fieldset>

                                            <div class="row clearfix">
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Title</label>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-8">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtCaseTitleNew" runat="server" class="form-control" placeholder="Title"></asp:TextBox>
                                                       <%-- <asp:RequiredFieldValidator ID="pass" runat="server" ControlToValidate="txtCaseTitleNew" ErrorMessage="Please enter the title" ForeColor="Red"></asp:RequiredFieldValidator>--%> 
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row clearfix">
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="casedescription">Description</label>
                                                </div>
                                                <div class="col-lg-8 col-md-8 col-sm-10">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtCaseDescriptionNew" runat="server" CssClass="form-control" placeholder="Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                                        <%--<asp:RequiredFieldValidator ID="Requiredcasediscription" runat="server" ControlToValidate="txtCaseDescriptionNew" ErrorMessage="Please enter the description" ForeColor="Red"></asp:RequiredFieldValidator> --%>
                                                    </div>
                                                </div>


                                            </div>

                                            <div class="row clearfix">
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="channel">Assigned To</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-3">
                                                    <asp:DropDownList ID="ddlAssigned" CssClass="form-control show-tick ms select2" runat="server">
                                                    </asp:DropDownList>
                                                   
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="channel">Priority</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-3">

                                                    <asp:DropDownList ID="ddlPriority" CssClass="form-control show-tick ms select2" runat="server">
                                                        <asp:ListItem>High</asp:ListItem>
                                                        <asp:ListItem>Medium</asp:ListItem>
                                                        <asp:ListItem>Low</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>

                                            </div>

                                            <div class="row clearfix">
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Due Date</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-4">
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="zmdi zmdi-calendar"></i>
                                                </span>
                                                <asp:TextBox ID="txtDueDate" runat="server" class="form-control datetimepicker" placeholder="Please choose the date"></asp:TextBox>
                                            </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <label for="channel">Channel</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:DropDownList ID="ddlChannels" CssClass="form-control show-tick ms select2" runat="server">
                                                        <asp:ListItem>Call</asp:ListItem>
                                                        <asp:ListItem>Facebook</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="row clearfix">
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-4">
                                                    
                                                </div>
                                                <div class="col-lg-2">
                                                    <asp:FileUpload  id="frmFileUpload" class="dropzone" method="post"  runat="server"/>
                                                </div>
                                                <div class="col-lg-3 ">

                    </div>
                                                </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row clearfix">
                            <div class="col-md-8 col-lg-8">
                            </div>
                            <div class="col-md-4 col-lg-4">
                                <p>
                                    <asp:Button ID="btnSaveNewCase" CssClass="btn btn-default" runat="server" Text="Save" OnClick="btnSaveNewCase_Click" />
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <%--EDIT CUSTOMER DETAILS--%>

            <div class="modal fade" id="Edit-Customer-Modal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="title">Edit Customer</h4>
                    </div>
                    <div class="">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="card">
                                    <div class="body">
                                        <fieldset>

                                            <div class="row clearfix">
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">First Name</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtFname" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                                    </div>
                                                </div>
                                                 <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Middle Name</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtMName" runat="server" class="form-control" placeholder="Middle Name"></asp:TextBox>
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
                                                    </div>
                                                </div>
                                            </div>
                                             <div class="row clearfix">
                                                  <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Phone Home</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txthomePhone" runat="server" class="form-control" placeholder="Primary Phone"></asp:TextBox>
                                                    </div>
                                                </div>
                                                 <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Phone Mobile</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtmoblePhone" runat="server" class="form-control" placeholder="Secondary Phone"></asp:TextBox>
                                                    </div>
                                                </div>
                                                 </div>
                                            <div class="row clearfix">                                              
                                                 <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Work Phone</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtofficePhone" runat="server" class="form-control" placeholder="Work Phone"></asp:TextBox>
                                                    </div>
                                                </div>
                                                 <%-- <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Facebook ID</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtFBID" runat="server" class="form-control" placeholder="facebook ID"></asp:TextBox>
                                                    </div>
                                                </div>--%>
                                                 <div class="col-lg-2">
                                                    <label for="channel">PO Box</label>
                                                </div>
                                                <div class="col-lg-4">
                                                   <div class="form-group">
                                                        <asp:TextBox ID="txtPOBox" runat="server" class="form-control" placeholder="PO Box"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                             <%--<div class="row clearfix">                                             
                                                 <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Instagram ID</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtInstaID" runat="server" class="form-control" placeholder="Instagram ID"></asp:TextBox>
                                                    </div>
                                                </div>
                                                 <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Twitter ID</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtTwitterID" runat="server" class="form-control" placeholder="Twitter ID"></asp:TextBox>
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
                                            <div class="row clearfix">
                                                 <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Address</label>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-8">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" class="form-control" placeholder="Location"></asp:TextBox>
                                                    </div>
                                                </div>
                                                </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row clearfix">
                            <div class="col-md-8 col-lg-8">
                            </div>
                            <div class="col-md-4 col-lg-4">
                                <p>
                                    <asp:Button ID="btnUpdateCust" CssClass="btn btn-default" runat="server" Text="Save" OnClick="btnUpdateCust_Click" />
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div id="dvMsg" runat="server">
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>

        </form>
</asp:Content>
