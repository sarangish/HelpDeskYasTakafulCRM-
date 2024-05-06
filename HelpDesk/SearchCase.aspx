<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchCase.aspx.cs" Inherits="HelpDesk.SearchCase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <form runat="server">
        <section class="content home">
            <div class="container-fluid">

                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12">
                        <div class="card">
                            <div class="header">
                                <strong>Search Case</strong>
                            </div>
                            <div class="body search">
                                <div class="row clearfix">
                                    <div class="col-sm-3">
                                        <asp:HiddenField ID="hdnCustID" runat="server" />
                                        <div class="form-group">
                                            <label>Case Ref No</label>
                                            <asp:TextBox ID="txtCaseRefNo" class="form-control" placeholder="Case Ref No" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label>Created Date</label>
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="zmdi zmdi-calendar"></i>
                                                </span>
                                                <asp:TextBox ID="txtcasecreateddate" runat="server" class="form-control datetimepicker" placeholder="Please choose the date"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label>Customer</label>
                                            <asp:DropDownList ID="ddlStatus" CssClass="form-control show-tick ms select2" runat="server">

                                                <asp:ListItem>ALL</asp:ListItem>
                                                <asp:ListItem>NewRequest</asp:ListItem>
                                                <asp:ListItem>InProgress</asp:ListItem>
                                                <asp:ListItem>Resolved</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <br />
                                            <asp:Button ID="btnSearch" runat="server" class="btn btn-default" Text="Search" OnClick="btnSearch_Click" />
                                            <button type="button" data-toggle="modal" class="btn btn-default" data-target="#Create-Case-Modal">Create Case</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <asp:GridView ID="grdcase" runat="server" AutoGenerateColumns="false" CssClass="table table-striped" AllowPaging="true" PageSize="10"  OnPageIndexChanging="grdcase_PageIndexChanging">
                                <Columns>

                                    <asp:TemplateField HeaderText="Case Name">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblCase" Text='<%# Bind("Ca_Title") %>' runat="server" OnCommand="lblCase_Command" CommandArgument='<%# Bind("Ca_Caseid") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="RefNo" DataField="Ca_RefNo" />
                                    <asp:BoundField HeaderText="Title" DataField="Ca_Title" />
                                    <asp:BoundField HeaderText="Description" DataField="Ca_CaseDescription" />
                                    <asp:BoundField HeaderText="STatus" DataField="Ca_Status" />
                                </Columns>
                                <HeaderStyle CssClass="l-slategray grvHeader" />
                                <%--<FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
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

        <%--ADD CASE DETAILS--%>

        <%--<div class="modal fade" id="Add-Customer-Modal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
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
                                                    <label for="title">P Phone</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtprimaryPhone" runat="server" class="form-control" placeholder="Primary Phone"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">S Phone</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtSecondaryPhone" runat="server" class="form-control" placeholder="Secondary Phone"></asp:TextBox>
                                                    </div>
                                                </div>
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
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Facebook ID</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtFBID" runat="server" class="form-control" placeholder="facebook ID"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row clearfix">
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

                                            </div>

                                            <div class="row clearfix">
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Company</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-4">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtCompany" runat="server" class="form-control" placeholder="Company"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <label for="channel">PO Box</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtPOBox" runat="server" class="form-control" placeholder="PO Box"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row clearfix">
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Location</label>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-8">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtLocation" runat="server" TextMode="MultiLine" Rows="3" class="form-control" placeholder="Location"></asp:TextBox>
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
                                    <asp:Button ID="btnAddCase" CssClass="btn btn-default" runat="server" Text="Save" OnClick="btnAddCase_Click" />
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>--%>


        <div class="modal fade" id="Create-Case-Modal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
                <fieldset>
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="title">New Case</h4>
                        </div>
                        <div class="">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="card">
                                        <div class="body">
                                            <div>

                                                <div class="row clearfix">
                                                    <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                        <label for="title">Title</label>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-4">
                                                        <div class="form-group">
                                                            <asp:TextBox ID="txtCaseTitleNew" runat="server" class="form-control" placeholder="Title"></asp:TextBox>
                                                            <span id="spanContentPlaceholder1_txtCaseTitleNew"></span>

                                                        </div>
                                                    </div>


                                                    <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                        <label for="title">Customer</label>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-3">
                                                        <asp:DropDownList ID="ddlcustomer" class="form-control show-tick ms select2" data-placeholder="Select" runat="server">
                                                        </asp:DropDownList>
                                                        <span id="spansid_ContentPlaceholder1_ddlAssigned"></span>
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
                                                        <span id="spanContentPlaceholder1_txtCaseDescriptionNew"></span>
                                                    </div>
                                                </div>


                                            </div>

                                            <div class="row clearfix">
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="channel">Assigned To</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-3">
                                                    <asp:DropDownList ID="ddlAssigned" class="form-control show-tick ms select2" data-placeholder="Select" runat="server">
                                                    </asp:DropDownList>
                                                    <span id="spans2id_ContentPlaceholder1_ddlAssigned"></span>
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="channel">Priority</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-3">

                                                    <asp:DropDownList ID="ddlPriority" CssClass="form-control show-tick ms select2" runat="server">

                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem>High</asp:ListItem>
                                                        <asp:ListItem>Medium</asp:ListItem>
                                                        <asp:ListItem>Low</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <span id="spans2id_ContentPlaceholder1_ddlPriority"></span>
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
                                                        <asp:ListItem></asp:ListItem>
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
                                                    <asp:FileUpload ID="frmFileUpload" class="dropzone" method="post" runat="server" OnClick="" />
                                                </div>
                                                <div class="col-lg-3 ">


                                                    <%-- <div class="dz-message"> </div>--%>
                                                </div>
                                            </div>

                                            <div class="row clearfix">
                                                <div class="col-md-8 col-lg-8">
                                                </div>
                                                <div class="col-md-4 col-lg-4">
                                                    <p>
                                                        <button type="button" class="btn btn-default" onclick="AddCase()">Save</button>
                                                        <asp:Button ID="btnSaveNewCase" CssClass="btn btn-default" Style="display: none" runat="server" Text="Save" OnClick="btnAddCase_Click" />
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                    </p>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>



                </fieldset>
            </div>
        </div>


        <div id="dvMsg" class="notification" runat="server" visible="false">
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
        <script>

            $(document).ready(function () {
                $('#<%=dvMsg.ClientID%>').fadeOut(10000, function () {
                    $(this).html("");
                });


                $('[data-remarks]').click(function (e) {
                    var remark = $(this).attr('data-remarks');
                    $('#ContentPlaceholder1_lblRemarks').html(remark);
                    $('#RemarksModal').modal('show');

                    e.preventDefault();
                });

            });
        </script>
    </form>


</asp:Content>
