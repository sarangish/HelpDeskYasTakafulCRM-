using BusinessEntityLayer;
using BusinessLayer;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace HelpDesk
{
    public partial class SearchCase : System.Web.UI.Page
    {
        HD_CaseBEL objCaseBEL = new HD_CaseBEL();
        HD_CaseBL objCaseBL = new HD_CaseBL();
        HD_UserBL objUserBL = new HD_UserBL();
        HD_CustomerBL objCustBL = new HD_CustomerBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                txtDueDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
                //var custId = Request.QueryString["CustomerID"];
                //hdnCustID.Value = custId;
                BindDropdown();
            }
           
        }

        protected void lblCase_Command(object sender, CommandEventArgs e)
        {
            try
            {
                //CHECK IF THE PHONE NUMBER IS AVAILABLE IN QUERY STRING.
                //IF PHONE NUMBER EXIST, THEN REDIRECT TO CTI PAGE
                //IF NO PHONE NUMBER, THEN CUSTOMER VIEW SCREEN
                if (Request.QueryString["case"] != null)
                {
                    //CUSTOMER CTI POPUP
                    Response.Redirect("Home.aspx?CaseID=" + e.CommandArgument.ToString());
                }
                else
                {
                    //CUSTOMER VIEW SCREEN
                    Response.Redirect("CaseSummary.aspx?CaseID=" + e.CommandArgument.ToString());
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            dvMsg.Attributes.Remove("class");
            searchCaseDetails();
        }

        private void searchCaseDetails()
        {
            try
            {
                objCaseBEL.CaseRefNo = txtCaseRefNo.Text;
                objCaseBEL.CaseStatus = ddlStatus.SelectedValue;
                //objCaseBEL.CaseCustomerId = txtCaseCustomer.Text;
                if (txtcasecreateddate.Text != "")
                {
                    objCaseBEL.CaseCreatedDate = Convert.ToDateTime(DateTime.ParseExact(txtcasecreateddate.Text,"dd-MM-yyyy",null));
                }
                else
                {
                    objCaseBEL.CaseCreatedDate = Convert.ToDateTime("1900-01-01 00:00:00");
                }

                //var date = Convert.ToDateTime(txtcasecreateddate.Text);
                CaseDetails(objCaseBEL);

            }
            catch (Exception ex)
            {

            }
        }

        public void CaseDetails(HD_CaseBEL hD_CaseBEL)
        {

            try
            {

                DataTable Dt = objCaseBL.GetCaseDetails(hD_CaseBEL);
                grdcase.DataSource = Dt;
                grdcase.DataBind();

            }
            catch (Exception ex)
            {
            }
            /*{ dvMsgPgInfo.Attributes["class"] = "callout callout-danger"; dvMsgPgInfo.InnerHtml = DisplyError("UserDetail()", ex); }*/
        }



        protected void btnAddCase_Click(object sender, EventArgs e)
        {
            try
            {
                objCaseBEL.CaseDescription = txtCaseDescriptionNew.Text;
                objCaseBEL.CaseCustomerId = Convert.ToInt64(ddlcustomer.SelectedValue);
                objCaseBEL.CaseAssignedTo = ddlAssigned.SelectedValue;
                objCaseBEL.CaseChannel = ddlChannels.SelectedValue;
                objCaseBEL.CaseCreatedBy = Session["UserID"].ToString();
                objCaseBEL.CaseDescription = txtCaseDescriptionNew.Text;
                objCaseBEL.CasePriority = ddlPriority.SelectedValue;
                objCaseBEL.CaseTitle = txtCaseTitleNew.Text;
                objCaseBEL.CaseStatus = "NewRequest";
                objCaseBEL.CaseDueDate = DateTime.ParseExact(txtDueDate.Text, "dd-MM-yyyy", null);
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
                    lblMsg.Text = "The case has been created successfully";
                    dvMsg.Attributes.Add("class", "alert alert-success");


                }
            }
            catch (Exception cx)
            {

            }
            Response.Redirect("CustomerSummary.aspx?CustomerID=" + objCaseBEL.CaseCustomerId);
        }

      
       
        protected void btnSaveNewCase_Click(object sender, EventArgs e)
        {
            try
            {
                objCaseBEL.CaseDescription = txtCaseDescriptionNew.Text;
                objCaseBEL.CaseCustomerId = Convert.ToInt64(hdnCustID.Value);
                objCaseBEL.CaseAssignedTo = ddlAssigned.SelectedValue;
                objCaseBEL.CaseChannel = ddlChannels.SelectedValue;
                objCaseBEL.CaseCreatedBy = Session["UserID"].ToString();
                objCaseBEL.CaseDescription = txtCaseDescriptionNew.Text;
                objCaseBEL.CasePriority = ddlPriority.SelectedValue;
                objCaseBEL.CaseTitle = txtCaseTitleNew.Text;
                objCaseBEL.CaseStatus = "NewRequest";
                frmFileUpload.SaveAs(Server.MapPath("Files") + "//" + frmFileUpload.FileName);
                DataTable Dt = objCaseBL.InsertCase(objCaseBEL);
                if (Dt.Rows.Count > 0)
                {
                    dvMsg.Visible = true;
                    lblMsg.Text = "Your Request for the case has been logged.";
                }

            }
            catch (Exception cx)
            {

            }
            Response.Redirect("Home.aspx?CustomerID=" + objCaseBEL.CaseCustomerId);
        }
        public void BindDropdown()
        {
            ddlAssigned.DataSource = VCCUsers();
            ddlAssigned.DataTextField = "Name";
            ddlAssigned.DataValueField = "UserID";
            ddlAssigned.DataBind();

            ddlcustomer.DataSource = LoadCustomer();
            ddlcustomer.DataTextField = "Cust_CustomerFirstName";
            ddlcustomer.DataValueField = "Cust_CustomerID";
            ddlcustomer.DataBind();



        }

        public DataTable VCCUsers()
        {
            return objUserBL.GetVCCUserDetails();
        }

        public DataTable LoadCustomer()
        {
            return objCustBL.GetCustomerName();
            
        }

        protected void grdcase_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdcase.PageIndex = e.NewPageIndex;
            searchCaseDetails();
        }
    }
}