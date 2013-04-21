using System;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
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
        static bool isLoggedIn = false;

        protected void Page_Load(object sender, EventArgs e)
        {
           //RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }

        protected void LoginUser_Authenticate(object sender, AuthenticateEventArgs e)
        {
           
        }

        /// <summary>
        /// Check validity of username and password. Also check whether the user is an admin or not.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LoginButton_Click(object sender, EventArgs e)
        {
           using (SqlConnection connection = new SqlConnection(ConnectionStringClass.ConnectionString))
           {
              using (SqlCommand command = new SqlCommand())
              {
                 /*The following code checks if the user's username and password are valid. It also checks if 
                   the user is an admin user*/
                 bool isValidLogin = false;
                 int eid = 0;

                 command.CommandText = "SELECT *" +
                                       " FROM Employees" +
                                       " WHERE username = @username AND password = @password";
                 command.Parameters.AddWithValue("@username", LoginUser.UserName);
                 command.Parameters.AddWithValue("@password", LoginUser.Password);
                 command.Connection = connection;

                 try
                 {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader ();
                    isValidLogin = reader.HasRows;

                    //If login is valid, get Eid and isAdmin column values.
                    if (isValidLogin)
                    {
                       reader.Read();
                       eid = (int)reader["Eid"];
                       isAdmin = (byte) reader ["isAdmin"] == 1? true : false;
                       Session["Eid"] = eid;
                    }
                    connection.Close();
                 }
                 catch
                 {
                    connection.Close();
                    Page.RegisterClientScriptBlock("mes", "<script language='javascript'>alert('Sorry, an error occurred. Are you connected to the database?')</script>");
                    return;
                 }

                 if (isValidLogin)
                 {
                    isLoggedIn = true;
                    Response.Redirect("/Default.aspx");
                 }
              }
           }
        }

        /// <summary>
        /// Returns true if the currently logged in user is an administrator.
        /// False otherwise.
        /// </summary>
        static public bool IsAdmin
        {
           set { isAdmin = value; }
            get { return isAdmin; }
        }

        /// <summary>
        /// Returns true if the user is logged in
        /// </summary>
        static public bool IsLoggedIn
        {
           set { isLoggedIn = value; }
            get { return isLoggedIn; }
        }
    }
}
