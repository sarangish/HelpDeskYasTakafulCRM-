using BusinessEntityLayer;
using BusinessLayer;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace HelpDesk
{
    public partial class CustomerSummary : System.Web.UI.Page
    {
        HD_CustomerBEL objCustBEL = new HD_CustomerBEL();
        HD_CustomerBL objCystBL = new HD_CustomerBL();
        HD_CaseBEL objCaseBEL = new HD_CaseBEL();
        HD_CaseBL objCaseBL = new HD_CaseBL();
        HD_UserBL objUserBL = new HD_UserBL();


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    string CustId = Request.QueryString["CustomerID"];

                    objCaseBEL.CaseCustomerId = Convert.ToInt64(CustId);
                    objCustBEL.CustomerId = Convert.ToInt64(CustId);
                    CustomercaseDetailsBYId(objCustBEL);
                    CustomercaseDetails(objCaseBEL);
                    BindDropdown();
                }

            }
            catch (Exception ex)
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

        public void CustomercaseDetails(HD_CaseBEL hD_CaseBEL)
        {

            try
            {
                hD_CaseBEL.CaseCreatedDate =Convert.ToDateTime("1900-01-01");
                hD_CaseBEL.CaseStatus = "ALL";
                DataTable Dt = objCaseBL.GetCaseDetails(hD_CaseBEL);
                //GlobalTask gTsk = new GlobalTask();
                grdcustomercase.DataSource = Dt;
                grdcustomercase.DataBind();
                //gTsk.FillGrid(grdcustomer, Dt);
            }
            catch (Exception ex)
            {
            }
            /*{ dvMsgPgInfo.Attributes["class"] = "callout callout-danger"; dvMsgPgInfo.InnerHtml = DisplyError("UserDetail()", ex); }*/
        }

        public void CustomercaseDetailsBYId(HD_CustomerBEL hD_CustomerBEL)

        {

            try
            {
                DataTable Dt = objCystBL.GetCustomerDetailsBYId(hD_CustomerBEL);
                if (Dt.Rows.Count > 0)
                {
                    Customerid.Text = Dt.Rows[0]["Cust_CustomerID"].ToString();
                    Custfirstname.Text = Dt.Rows[0]["Cust_CustomerFirstName"].ToString();
                    custmiddlename.Text = Dt.Rows[0]["Cust_CustomerMiddleName"].ToString();
                    custlastname.Text = Dt.Rows[0]["Cust_CustomerLastName"].ToString();
                    custemail.Text = Dt.Rows[0]["Cust_EmailID"].ToString();
                    //custfacebook.Text = Dt.Rows[0]["Cust_FacebookID"].ToString();
                    custemirate.Text = Dt.Rows[0]["Cust_Emirate"].ToString(); //changes by sarang
                    custmobilenumber.Text = Dt.Rows[0]["Cust_Mobile"].ToString();
                    custofficenumber.Text = Dt.Rows[0]["Cust_OfficeNum"].ToString();
                    custnotes.Text = Dt.Rows[0]["Cust_Notes"].ToString(); //changes by sarang
                    custnationality.Text = Dt.Rows[0]["Cust_Nationality"].ToString(); //changes by sarang
                    custcompany.Text = Dt.Rows[0]["Cust_Company"].ToString();
                    custstatus.Text = Dt.Rows[0]["Cust_Status"].ToString();
                    //custtwitter.Text = Dt.Rows[0]["Cust_TwitterID"].ToString();
                    custlinkdin.Text = Dt.Rows[0]["Cust_LinkedInID"].ToString();
                    custcreatedon.Text = Dt.Rows[0]["Cust_CreatedOn"].ToString();
                    custupdatedon.Text = Dt.Rows[0]["Cust_UpdatedOn"].ToString();
                    custcreatedby.Text = Dt.Rows[0]["Cust_CreatedBy"].ToString();
                    custupdatedby.Text = Dt.Rows[0]["Cust_UpdatedBy"].ToString();
                    txtFname.Text = Dt.Rows[0]["Cust_CustomerFirstName"].ToString();
                    txtMName.Text = Dt.Rows[0]["Cust_CustomerMiddleName"].ToString();
                    txtLName.Text = Dt.Rows[0]["Cust_CustomerLastName"].ToString();
                    txtEmailID.Text = Dt.Rows[0]["Cust_EmailID"].ToString();
                    txtmoblePhone.Text = Dt.Rows[0]["Cust_Mobile"].ToString();
                    txtofficePhone.Text = Dt.Rows[0]["Cust_OfficeNum"].ToString();
                    txtEmirate.Text = Dt.Rows[0]["Cust_Emirate"].ToString(); //changes by sarang
                    txtNationality.Text = Dt.Rows[0]["Cust_Nationality"].ToString(); //changes by sarang
                    txtCompany.Text = Dt.Rows[0]["Cust_Company"].ToString();
                    chkProductCategory.Text = Dt.Rows[0]["Cust_ProductCategory"].ToString(); //changes by sarang

                }


            }
            catch (Exception ex)
            {
            }
            /*{ dvMsgPgInfo.Attributes["class"] = "callout callout-danger"; dvMsgPgInfo.InnerHtml = DisplyError("UserDetail()", ex); }*/
        }

        public void btnSaveNewCase_Click(object sender, EventArgs e)
        {
            //CREATING NEW CASE
            try
            {
                objCaseBEL.CaseDescription = txtCaseDescriptionNew.Text;
                objCaseBEL.CaseCustomerId = Convert.ToInt64(Customerid.Text);
                objCaseBEL.CaseAssignedTo = ddlAssigned.SelectedValue;
                objCaseBEL.CaseChannel = ddlChannels.SelectedValue;
                objCaseBEL.CaseCreatedBy = Session["UserID"].ToString();
                objCaseBEL.CaseDescription = txtCaseDescriptionNew.Text;
                objCaseBEL.CasePriority = ddlPriority.SelectedValue;
                objCaseBEL.CaseTitle = txtCaseTitleNew.Text;
                //int res = objCaseBL.CreateNewCase(objCaseBEL);
                if (txtDueDate.Text != "")
                {
                    objCaseBEL.CaseDueDate = Convert.ToDateTime(DateTime.ParseExact(txtDueDate.Text, "dd-MM-yyyy", null));
                }
                else
                {
                    objCaseBEL.CaseDueDate = Convert.ToDateTime("1900-01-01 00:00:00");
                }
                DataTable Dt = objCaseBL.InsertCase(objCaseBEL);
                if (Dt.Rows.Count > 0)
                {
                    if (frmFileUpload.HasFiles)
                    {
                        string filesize = frmFileUpload.FileBytes.Length.ToString();
                        objCaseBEL.casefilesize = Convert.ToInt64(filesize) / 1024;
                        frmFileUpload.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Files/"), frmFileUpload.FileName));
                        objCaseBEL.casefilename = frmFileUpload.FileName;
                        //objCaseBEL.casefilecreatedby = Session["UserID"].ToString();
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
            Response.Redirect("CustomerSummary.aspx?CustomerID=" + objCaseBEL.CaseCustomerId);
        }

        protected void btnUpdateCust_Click(object sender, EventArgs e)
        {
            try
            {
                objCustBEL.custfirstname = txtFname.Text;
                objCustBEL.custmiddlename = txtMName.Text;
                objCustBEL.custlastname = txtLName.Text;
                objCustBEL.custemail = txtEmailID.Text;
                objCustBEL.custmobilenumber = txtmoblePhone.Text;
                objCustBEL.custofficenumber = txtofficePhone.Text;
                objCustBEL.custemirate = txtEmirate.Text; //changes by sarang
                objCustBEL.custnationality = txtNationality.Text; //changes by sarang
                objCustBEL.custcompany = txtCompany.Text;
                objCustBEL.custnotes = txtNotes.Text; //changes by sarang
                //objCustBEL.custproductcategory = <>


                objCustBEL.CustomerId = Convert.ToInt64(Request.QueryString["CustomerID"]);
                DataTable Dt = objCystBL.UpdateCustomer(objCustBEL);
                if (Dt.Rows.Count > 0)
                {

                    dvMsg.Attributes.Add("class", "alert alert-danger");
                    lblMsg.Text = Dt.Rows[0][0].ToString();
                }
                else
                {
                    dvMsg.Attributes.Add("class", "alert alert-success");
                    lblMsg.Text = "The customer has been updated.";
                }
               
            }
            catch (Exception ex)
            {
            }
        }



        public void BindDropdown()
        {
            ddlAssigned.DataSource = VCCUsers();
            ddlAssigned.DataTextField = "Name";
            ddlAssigned.DataValueField = "UserID";
            ddlAssigned.DataBind();



        }

        public DataTable VCCUsers()
        {
            return objUserBL.GetVCCUserDetails();
        }

        public void grdcustomercase_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            var custId = Convert.ToInt32(Request.QueryString["CustomerID"]);


            grdcustomercase.PageIndex = e.NewPageIndex;
            CustomercaseDetails(new HD_CaseBEL { CaseCustomerId = custId });

        }
    }
}