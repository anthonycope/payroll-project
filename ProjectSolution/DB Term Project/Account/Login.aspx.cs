using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_Term_Project.Account
{
    public partial class Login : System.Web.UI.Page
    {
        static bool isAdmin = false;
        string adminPassword = "f%x`gAC3[y{6L1z0";

        protected void Page_Load(object sender, EventArgs e)
        {
           //RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }

        protected void LoginUser_Authenticate(object sender, AuthenticateEventArgs e)
        {

        }

        /// <summary>
        /// Allows login as administrator to create an account. This will be under the "Authenticate" event
        /// once we get the database connected to this project.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if (LoginUser.UserName == "admin" && LoginUser.Password == adminPassword)
            {
                isAdmin = true;
                Response.Redirect("/Default.aspx");                
            }
            else
                isAdmin = false;
        }

        /// <summary>
        /// Returns true if the currently logged in user is an administrator.
        /// False otherwise.
        /// </summary>
        static public bool IsAdmin
        {
            get { return isAdmin; }
        }
    }
}
