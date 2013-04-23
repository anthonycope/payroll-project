/*
 * Description: Create a user from an admin account. Note that it is assumed that an admin user a manager and that
 * the admin A creating the user U is U's manager.
 */

using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_Term_Project.Account
{
    public partial class Register : System.Web.UI.Page
    {
       protected void Page_Load(object sender, EventArgs e)
       {
          usernameErrorLabel.Visible = false;
       }

       protected void CreateUserButton_Click(object sender, EventArgs e)
       {
          Random randomGenerator = new Random();

          bool isAdmin = AccountTypeDropDown.SelectedValue == "admin" ? true : false; //Set isAdmin to True iff the user type is "Admin".
          int eid = randomGenerator.Next(1, int.MaxValue); //Eid will be randomly generated for each employee.

          //FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false /* createPersistentCookie */);
          //string continueUrl = RegisterUser.ContinueDestinationPageUrl;

          using (SqlConnection connection = new SqlConnection(ConnectionStringClass.ConnectionString))
          {
             using (SqlCommand command = new SqlCommand())
             {
                /*Check if the username already exists*/
                command.CommandText = "SELECT * FROM Employees WHERE upper (username) = upper (@username)";
                command.Connection = connection;
                command.Parameters.AddWithValue("@username", UserName.Text);

                try
                {
                   connection.Open();

                   SqlDataReader reader = command.ExecuteReader();
                   if (reader.HasRows) //If the query returns anything, then the username already exists.
                   {
                      usernameErrorLabel.Visible = true;
                      return;
                   }

                   connection.Close();
                }
                catch //Display error message
                {
                   connection.Close();
                   Page.RegisterClientScriptBlock("mes", "<script language='javascript'>alert('Sorry, an error occurred')</script>");
                   Response.Redirect("/Default.aspx");
                   return;
                }
                /*End username check*/

                /*Create new user*/
                command.CommandText = "INSERT INTO Employees (Eid,firstname, lastname, username, password, address, position, mgrid, birthdate, isAdmin) " +
                                  "values (@eid,@first, @last,@user,@pass, @address, @position, @mgrID, @birthdate, @isAdmin)";


                command.Parameters.AddWithValue("@first", FirstnameTextBox.Text);
                command.Parameters.AddWithValue("@last", LastnameTextBox.Text);
                command.Parameters.AddWithValue("@user", UserName.Text);
                command.Parameters.AddWithValue("@pass", Password.Text);
                command.Parameters.AddWithValue("@address", AddressTextBox.Text);
                command.Parameters.AddWithValue("@position", PositionTextBox.Text);
                command.Parameters.AddWithValue("@mgrid", Session["eid"]); //Set manager id to the id of the user creating this account
                command.Parameters.AddWithValue("@birthdate", BirthdayTextBox.Text);
                command.Parameters.AddWithValue("@eid", eid);
                command.Parameters.AddWithValue("@isAdmin", isAdmin);

                try
                {
                   connection.Open();
                   command.ExecuteNonQuery();
                   connection.Close();
                }
                catch
                {
                   Page.RegisterClientScriptBlock("mes", "<script language='javascript'>alert('Sorry, an error occurred')</script>");
                   Response.Redirect("/Default.aspx");
                   return;
                }

                Page.RegisterClientScriptBlock("mes", "<script language='javascript'>alert('User created.')</script>");
                Response.Redirect("/Default.aspx");   
             } //end inner using
          }//end outer using
       } // end function
    }
}
