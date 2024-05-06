using System;

namespace HelpDesk
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if there is already a customer saved in session
            //the customer id will be saved, when the agent choose a customer from the CTI screen
            //it is only applicable if it is integrated with VCC
            if (Session["VCC_CTI"] != null)
            {
                if (Session["VCC_CTI"].ToString() != "")
                {
                    Response.Redirect(Session["VCC_CTI"].ToString());
                }
            }
            else
            {
                Response.Redirect("SearchCustomer.aspx");
            }
        }
    }
}