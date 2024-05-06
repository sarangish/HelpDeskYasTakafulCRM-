using System;

namespace HelpDesk
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ACTIVE DIRECTORY INTEGRATION
            if (Session["UserID"] == null)
            {
                //GET THE LDAP EMAIL ID OF THE LOGGED WIN USER
                //string CurrUsrEMail = string.Empty;
                //CurrUsrEMail = System.DirectoryServices.AccountManagement.UserPrincipal.Current.EmailAddress;

                //GET THE USERID FROM THE VOXTRON DB, BASED ON THE EMAILID
                //string strUserID = GetVCCUser(CurrUsrEMail
                if (Request.QueryString["UserID"] != null)
                    Session["UserID"] = Request.QueryString["UserID"].ToString();
                //if (strUserID!="")

                //{
                //    Session["UserID"] = strUserID;
                //}

            }
        }

        private string GetVCCUser(string currUsrEMail)
        {
            //GET THE ID FROM VCC
            return "5";
        }
    }
}