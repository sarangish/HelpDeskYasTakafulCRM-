<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CaseSummary.aspx.cs" Inherits="HelpDesk.CaseSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <section class="content">
            <div class="block-header" style="background-color: silver; padding: 3px">
                <div class="row">
                    <div class="col-lg-5 col-md-5 col-sm-12">
                        <h6 style="margin: 15px">Case</h6>
                    </div>
                    <div class="col-lg-7 col-md-7 col-sm-12 text-right">

                        <button class="btn btn-white btn-icon btn-round hidden-sm-down float-right m-l-10" type="button" data-toggle="modal" data-target="#Edit-Case-Modal" runat="server" id="editcase">
                            <i class="zmdi zmdi-edit"></i>
                        </button>
                        <%--<button class="btn btn-white btn-icon btn-round hidden-sm-down float-right m-l-10" type="button">
                            <i class="zmdi zmdi-plus"></i>--%>
                        <%--</button>--%>

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <ul class="breadcrumb float-md-right" id="StatusBar" runat="server">
                                    <li class="breadcrumb-item" runat="server">
                                        <button type="button" id="NewRequest" class="btn btn-link btn-sm btnsmall" runat="server">New Request</button>
                                    </li>
                                    <li class="breadcrumb-item" runat="server">
                                        <%--<asp:Button ID="btnInprogress" CssClass="btn btn-link btn-info btn-sm btnsmall" runat="server" OnClientClick="RequestStatusUpdate" Text="In Progress" />--%>
                                        <button type="button" class="btn btn-link btn-sm btnsmall" id="Inprogress" runat="server" onclick="RequestStatusUpdate()">In Progress</button>
                                        <asp:HiddenField runat="server" ID="HiddenCaseID" />
                                    </li>
                                    <li class="breadcrumb-item" runat="server" id="Resolved">
                                        <%--<asp:Button ID="btnResolved" CssClass="btn btn-link btn-sm btnsmall" runat="server" Text="Resolved" data-toggle="modal" data-target="#Case-Close-Modal" />--%>
                                        <button id="btnResolved" class="btn btn-link btn-sm btnsmall" onclick="OpenResolvedModal()">Resolved</button>
                                    </li>
                                </ul>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>
                </div>
            </div>
            <div class="container-fluid padding-0">

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="card">

                            <div class="body">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs">
                                    <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#summary">Summary</a></li>
                                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#documents">Documents</a></li>
                                    <%--<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#tracking">Tracking</a></li>--%>
                                </ul>
                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane in active" id="summary">
                                        <b>Home Content</b>
                                        <div class="row clearfix">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="body">
                                                        <fieldset>
                                                            <div class="row clearfix" style="margin-top: 25px;">

                                                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label">
                                                                    <b>
                                                                        <asp:Label ID="lblcaserefno" runat="server" Text="Case Ref No:&nbsp"></asp:Label></b>
                                                                    <asp:Label ID="Caserefno" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label">
                                                                    <b>
                                                                        <asp:Label ID="lblCasetitle" runat="server" Text="Title:&nbsp"></asp:Label></b>
                                                                    <asp:Label ID="Casetitle" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label">
                                                                    <b>
                                                                        <asp:Label ID="lblcasedescription" runat="server" Text="Description:&nbsp"></asp:Label></b>
                                                                    <asp:Label ID="casedescription" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label">
                                                                    <b>
                                                                        <asp:Label ID="lblcasechannel" runat="server" Text="Channel:&nbsp"></asp:Label></b>
                                                                    <asp:Label ID="casechannel" runat="server"></asp:Label>
                                                                </div>

                                                            </div>

                                                            <div class="row clearfix" style="margin-top: 25px;">

                                                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label">
                                                                    <b>
                                                                        <asp:Label runat="server">Status:&nbsp</asp:Label></b>
                                                                    <asp:Label runat="server" ID="CaseStatus"></asp:Label>
                                                                    <%--<asp:DropDownList ID="ddlCaseStatus" runat="server"></asp:DropDownList>--%>
                                                                </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label">
                                                                    <b>
                                                                        <asp:Label ID="lblcustmobilenumber" runat="server" Text="Mobile Number:&nbsp"></asp:Label></b>
                                                                    <asp:Label ID="custmobilenumber" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label">
                                                                    <b>
                                                                        <asp:Label ID="lblcasecreatedon" runat="server" Text="Created On:&nbsp"></asp:Label></b>
                                                                    <asp:Label ID="casecreatedon" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label">
                                                                    <b>
                                                                        <asp:Label ID="lblcasecreatedby" runat="server" Text="Created By:&nbsp"></asp:Label></b>
                                                                    <asp:Label ID="casecreatedby" runat="server"></asp:Label>
                                                                </div>

                                                            </div>

                                                            <div class="row clearfix" style="margin-top: 25px;">

                                                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label">
                                                                    <b>
                                                                        <asp:Label ID="lblcasecustomerid" runat="server" Text="Customer :&nbsp"></asp:Label></b>
                                                                    <asp:Label ID="casecustomerid" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label">
                                                                    <b>
                                                                        <asp:Label ID="lblcaseassignedto" runat="server" Text="Assigned To:&nbsp"></asp:Label></b>
                                                                    <asp:Label ID="caseassignedto" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label">
                                                                    <b>
                                                                        <asp:Label ID="lblcasepriority" runat="server" Text="Priority:&nbsp"></asp:Label></b>
                                                                    <asp:Label ID="casepriority" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label">
                                                                    <b>
                                                                        <asp:Label ID="lblcasesolution" runat="server" Text="Solution:&nbsp"></asp:Label></b>
                                                                    <asp:Label ID="casesolution" runat="server"></asp:Label>
                                                                </div>

                                                            </div>

                                                            <div class="row clearfix" style="margin-top: 25px;">

                                                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label">
                                                                    <b>
                                                                        <asp:Label ID="lblcaseduedate" runat="server" Text="Due Date:&nbsp"></asp:Label></b>
                                                                    <asp:Label ID="caseduedate" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label">
                                                                    <b>
                                                                        <asp:Label ID="lblcaseresoltiondate" runat="server" Text="Resolution Date:&nbsp"></asp:Label></b>
                                                                    <asp:Label ID="caseresolutiondate" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label">
                                                                    <b>
                                                                        <asp:Label ID="lblcuststatus" runat="server" Text="Stage"></asp:Label></b>
                                                                    <asp:Label ID="custstatus" runat="server"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-3 form-control-label">
                                                                    <b>
                                                                        <asp:Label ID="lblcustcreatedby" runat="server" Text="Updated By:&nbsp"></asp:Label></b>
                                                                    <asp:Label ID="lblcaseupdatedby" runat="server"></asp:Label>
                                                                </div>

                                                            </div>


                                                        </fieldset>


                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="documents">
                                        <b>Documents</b>
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="doc">
                                                <div class="row clearfix" id="filupld" runat="server">
                                                </div>
                                            </div>
                                            <!-- File Upload | Drag & Drop OR With Click & Choose -->
                                            <div class="row clearfix" style="text-align: center">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="card">

                                                        <div class="body">
                                                            <asp:FileUpload runat="server" ID="UploadImages" class="btn btn-default" AllowMultiple="true" />
                                                            <asp:Button runat="server" ID="uploadedFile" class="btn btn-default" Text="Upload" OnClick="uploadedFile_Click" />

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <asp:Label ID="listofuploadedfiles" runat="server" />
                                                </div>
                                            </div>
                                            <!-- #END# File Upload | Drag & Drop OR With Click & Choose -->

                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="tracking">
                                        <b>Tracking</b>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <%--EDIT CASE DETAILS--%>

        <div class="modal fade" id="Edit-Case-Modal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                          <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="title">Edit Case</h4>

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
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txteditcasetitle" runat="server" class="form-control" placeholder="Title"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Customer</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtcustomerdet" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row clearfix">
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Description</label>
                                                </div>
                                                <div class="col-lg-8 col-md-8 col-sm-12">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txteditcasediscription" runat="server" class="form-control" placeholder="Description" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row clearfix">
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Channel</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="ddlcasechannel" CssClass="form-control show-tick ms select2" runat="server"></asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Status</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="ddleditcasestatus" CssClass="form-control show-tick ms select2" runat="server"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row clearfix">
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Assigned To</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="ddlAssignedTo" CssClass="form-control show-tick ms select2" runat="server">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Priority</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6">
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="ddlPriority" CssClass="form-control show-tick ms select2" runat="server">
                                                            <asp:ListItem>High</asp:ListItem>
                                                            <asp:ListItem>Medium</asp:ListItem>
                                                            <asp:ListItem>Low</asp:ListItem>
                                                        </asp:DropDownList>
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
                                    <asp:Button ID="btnUpdateCase" CssClass="btn btn-default" runat="server" Text="Save" OnClick="btnUpdateCase_Click" />
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </p>
                            </div>
                        </div>
                        <div id="divMsg2" runat="server">
                            <asp:Label ID="lblMsg2" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
        </div>

        <div class="modal fade" id="Case-Close-Modal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="title">Add Solution</h4>
                    </div>
                    <div class="">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="card">
                                    <div class="body">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <fieldset>
                                                    <div class="row clearfix">
                                                        <div class="col-lg-8 col-md-8 col-sm-10 form-control-label">
                                                            <label for="title">Select Solution</label>
                                                        </div>
                                                    </div>
                                                    <div class="row clearfix">
                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                            <div class="form-group">
                                                                <asp:DropDownList ID="ddlSolution" CssClass="form-control show-tick ms select2" runat="server" OnSelectedIndexChanged="ddlSolution_SelectedIndexChanged" AutoPostBack="true">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row clearfix">
                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                            <div class="form-group">
                                                                <asp:TextBox ID="txtNewSolution" runat="server" class="form-control" placeholder="Description" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                                            </div>
                                                            <div class="form-group checkbox">
                                                                <asp:CheckBox ID="cbAddToSolution" Text="Add to Solution" runat="server" OnCheckedChanged="cbAddToSolution_CheckedChanged" AutoPostBack="true" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row clearfix">
                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                            <div class="form-group">
                                                                <asp:TextBox ID="txtnewsolutiontitle" runat="server" class="form-control" placeholder="New Solution Title" Visible="false"></asp:TextBox>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="row clearfix">
                                                        <div class="col-lg-8 col-md-8 col-sm-10">
                                                            <p>
                                                                <asp:Button ID="btnUpdateSolution" CssClass="btn btn-default" runat="server" Text="Update" OnClick="btnUpdateSolution_Click" />
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div id="dvMsg" class="alert alert-success" runat="server" visible="false">
                                                        <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                                    </div>

                                                </fieldset>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
