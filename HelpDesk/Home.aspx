<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HelpDesk.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <form id="form_validation" method="POST" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <section class="content home">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 col-md-12">
                        <div class="row clearfix">
                            <div class="col-lg-12 col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h2><strong>
                                            <asp:Label ID="lblfullname" runat="server" Font-Size="18px"></asp:Label></strong>&nbsp;
                                    <a href="#" style="color: cornflowerblue"><i class="zmdi zmdi-twitter"></i></a>&nbsp;
                                    <a href="#" style="color: #0e41a1"><i class="zmdi zmdi-facebook"></i></a>&nbsp;
                                   <a href="#" style="color: #e31f54"><i class="zmdi zmdi-instagram"></i></a>
                                        </h2>
                                        <ul class="header-dropdown" style="display:none">
                                            <li>
                                                <a role="button"><i class="material-icons">sentiment_dissatisfied</i></a>
                                            </li>
                                            <li>
                                                <a role="button"><i class="material-icons">sentiment_neutral</i></a>
                                            </li>
                                            <li>
                                                <a role="button"><i class="material-icons">sentiment_satisfied</i></a>
                                            </li>
                                            <li>
                                                <a role="button"><i class="material-icons">sentiment_very_dissatisfied</i></a>
                                            </li>
                                            <li>
                                                <a role="button"><i class="material-icons">sentiment_very_satisfied</i></a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="body">
                                        <div class="row">
                                            <div class="col-lg-4" style="margin-top: -35px">
                                                <fieldset>
                                                    <asp:HiddenField ID="hdnCustID" runat="server" />
                                                    <div class="row clearfix" style="margin-top: 25px;">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 form-control-label">
                                                            <b>
                                                                <asp:Label ID="lblcustemail" runat="server" Text="Email:&nbsp"></asp:Label></b>
                                                            <a href="mailto:" id="custemail" runat="server" Style="color:brown;font-size: 12px"></a>
                                                        </div>
                                                        <div class="col-lg-12 col-md-12 col-sm-12 form-control-label">
                                                            <b>
                                                                <asp:Label ID="lblcustmobilenumber" runat="server" Text="Mobile Number:&nbsp"></asp:Label></b>
                                                            <asp:LinkButton ID="custmobilenumber" runat="server" data-toggle="collapse" href="#collapseExample" aria-expanded="false" Style="color:brown;font-size: 12px"></asp:LinkButton>
                                                            <div class="collapse" id="collapseExample">
                                                                <div class="well">
                                                                    <a href="#">
                                                                        <i class="zmdi zmdi-comment-text col-red" data-toggle="modal" data-target="#SendMessageModal" "></i>
                                                                    </a>
                                                                    <a href="tel:<%= custmobilenumber.Text%>" style="margin-left:10px">
                                                                        <i class="zmdi zmdi-phone text-success"></i>
                                                                    </a>



                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                            <b>
                                                                <asp:Label ID="lblofficenumber" runat="server" Text="Office Number:&nbsp"></asp:Label></b>
                                                            <asp:Label ID="custofficenumber" runat="server" Text="123"></asp:Label>
                                                        </div>

                                                        <div class="col-lg-12 col-md-12 col-sm-12 form-control-label">
                                                            <b>
                                                                <asp:Label ID="lblcusthomenumber" runat="server" Text="Home Number:&nbsp"></asp:Label></b>
                                                            <asp:Label ID="custhomenumber" runat="server" Text="123"></asp:Label>
                                                        </div>


                                                    </div>

                                                    <div class="row clearfix">

                                                        <div class="col-lg-12 col-md-12 col-sm-12 form-control-label">
                                                            <b>
                                                                <asp:Label ID="lblcustlocation" runat="server" Text="Location:&nbsp"></asp:Label></b>
                                                            <asp:Label ID="custlocation" runat="server" Text="123"></asp:Label>
                                                        </div>
                                                        <div class="col-lg-12 col-md-12 col-sm-12 form-control-label">
                                                            <b>
                                                                <asp:Label ID="lblcustpobox" runat="server" Text="PO BOX Number:&nbsp"></asp:Label></b>
                                                            <asp:Label ID="custpobox" runat="server" Text="123"></asp:Label>
                                                        </div>
                                                        <div class="col-lg-12 col-md-12 col-sm-12 form-control-label">
                                                            <b>
                                                                <asp:Label ID="lblcustcompany" runat="server" Text="Company Name:&nbsp"></asp:Label></b>
                                                            <asp:Label ID="custcompany" runat="server" Text="123"></asp:Label>
                                                        </div>

                                                    </div>
                                                </fieldset>
                                            </div>


                                            <div class="col-lg-8" style="margin-top: -35px">
                                                <h6>Call Remarks.
                                                    <button type="button" class="btn-icon-mini" style="margin-left: 10px;" data-toggle="modal" data-target="#Create-Remarks-Modal">
                                                        <i class="zmdi zmdi-plus-circle"></i>
                                                    </button>
                                                </h6>

                                                <div class="row clearfix">
                                                    <asp:GridView ID="grvRemarks" runat="server" AutoGenerateColumns="false" CssClass="table table-striped" AllowPaging="true" OnPageIndexChanging="grvRemarks_PageIndexChanging" PageSize="3">
                                                        <Columns>

                                                            <asp:BoundField HeaderText="Called No" DataField="CalledNo" />
                                                            <asp:TemplateField HeaderText="Remarks">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lblRemarks" runat="server" data-remarks='<%# Eval("FullRemarks") %>' DataField="Remarks" Text='<%# Bind("Remarks") %>'></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField HeaderText="Event Time" DataField="EventTime" />
                                                            <asp:BoundField HeaderText="Updated By" DataField="Username" />
                                                        </Columns>
                                                        <HeaderStyle CssClass="l-slategray grvHeader" />
                                                    </asp:GridView>
                                                </div>
                                                <div class="row clearfix" style="margin-top: 25px;">
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row clearfix">
                            <div class="col-lg-12 col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <strong>Cases</strong>
                                        <button type="button" class="btn-icon-mini" style="margin-left: 10px;" data-toggle="modal" data-target="#Create-Case-Modal">
                                            <i class="zmdi zmdi-plus-circle"></i>
                                        </button>
                                    </div>
                                    <div class="body table-responsive members_profiles">
                                        <asp:GridView ID="grdcustomercase" runat="server" AutoGenerateColumns="false" CssClass="table table-striped" Style="margin-top: -30px" AllowPaging="true" OnPageIndexChanging="grdcustomercase_PageIndexChanging" PageSize="5">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Ref No">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lblcaseref" Text='<%# Bind("Ca_RefNo") %>' runat="server" OnCommand="lblcaseref_Command" CommandArgument='<%# Bind("Ca_CaseID") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="Title" DataField="Ca_Title" />
                                                <asp:BoundField HeaderText="Case Description" DataField="Ca_CaseDescription" />
                                                <asp:BoundField HeaderText="Channel" DataField="Ca_Channel" />
                                                <asp:BoundField HeaderText="Created By" DataField="username" />
                                            </Columns>
                                            <HeaderStyle CssClass="l-slategray grvHeader" />
                                        </asp:GridView>

                                    </div>
                                    <%--<div class="body">
                        <button type="button" class="btn btn-default waves-effect m-r-20" data-toggle="modal" data-target="#largeModal">MODAL - LARGE SIZE</button>
                    </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="row clearfix">
                            <div class="col-lg-12 col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <strong>Call Summary</strong>
                                    </div>
                                    <div class="body" style="padding-bottom: 5px">
                                        <table class="table" style="margin-top: -30px">
                                            <tbody>
                                                <tr>
                                                    <td><b>Calling from</b></td>
                                                    <td>
                                                        <asp:Label ID="lblCallFrom" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td><i class="zmdi zmdi-phone text-success"></i></td>
                                                </tr>
                                                <tr>
                                                    <td><b>Calling Queue</b></td>
                                                    <td>
                                                        <asp:Label ID="lblCallQueue" runat="server" Text=""></asp:Label></td>
                                                    <td><i class="zmdi zmdi-8tracks text-dark"></i></td>
                                                </tr>
                                                <tr>
                                                    <td><b>Skill</b></td>
                                                    <td>
                                                        <asp:Label ID="lblSkill" runat="server" Text=""></asp:Label></td>
                                                    <td><i class="zmdi zmdi-speaker text-warning"></i></td>
                                                </tr>
                                                <tr>
                                                    <td><b>Last Contacted on</b></td>
                                                    <td>
                                                        <asp:Label ID="lblLastContactedOn" runat="server" Text=""></asp:Label></td>
                                                    <td><i class="zmdi zmdi-phone-end text-danger"></i></td>
                                                </tr>
                                                <tr>
                                                    <td><b>Last Agent</b></td>
                                                    <td>
                                                        <asp:Label ID="lblLastAgent" runat="server" Text=""></asp:Label></td>
                                                    <td><i class="zmdi zmdi-face text-info"></i></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row clearfix">
                            <div class="col-lg-12 col-md-12">
                                <div class="card ">

                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <div class="body search">
                                                <div class="input-group m-b-0">
                                                    <asp:TextBox ID="txtSearchSolutions" runat="server" class="form-control" placeholder="Search Solution" AutoPostBack="true" OnTextChanged="txtSearchSolutions_TextChanged"></asp:TextBox>
                                                    <span class="input-group-addon">
                                                        <i class="zmdi zmdi-search"></i>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="body">
                                                <ul class="inbox-widget list-unstyled clearfix">
                                                    <asp:Literal ID="liSolutions" runat="server"></asp:Literal>
                                                    <%--<li class="inbox-inner">
                                        <a href="javascript:void(0);">
                                            <div class="inbox-item">
                                                <div class="inbox-item-info">
                                                    <p class="author">How do I earn Credit Card Reward Points?</p>
                                                    <p class="inbox-message">Lorem Ipsum is simply dummy text of the been the industry's</p>
                                                    <p class="inbox-date">Article</p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="inbox-inner">
                                        <a href="javascript:void(0);">
                                            <div class="inbox-item">
                                                <div class="inbox-item-info">
                                                    <p class="author">Eligibility for Credit Card</p>
                                                    <p class="inbox-message">Lorem Ipsum is simply dummy text of the been the industry's</p>
                                                    <p class="inbox-date">Article</p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="inbox-inner">
                                        <a href="javascript:void(0);">
                                            <div class="inbox-item">
                                                <div class="inbox-item-info">
                                                    <p class="author">How to cancel a Credit Card?</p>
                                                    <p class="inbox-message">Lorem Ipsum is simply dummy text of the been the industry's</p>
                                                    <p class="inbox-date">Article</p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>--%>
                                                </ul>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                

            </div>

        </section>

        <div class="modal fade" id="Create-Remarks-Modal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="title">New Remark</h4>
                    </div>
                    <div class="">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="card">
                                    <div class="body">
                                        <fieldset>
                                            <div class="form-group">
                                                <asp:TextBox ID="txtCustomerremarks" runat="server" TextMode="MultiLine" Rows="3" class="form-control" placeholder="Remarks"></asp:TextBox>

                                            </div>
                                            <div>
                                                <div class="container-fluid">
                                                    <asp:Button ID="remar" CssClass="btn btn-default" runat="server" Text="Save" OnClick="btnRemarks_Click" />
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


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
                                                <div class="col-lg-6 col-md-6 col-sm-10">
                                                    <div class="form-group form-float">
                                                        <asp:TextBox ID="txtCaseTitleNew" runat="server" class="form-control" placeholder="Title"></asp:TextBox>
                                                        <span id="spanContentPlaceholder1_txtCaseTitleNew"></span>
                                                    </div>
                                                </div>

                                                 <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                        
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-3">
                                                        
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
                                                    <asp:DropDownList ID="ddlAssigned" class="form-control show-tick ms select2" data-placeholder="Select" runat="server" required="true">
                                                    </asp:DropDownList>
                                                    <span id="spanContentPlaceholder1_ddlAssigned"></span>
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="channel">Priority</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-3">

                                                    <asp:DropDownList ID="ddlPriority" CssClass="form-control show-tick ms select2" runat="server" required="true">
                                                        <asp:ListItem>High</asp:ListItem>
                                                        <asp:ListItem>Medium</asp:ListItem>
                                                        <asp:ListItem>Low</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <span id="spansContentPlaceholder1_ddlPriority"></span>
                                                </div>

                                            </div>

                                            <div class="row clearfix">
                                                <div class="col-lg-2 col-md-2 col-sm-2 form-control-label">
                                                    <label for="title">Due Date</label>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-4">
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtDueDate" runat="server" class="form-control datetimepicker" placeholder="Please choose the date"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <label for="channel">Channel</label>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:DropDownList ID="ddlChannels" CssClass="form-control show-tick ms select2" runat="server" required="true">
                                                        <asp:ListItem>Call</asp:ListItem>
                                                        <asp:ListItem>Email</asp:ListItem>
                                                        <asp:ListItem>Whatsapp</asp:ListItem>
                                                        <asp:ListItem>Facebook</asp:ListItem>
                                                        <asp:ListItem>Twitter</asp:ListItem>
                                                        <asp:ListItem>Instagram</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="row clearfix">

                                                <div class="col-lg-4 col-md-4 col-sm-4">
                                                    <div class="form-group">
                                                       <asp:FileUpload runat="server" ID="frmFileUpload" class="btn btn-neutral" AllowMultiple="true" />
                                                        
                                                    </div>
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-sm-2">
                                                    <%--<asp:Button runat="server" ID="uploadedFile" class="btn btn-default" Text="Upload" OnClick="uploadedFile_Click" style="height:34px;margin: 10px" />--%>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6">
                                                    
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
                                    <button type="button" class="btn btn-default" onclick="AddCase()">Save</button>
                                    <asp:Button ID="btnSaveNewCase" CssClass="btn btn-default"  runat="server" Text="Save" style="display:none" OnClick="btnSaveNewCase_Click" />
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="modal fade" id="RemarksModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h6 class="title" id="smallModalLabel">Remarks</h6>
                    </div>
                    <div class="modal-body">
                        <asp:Label ID="lblRemarks" runat="server"></asp:Label>

                    </div>
                    <div class="modal-footer">

                        <button type="button" class="btn btn-danger waves-effect" data-dismiss="modal" style="margin: 0 auto">X</button>
                    </div>
                </div>
            </div>
        </div>

 

        <div class="modal fade" id="SendMessageModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                    </div>
                    <div class="">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="card">
                                    <div class="body">
                                        <fieldset>
                                            <div class="form-group">
                                                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Rows="3" class="form-control" placeholder="Type here"></asp:TextBox>

                                            </div>
                                            <div>
                                                <div class="container-fluid">
                                                    <asp:Button ID="Button1" CssClass="btn btn-default" runat="server" Text="Send" OnClick="btnRemarks_Click" />
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="dvMsg" class="notification" runat="server" visible="false">
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>

        <%--<div class="row">
            <div class="col-md-9"></div>
            <div class="col-md-3">
                
                <a href="https://api.whatsapp.com/send?phone=<%= custmobilenumber.Text%>&text=Hii" class="float" target="_blank">
                    <i class="fa fa-whatsapp my-float"></i>
                </a>
            </div>
        </div>--%>
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
