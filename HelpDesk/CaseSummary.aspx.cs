using BusinessEntityLayer;
using BusinessLayer;
using DataAccessLayer;
using System;
using System.Data;
using System.Web.Services;

namespace HelpDesk
{
    public partial class CaseSummary : System.Web.UI.Page
    {
        HD_UserBL objUserBL = new HD_UserBL();
        HD_CustomerBEL objCustBEL = new HD_CustomerBEL();
        HD_CustomerBL objCystBL = new HD_CustomerBL();
        HD_CaseBEL objCaseBEL = new HD_CaseBEL();
        HD_CaseBL objCaseBL = new HD_CaseBL();
        HD_DataAccessLayer objData = new HD_DataAccessLayer();
        HD_SolutionsBL objsolution = new HD_SolutionsBL();
        string strfiles = "";
        string filepath = System.Configuration.ConfigurationManager.AppSettings["Dowloadpath"];
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                    {
                    string caseId = Request.QueryString["CaseID"];
                    HiddenCaseID.Value = caseId;
                    objCaseBEL.CaseId = caseId;
                    BindDropdown();
                    CaseDetailsBYId(objCaseBEL);
                    var _case = objCaseBL.GetCaseDetailsBYId(new HD_CaseBEL { CaseId = caseId });
                    var status = Convert.ToString(_case.Rows[0]["Ca_Status"]);

                    if (status == "Resolved")
                    {
                        StatusBar.Visible = false;
                        editcase.Visible = false;
                    }
                    else if (status == "InProgress")
                    {
                        Inprogress.Attributes.Add("style", "color:red");
                    }
                    else if (status == "NewRequest")
                    {
                        NewRequest.Attributes.Add("style", "color:red");
                    }


                    GetFiles(objCaseBEL);
                }
                
            }
            catch (Exception ex)
            {
                objData.tolog(" CaseSummaryPageload:" + ex.Message, "E_");
            }
        }

        public string CaseDetailsBYId(HD_CaseBEL hD_CaseBEL)
        {
            var status = string.Empty;
            try
            {
                DataTable Dt = objCaseBL.GetCaseDetailsBYId(hD_CaseBEL);
                if (Dt.Rows.Count > 0)
                {
                    status = Dt.Rows[0]["Ca_Status"].ToString();
                    Caserefno.Text = Dt.Rows[0]["Ca_RefNo"].ToString();
                    Casetitle.Text = Dt.Rows[0]["Ca_Title"].ToString();
                    txteditcasetitle.Text = Casetitle.Text;
                    txtcustomerdet.Text = Dt.Rows[0]["Cust_CustomerFirstName"].ToString();
                    casedescription.Text = Dt.Rows[0]["Ca_CaseDescription"].ToString();
                    txteditcasediscription.Text = casedescription.Text;
                    casechannel.Text = Dt.Rows[0]["Ca_Channel"].ToString();
                    CaseStatus.Text = status;
                    //ddleditcasestatus.SelectedItem.Text = CaseStatus.Text;
                    //ddlcasechannel.SelectedItem.Text = casechannel.Text;
                    casecreatedon.Text =Convert.ToDateTime( Dt.Rows[0]["Ca_CreatedOn"]).ToString("dd-MM-yyyy");
                    casecreatedby.Text = Dt.Rows[0]["CreatedBy"].ToString();
                    casecustomerid.Text = Dt.Rows[0]["Cust_CustomerFirstName"].ToString();
                    caseassignedto.Text = Dt.Rows[0]["AssignedTo"].ToString();
                    casepriority.Text = Dt.Rows[0]["Ca_Priority"].ToString();
                    casesolution.Text = Dt.Rows[0]["Ca_Solution"].ToString();
                    caseduedate.Text = Convert.ToDateTime(Dt.Rows[0]["Ca_DueDate"]).ToString("dd-MM-yyyy");
                    caseresolutiondate.Text = Dt.Rows[0]["Ca_ResolutionDate"].ToString();
                    lblcaseupdatedby.Text = Dt.Rows[0]["UpdatedBy"].ToString();
                    ddlAssignedTo.SelectedValue= Dt.Rows[0]["AssignedTo"].ToString();

                }


            }
            catch (Exception ex)
            {
                objData.tolog(" CaseDetailsBYId:" + ex.Message, "E_");
            }

            return status;
            /*{ dvMsgPgInfo.Attributes["class"] = "callout callout-danger"; dvMsgPgInfo.InnerHtml = DisplyError("UserDetail()", ex); }*/
        }


        public void GetFiles(HD_CaseBEL hD_CaseBEL)
        {
            try
            {
                DataTable Dt = objCaseBL.GetFiles(objCaseBEL);
                foreach (DataRow Dr in Dt.Rows)
                {

                    //listofuploadedfiles.Text += String.Format("{0}<br />", uploadedFile.FileName);
                    strfiles += "<div class=\"col-lg-3 col-md-4 col-sm-12\">" +
                               "<div class=\"card\">" +
                                   "<div class=\"file\">" +
                                      " <a href = \"javascript:void(0);\">" +
                                       "    <div class=\"hover\">" +
                                        "       <button type =\"button\" class=\"btn btn-icon btn-icon-mini btn-round btn-danger\">" +
                                         "          <i class=\"zmdi zmdi-delete\"></i>" +
                                          "     </button>" +
                                           "</div>" +
                                           "<div class=\"icon\">" +
                                            "   <i class=\"zmdi zmdi-file-text\"></i>" +
                                           "</div>" +
                                           "<div class=\"file-name\">" +
                                              " <p class=\"m-b-5 text-muted\"><a href='" + filepath + Dr["FileName"].ToString() + "'>" + Dr["FileName"].ToString() + "</a>" +
                                                "<br/><small>Size: " + Dr["File_Size"].ToString() + "KB</small>" +
                                                "<br/><small>Created On:<span class=\"date text-muted\">" + Dr["File_CreatedOn"].ToString() + "</span></small></p>" +
                                            "</div>" +
                                        "</a>" +
                                    "</div>" +
                                "</div>" +
                            "</div>";

                }
                filupld.InnerHtml = strfiles;
            }
            catch (Exception ex)
            {
                objData.tolog(" GetFiles:" + ex.Message, "E_");
            }
            
        }
        public DataTable GetCaseStatus()
        {
            return objCaseBL.GetCaseStatus();
        }

        public DataTable GetCaseChannel()
        {
            return objCaseBL.GetCaseChannel();
        }
        public DataTable GetSolution()
        {
            return objCaseBL.GetSolution();
        }

        public void BindDropdown()
        {
            ddleditcasestatus.DataSource = GetCaseStatus();
            ddleditcasestatus.DataTextField = "Status_Description";
            ddleditcasestatus.DataValueField = "Status_Id";
            ddleditcasestatus.DataBind();

            ddlcasechannel.DataSource = GetCaseChannel();
            ddlcasechannel.DataTextField = "Chan_Description";
            ddlcasechannel.DataValueField = "Chan_Id";
            ddlcasechannel.DataBind();

            ddlSolution.DataSource = GetSolution();
            ddlSolution.DataTextField = "SolutionTopic";
            ddlSolution.DataValueField = "SolutionID";
            ddlSolution.DataBind();
            // ddlSolution.Items.Insert(0, "New Solution");
            ddlSolution.Items.Insert(0, new System.Web.UI.WebControls.ListItem("New Solution", "0"));
            
            ddlAssignedTo.DataSource = VCCUsers();
            ddlAssignedTo.DataTextField = "Name";
            ddlAssignedTo.DataValueField = "UserID";
            ddlAssignedTo.DataBind();


        }
        public DataTable VCCUsers()
        {
            return objUserBL.GetVCCUserDetails();
        }
        protected void btnUpdateCase_Click(object sender, EventArgs e)
        {
            try
            {
                objCaseBEL.CaseDescription = txteditcasediscription.Text;
                objCaseBEL.CaseAssignedTo = ddlAssignedTo.SelectedValue;
                objCaseBEL.CaseChannel = ddlcasechannel.SelectedValue;
                objCaseBEL.CaseCreatedBy = Session["UserID"].ToString();
                objCaseBEL.CaseId = HiddenCaseID.Value;
                objCaseBEL.CasePriority = ddlPriority.SelectedValue;
                objCaseBEL.CaseTitle = txteditcasetitle.Text;
                DataTable Dt = objCaseBL.UpdateCase(objCaseBEL);
                lblMsg2.Text = "Case Updated succesffully";
                divMsg2.Attributes.Add("class", "alert alert-success");
                divMsg2.Visible = true;
            }
            catch(Exception cx)
            {

            }
            
        }

        //[HttpPost]
        [WebMethod]
        public static string UpdateRequestStatus(string id)
        {
            try
            {
                //var caseId = Request.QueryString["CaseID"];

                HD_CaseBL caseBL = new HD_CaseBL();
                HD_CaseBEL caseBEL = new HD_CaseBEL { CaseId = id };
                DataTable Dt = caseBL.UpdateTrackingInprogress(caseBEL);
            }
            catch (Exception ex)
            {

            }
            return "SUCCESS";
        }

        public static string SolutionStatusUpdate(string id)
        {
            try
            {
                //var caseId = Request.QueryString["CaseID"];

                HD_CaseBL caseBL = new HD_CaseBL();
                HD_CaseBEL caseBEL = new HD_CaseBEL { CaseId = id };
                DataTable Dt = caseBL.UpdateTrackingResolved(caseBEL);
            }
            catch (Exception ex)
            {

            }
            return "SUCCESS";
        }


        protected void btnUpdateSolution_Click(object sender, EventArgs e)
        {
            var caseId = Request.QueryString["CaseID"];

            try
            {
                if(txtNewSolution.Text=="")
                {
                    lblMsg.Text = "Please add the solution details";
                    dvMsg.Attributes.Add("class", "alert alert-warning");
                    dvMsg.Visible = true;
                    return;
                }
                if((cbAddToSolution.Checked)&&(txtnewsolutiontitle.Text==""))
                    {
                    lblMsg.Text = "Please add the solution Title";
                    dvMsg.Attributes.Add("class", "alert alert-warning");
                    dvMsg.Visible = true;
                    return;
                }
                var solutionTopic = ddlSolution.SelectedItem.Text;
                if(cbAddToSolution.Checked)
                {
                    solutionTopic = txtnewsolutiontitle.Text;
                }
                var solutionId = ddlSolution.SelectedValue;
                var solutionDetail = txtNewSolution.Text;

                // Change this when go for live
                 var createdBy = Session["UserID"].ToString();

                var caseBEL = new HD_CaseBEL
                {
                    CaseId = caseId,
                    SolutionID = Convert.ToInt32(solutionId),
                    SolutionTopic = solutionTopic,
                    SolutionDetails = solutionDetail,
                    SolutionCreatedBy = createdBy
                };


                if (cbAddToSolution.Checked)
                {
                    DataTable Dt = objCaseBL.UpdateSolution(caseBEL);
                }
                else
                {
                    DataTable Dt = objCaseBL.UpdateCaseSolution(caseBEL);
                }

            }
            catch (Exception ex)
            {

            }

            Response.Redirect("CaseSummary.aspx?CaseID=" + caseId);
        }

        protected void uploadedFile_Click(object sender, EventArgs e)
        {
            string strfiles = "";
            if (UploadImages.HasFiles)
            {
                string filesize = UploadImages.FileBytes.Length.ToString();
                objCaseBEL.casefilesize = Convert.ToInt64(filesize) / 1024;
                UploadImages.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Files/"), UploadImages.FileName));
                objCaseBEL.casefilename = UploadImages.FileName;
                objCaseBEL.casefilecreatedby = Session["UserID"].ToString();
                DataTable Dt = objCaseBL.InsertFile(objCaseBEL);
                //load all files under this case

                foreach (DataRow Dr in Dt.Rows)
                {

                    //listofuploadedfiles.Text += String.Format("{0}<br />", uploadedFile.FileName);
                    strfiles += "<div class=\"col-lg-3 col-md-4 col-sm-12\">" +
                               "<div class=\"card\">" +
                                   "<div class=\"file\">" +
                                      " <a href = \"javascript:void(0);\">" +
                                       "    <div class=\"hover\">" +
                                        "       <button type =\"button\" class=\"btn btn-icon btn-icon-mini btn-round btn-danger\">" +
                                         "          <i class=\"zmdi zmdi-delete\"></i>" +
                                          "     </button>" +
                                           "</div>" +
                                           "<div class=\"icon\">" +
                                            "   <i class=\"zmdi zmdi-file-text\"></i>" +
                                           "</div>" +
                                           "<div class=\"file-name\">" +
                                              " <p class=\"m-b-5 text-muted\"><a href='" + filepath + Dr["FileName"].ToString() + "'>" + Dr["FileName"].ToString() + "</a>" +
                                                "<br/><small>Size: " + Dr["File_Size"].ToString() + "KB</small>" +
                                                "<br/><small>Created On:<span class=\"date text-muted\">" + Dr["File_CreatedOn"].ToString() + "</span></small></p>" +
                                            "</div>" +
                                        "</a>" +
                                    "</div>" +
                                "</div>" +
                            "</div>";

                }
                filupld.InnerHtml = strfiles;
            }
        }

        protected void ddlSolution_SelectedIndexChanged(object sender, EventArgs e)
        {
        try
            {
                var solutionid = ddlSolution.SelectedValue;
                txtNewSolution.Text = objsolution.solutionDescription(solutionid);
                    }
            catch(Exception ex)
            { }
        }

        protected void cbAddToSolution_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
            if (cbAddToSolution.Checked)
                {
                    txtnewsolutiontitle.Visible = true;
                    
                }
            else
                {
                    txtnewsolutiontitle.Visible = false;
                }
            }
            catch(Exception ex)
            {

            }
        }
    }
}