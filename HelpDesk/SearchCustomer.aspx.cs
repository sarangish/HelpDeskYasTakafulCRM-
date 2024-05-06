using BusinessEntityLayer;
using BusinessLayer;
using DataAccessLayer;
using System;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;

namespace HelpDesk
{
    public partial class SearchCustomer : System.Web.UI.Page
    {
        HD_CustomerBEL objCustBEL = new HD_CustomerBEL();
        HD_CustomerBL objCystBL = new HD_CustomerBL();
        HD_CaseBEL objCaseBEL = new HD_CaseBEL();
        HD_CaseBL objCaseBL = new HD_CaseBL();
        HD_DataAccessLayer objData = new HD_DataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //CHECK IF THE PHONE NUMBER IS PASSED AS QUERY STRING
                //IF PHONE NUMBER FOUND, GET ALL RELATED CUSTOMER AND LIST ON THE INITIAL PAGE LOAD ITSELF
                if (!IsPostBack)
                {
                    if (Request.QueryString["Phone"] != null)
                    {
                        LoadCustomerByPhone(Request.QueryString["Phone"]);
                    }
                }

                //var isSuccessful = Request.QueryString["IsSuccessful"];
                //if (!string.IsNullOrEmpty(isSuccessful))
                //{
                //    HiddenAction.Value = isSuccessful;
                //}
            }
            catch (Exception ex)
            {
                objData.tolog(" SearchCustomer:" + ex.Message, "E_");
            }



        }

        private void LoadCustomerByPhone(string PhoneNo)
        {
            try
            {
                objCustBEL.custfirstname = "";
                objCustBEL.custemail = "";
                objCustBEL.custmobilenumber = PhoneNo;
                CustomerDetails(objCustBEL);
            }
            catch (Exception cx)
            {

            }
        }

        protected void serachcustomer_Click(object sender, EventArgs e)
        {
            lblMsgmain.Text = "";
            divMsgMain.Attributes.Remove("class");
            dvMsg.Visible = false;
            lblMsg.Text = "";
            dvMsg.Attributes.Remove("class");
            objCustBEL.custfirstname = txtCustomerName.Text;
            objCustBEL.custemail = txtCustomerEmail.Text;
            objCustBEL.custmobilenumber = txtCustomerPhone.Text;
            CustomerDetails(objCustBEL);

        }

        public void CustomerDetails(HD_CustomerBEL hD_CustomerBEL)
        {

            try
            {
                DataTable Dt = objCystBL.GetCustomerDetails(hD_CustomerBEL);
                //GlobalTask gTsk = new GlobalTask();
                grdcustomer.DataSource = Dt;
                grdcustomer.DataBind();
                //gTsk.FillGrid(grdcustomer, Dt);
                if (Dt != null)
                {
                    objData.tolog("GetCustomerDetailsCount :" + Dt.Rows.Count.ToString(), "T_");
                    if (Dt.Rows.Count == 0)
                    {
                        objData.tolog("GetCustomerDetailsCount1 :" + Dt.Rows.Count.ToString(), "T_");
                        divMsgMain.Visible = true;
                        lblMsgmain.Text = "No customer found..";
                        divMsgMain.Attributes.Add("class", "alert alert-warning");
                    }
                }

            }
            catch (Exception ex)
            {
                objData.LogExeption(ex.Message);
            }
            /*{ dvMsgPgInfo.Attributes["class"] = "callout callout-danger"; dvMsgPgInfo.InnerHtml = DisplyError("UserDetail()", ex); }*/
        }

        protected void lbCustomer_Command(object sender, CommandEventArgs e)
        {
            try
            {
                //CHECK IF THE PHONE NUMBER IS AVAILABLE IN QUERY STRING.
                //IF PHONE NUMBER EXIST, THEN REDIRECT TO CTI PAGE
                //IF NO PHONE NUMBER, THEN CUSTOMER VIEW SCREEN
                if (Request.QueryString["Phone"] != null)
                {
                    //CUSTOMER CTI POPUP
                    string strContactID = "";
                    if (Request.QueryString["ContactID"] != null)
                    {
                        strContactID = Request.QueryString["ContactID"];
                    }
                    //STORE THE LAST CUSTOMER ID AND CONTACT ID, ONLY TO RETAIN IT IF GO BACK TO VCC CTI PAGE
                    Session["VCC_CTI"] = "Home.aspx?CustomerID=" + e.CommandArgument.ToString() + "&ContactID=" + strContactID;
                    Response.Redirect("Home.aspx?CustomerID=" + e.CommandArgument.ToString() + "&ContactID=" + strContactID);
                }
                else
                {
                    //CUSTOMER VIEW SCREEN
                    Response.Redirect("CustomerSummary.aspx?CustomerID=" + e.CommandArgument.ToString());
                }

            }
            catch (Exception ex)
            {
                objData.LogExeption(ex.Message);
            }
        }

        protected void btnAddCustomer_Click(object sender, EventArgs e)
        {
            try
            {
                string selectedCategories = GetSelectedProductCategories();

                objCustBEL.CustTitle = ddlCustTitle.SelectedValue;
                //objCustBEL.CustomerId = Convert.ToInt64(hdnCustID.Value);
                objCustBEL.custfirstname = txtFname.Text;
                objCustBEL.custmiddlename = txtMName.Text;
                objCustBEL.custlastname = txtLName.Text;
                objCustBEL.custemail = txtEmailID.Text;
                //objCustBEL.custfacebook = txtFBID.Text;
                objCustBEL.custemirate = txtEmirate.Text; //changes by sarang
                objCustBEL.custmobilenumber = txtprimaryPhone.Text;
                objCustBEL.custofficenumber = txtWorkPhone.Text;
                objCustBEL.custnationality = txtNationality.Text;// cha...ang
                objCustBEL.custcompany = txtCompany.Text;
                //objCustBEL.custtwitter = txtTwitterID.Text;
                //objCustBEL.custInsta = txtInstaID.Text;
                objCustBEL.custcreatedby = Session["UserID"].ToString();
                objCustBEL.custupdatedby = Session["UserID"].ToString();
                objCustBEL.custproductcategory = selectedCategories;// cha...
                objCustBEL.custnotes = txtNotes.Text;// cha...ang


                DataTable Dt = objCystBL.InsertCustomer(objCustBEL);
                if (Dt != null)
                {
                    if (Dt.Rows.Count > 0)
                    {
                        if (Dt.Rows[0][0].ToString() == "-1")
                        {
                            dvMsg.Visible = true;
                            lblMsg.Text = "The customer already exists.";
                            dvMsg.Attributes.Add("class", "alert alert-warning");
                        }
                        if (Dt.Rows[0][0].ToString() == "1")
                        {
                            dvMsg.Visible = true;
                            lblMsg.Text = "The customer has been created successfully";
                            dvMsg.Attributes.Add("class", "alert alert-success");
                            // Response.Redirect("SearchCustomer.aspx?CustomerID=" + objCaseBEL.CaseCustomerId + "&IsSuccessful=1");
                        }
                    }

                }
                //dvMsg.Visible = true;
                //lblMsg.Text = "The customer has been created successfully.";



            }
            catch (Exception ex)
            {
                objData.tolog(" btnAddCustomer_Click:" + ex.Message, "E_");
            }

        }

        private string GetSelectedProductCategories()
        {
            string selectedCategories = "";

            foreach (ListItem item in chkProductCategory.Items)
            {
                if (item.Selected)
                {
                    selectedCategories += item.Value + ",";
                }
            }

            // Remove trailing comma, if any
            if (!string.IsNullOrEmpty(selectedCategories))
            {
                selectedCategories = selectedCategories.TrimEnd(',');
            }

            return selectedCategories;
        }

        protected void grdcustomer_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grdcustomer.PageIndex = e.NewPageIndex;
                objCustBEL.custfirstname = txtCustomerName.Text;
                objCustBEL.custemail = txtCustomerEmail.Text;
                objCustBEL.custmobilenumber = txtCustomerPhone.Text;
                CustomerDetails(objCustBEL);
            }
            catch (Exception ex)
            {

            }
        }
    }
}