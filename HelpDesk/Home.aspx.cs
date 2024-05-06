using BusinessEntityLayer;
using BusinessLayer;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
namespace HelpDesk
{
    public partial class Home : System.Web.UI.Page
    {
        HD_CustomerBEL objCustBEL = new HD_CustomerBEL();
        HD_CustomerBL objCustBL = new HD_CustomerBL();
        HD_CaseBEL objCaseBEL = new HD_CaseBEL();
        HD_CaseBL objCaseBL = new HD_CaseBL();
        HD_SolutionsBL objSolutionBL = new HD_SolutionsBL();
        HD_UserBL objUserBL = new HD_UserBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDueDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
                //SHOW NOTIFICATION MESSAGE ON SCREEN
                //showNotificationMsg();
                loadDefaultSolutions();
                //THIS PAGE IS DESGINED FOR CTI POPUP, WHERE THE AGANET CAN GET A 360 VIEW OF CUSTOMER
                //THIS PAGE WILL BE LOADED ONLY WITH CUSTOMER ID
                //BASIC DETAILS OF CUSTOMER
                //LIST OF RECENT CASES
                if (Request.QueryString["CustomerID"] != null)
                {
                    loadCustomerDetails(Request.QueryString["CustomerID"]);
                    loadCustomerCase(Request.QueryString["CustomerID"]);
                    loadAgentRemarks(Request.QueryString["CustomerID"]);
                }
                //LOAD THE VCC RELATED PARAMETERS BASED ON THE CONTACTID
                if (Request.QueryString["ContactID"] != null)
                {
                    loadVCCDetails(Request.QueryString["ContactID"]);
                }
                BindDropdown();
            }
            

        }

        private void loadVCCDetails(string ContactID)
        {
            try
            {
                if (ContactID != "")
                {
                    DataTable dataTable = objCustBL.GetVCCDetails(ContactID);
                    if (dataTable != null)
                    {
                        if (dataTable.Rows.Count > 0)
                        {
                            lblCallFrom.Text = dataTable.Rows[0][0].ToString();
                            lblSkill.Text = dataTable.Rows[0][1].ToString();
                            lblCallQueue.Text = dataTable.Rows[0][2].ToString();
                            lblLastContactedOn.Text = dataTable.Rows[0][3].ToString();
                            lblLastAgent.Text = dataTable.Rows[0][4].ToString();
                        }
                    }
                }
            }
            catch (Exception cx)
            {

            }
        }
        protected void lblcaseref_Command(object sender, CommandEventArgs e)
        {
            try
            {
                //CUSTOMER VIEW SCREEN
                Response.Redirect("CaseSummary.aspx?CaseID=" + e.CommandArgument.ToString());

            }
            catch (Exception ex)
            {

            }
        }
        private void loadAgentRemarks(string CustomerID)
        {
            //LOAD THE LAST 5 REMARKS ADDED FOR THIS CUSTOMER ORDER BY CREATED DATE DESC
            try
            {
                objCustBEL.CustomerId = Convert.ToInt64(CustomerID);

                DataTable Dt = objCustBL.GetCustomerRemarks(objCustBEL);
                lblRemarks.Text = Dt.Rows[0]["FullRemarks"].ToString();
                grvRemarks.DataSource = Dt;
                grvRemarks.DataBind();
                if (Dt.Rows.Count > 0)
                {
                    //txtCustomerremarks.Text= Dt.Rows[0]["CalledNo"].ToString() + "Event Time: " + Dt.Rows[0]["EventTime"].ToString() + "Remarks: " + Dt.Rows[0]["Remarks"].ToString();

                    txtCustomerremarks.Text = Dt.Rows[0]["Remarks"].ToString();

                }
            }
            catch (Exception cx)
            {

            }

        }

        private void showNotificationMsg()
        {
            //IF ANY NOTIFICATION TO DISPLAY
            dvMsg.Visible = true;
            lblMsg.Text = "A case raised by this customer has been breached the SLA";

            //IF NO ANY MESSAGE TO DISPLAY
            //dvMsg.Visible = false;
            //lblMsg.Text = "";
        }
        #region Caller Details
        private void loadCustomerDetails(string CustomerID)
        {
            try
            {
                objCustBEL.CustomerId = Convert.ToInt64(CustomerID);

                DataTable Dt = objCustBL.GetCustomerDetailsBYId(objCustBEL);
                if (Dt.Rows.Count > 0)
                {
                    hdnCustID.Value = Dt.Rows[0]["Cust_CustomerID"].ToString();
                    lblfullname.Text = Dt.Rows[0]["Cust_CustomerFirstName"].ToString() + " " + Dt.Rows[0]["Cust_CustomerMiddleName"].ToString() + " " + Dt.Rows[0]["Cust_CustomerLastName"].ToString();
                    custemail.InnerHtml = Dt.Rows[0]["Cust_EmailID"].ToString();
                    //custfacebook.Text = Dt.Rows[0]["Cust_FacebookID"].ToString();
                    custhomenumber.Text = Dt.Rows[0]["Cust_HomeNum"].ToString();
                    custmobilenumber.Text = Dt.Rows[0]["Cust_Mobile"].ToString();
                    custofficenumber.Text = Dt.Rows[0]["Cust_OfficeNum"].ToString();
                    custlocation.Text = Dt.Rows[0]["Cust_Location"].ToString();
                    custpobox.Text = Dt.Rows[0]["Cust_PoBox"].ToString();
                    custcompany.Text = Dt.Rows[0]["Cust_Company"].ToString();
                }
            }
            catch (Exception cx)
            {

            }
        }
        private void loadCustomerCase(string CustomerID)
        {
            try
            {
                objCaseBEL.CaseCustomerId = Convert.ToInt64(CustomerID);
                objCaseBEL.CaseStatus = "ALL";
                objCaseBEL.CaseCreatedDate = Convert.ToDateTime("1900-01-01");
                DataTable Dt = objCaseBL.GetCaseDetails(objCaseBEL);
                //GlobalTask gTsk = new GlobalTask();
                grdcustomercase.DataSource = Dt;
                grdcustomercase.DataBind();
                //gTsk.FillGrid(grdcustomer, Dt);
            }
            catch (Exception ex)
            {
            }
        }
        #endregion
        #region Solutions
        private void loadDefaultSolutions()
        {
            try
            {
                string strSolutions = "";
                DataTable Dt = objSolutionBL.GetTopSolutions();
                if (Dt != null)
                {
                    if (Dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in Dt.Rows)
                        {
                            strSolutions += "<li class=\"inbox-inner\">" +
                                          "<a href = \"javascript:void(0);\">" +
                                          "<div class=\"inbox-item\">" +
                                                "<div class=\"inbox-item-info\">" +
                                                    "<p class=\"author\">" + dr[0].ToString() + "</p>" +
                                                    "<p class=\"inbox-message\">" + dr[1].ToString() + "</p>" +
                                                    "<p class=\"inbox-date\"><a href='#'>Read More</a></p>" +
                                               " </div>" +
                                            "</div>" +
                                        "</a>" +
                                   " </li>";
                        }
                    }
                }
                liSolutions.Text = strSolutions;
            }
            catch (Exception cx)
            {

            }
        }

        protected void txtSearchSolutions_TextChanged(object sender, EventArgs e)
        {
            SearchSolutions();
        }

        private void SearchSolutions()
        {
            try
            {
                string strSolutions = "";
                DataTable Dt = objSolutionBL.SearchSolutions(txtSearchSolutions.Text);
                if (Dt != null)
                {
                    if (Dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in Dt.Rows)
                        {
                            strSolutions += "<li class=\"inbox-inner\">" +
                                          "<a href = \"javascript:void(0);\">" +
                                          "<div class=\"inbox-item\">" +
                                                "<div class=\"inbox-item-info\">" +
                                                    "<p class=\"author\">" + dr[0].ToString() + "</p>" +
                                                    "<p class=\"inbox-message\">" + dr[1].ToString() + "</p>" +
                                                    "<p class=\"inbox-date\"><a href='#'>Read More</a></p>" +
                                               " </div>" +
                                            "</div>" +
                                        "</a>" +
                                   " </li>";
                        }
                    }
                }
                liSolutions.Text = strSolutions;
            }
            catch (Exception cx)
            {

            }
        }

        public DataTable VCCUsers()
        {
            return objUserBL.GetVCCUserDetails();
        }

        public void BindDropdown()
        {
            ddlAssigned.DataSource = VCCUsers();
            ddlAssigned.DataTextField = "Name";
            ddlAssigned.DataValueField = "UserID";
            ddlAssigned.DataBind();

            //ddlcustomer.DataSource = LoadCustomer();
            //ddlcustomer.DataTextField = "Cust_CustomerFirstName";
            //ddlcustomer.DataValueField = "Cust_CustomerID";
            //ddlcustomer.DataBind();


        }


        #endregion


        protected void btnSaveNewCase_Click(object sender, EventArgs e)
        {
            string libraryPath = ConfigurationManager.AppSettings["AttachmentPath"];
            try
                {
                objCaseBEL.CaseDescription = txtCaseDescriptionNew.Text;
                objCaseBEL.CaseCustomerId = Convert.ToInt64(hdnCustID.Value);
                //objCaseBEL.CaseCustomerId = Convert.ToInt64(ddlcustomer.SelectedValue);
                objCaseBEL.CaseAssignedTo = ddlAssigned.SelectedValue;
                objCaseBEL.CaseChannel = ddlChannels.SelectedValue;
                objCaseBEL.CaseCreatedBy = Session["UserID"].ToString();
                objCaseBEL.CaseDescription = txtCaseDescriptionNew.Text;
                objCaseBEL.CasePriority = ddlPriority.SelectedValue;
                objCaseBEL.CaseTitle = txtCaseTitleNew.Text;
                objCaseBEL.CaseStatus = "NewRequest";
                //objCaseBEL.CaseDueDate =Convert.ToDateTime( txtDueDate.Text).ToString("dd-MM-yyyy");
                objCaseBEL.CaseDueDate = DateTime.ParseExact(txtDueDate.Text, "dd-MM-yyyy",null);
                DataTable Dt = objCaseBL.InsertCase(objCaseBEL);
                if (Dt.Rows.Count > 0)
                {
                    if (frmFileUpload.HasFiles)
                    {
                        string filesize = frmFileUpload.FileBytes.Length.ToString();
                        objCaseBEL.casefilesize = Convert.ToInt64(filesize) / 1024;
                        frmFileUpload.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Files/"), frmFileUpload.FileName));
                        objCaseBEL.casefilename = frmFileUpload.FileName;
                        objCaseBEL.casefilecreatedby = Session["UserID"].ToString();
                        objCaseBEL.CaseId = Convert.ToString(Dt.Rows[0]["ErrNo"]);
                        DataTable Dtt = objCaseBL.InsertFile(objCaseBEL);
                        //load all files under this case


                    }
                    dvMsg.Visible = true;
                    lblMsg.Text = "Your Request for the case has been logged.";
                }

            }
            catch (Exception cx)
            {

            }
            Response.Redirect("Home.aspx?CustomerID=" + objCaseBEL.CaseCustomerId);
        }

        protected void btnRemarks_Click(object sender, EventArgs e)
        {
            objCustBEL.CustomerId = Convert.ToInt64(hdnCustID.Value);
            objCustBEL.custremarks = txtCustomerremarks.Text;
            objCustBEL.custcreatedby = Session["UserID"].ToString();
            objCustBEL.custmobilenumber = lblCallFrom.Text;
            DataTable Dt = objCustBL.InsertCustremarks(objCustBEL);
            if (Dt.Rows.Count > 0)
            {
                loadAgentRemarks(Request.QueryString["CustomerID"]);
                dvMsg.Visible = true;
                lblMsg.Text = "Your Remark has been saved.";
            }
        }

        protected void grdcustomercase_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdcustomercase.PageIndex = e.NewPageIndex;
            loadCustomerCase(Request.QueryString["CustomerID"]);

        }

        protected void grvRemarks_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvRemarks.PageIndex = e.NewPageIndex;
        }

        public DataTable LoadCustomer()
        {
            return objCustBL.GetCustomerName();

        }

        //protected void uploadedFile_Click(object sender, EventArgs e)
        //{
        //    if (UploadImages.HasFiles)
        //    {
        //        string filesize = UploadImages.FileBytes.Length.ToString();
        //        objCaseBEL.casefilesize = Convert.ToInt64(filesize) / 1024;
        //        UploadImages.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Files/"), UploadImages.FileName));
        //        objCaseBEL.casefilename = UploadImages.FileName;
        //        objCaseBEL.casefilecreatedby = Session["UserID"].ToString();
        //        DataTable Dt = objCaseBL.InsertFile(objCaseBEL);
        //        //load all files under this case


        //    }
        //}
    }
}