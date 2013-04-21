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
                Int32 rowsAffected;
                command.CommandText = "INSERT INTO Employees (Eid,firstname, lastname, username, password, address, position, mgrid, birthdate, isAdmin) " +
                                  "values (@eid,@first, @last,@user,@pass, @address, @position, @mgrID, @birthdate, @isAdmin)";
                command.Connection = connection;

                command.Parameters.AddWithValue("@first", FirstnameTextBox.Text);
                command.Parameters.AddWithValue("@last", LastnameTextBox.Text);
                command.Parameters.AddWithValue("@user", UserName.Text);
                command.Parameters.AddWithValue("@pass", Password.Text);
                command.Parameters.AddWithValue("@address", AddressTextBox.Text);
                command.Parameters.AddWithValue("@position", PositionTextBox.Text);
                command.Parameters.AddWithValue("@mgrid", 1); //Set manager id to the id of the user creating this account
                command.Parameters.AddWithValue("@birthdate", BirthdayTextBox.Text);
                command.Parameters.AddWithValue("@eid", eid);
                command.Parameters.AddWithValue("@isAdmin", isAdmin);

                try
                {
                   connection.Open();
                   rowsAffected = command.ExecuteNonQuery();
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
