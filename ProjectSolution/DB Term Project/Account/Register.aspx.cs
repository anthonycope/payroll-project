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
        String connectionString = "Data Source=Henrys-PC;Initial Catalog=DBProject;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
           Random randomGenerator = new Random();

           bool isManager = AccountTypeDropDown.SelectedValue == "admin" ? true : false; //Set isManager to True iff the user type is "Admin".
           int eid = randomGenerator.Next(1, int.MaxValue); //Eid will be randomly generated for each employee.
           

            FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false /* createPersistentCookie */);
            string continueUrl = RegisterUser.ContinueDestinationPageUrl;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
               using (SqlCommand command = new SqlCommand())
               {
                  Int32 rowsAffected;
                  command.CommandText = "INSERT INTO Employees (Eid,firstname, lastname, username, password, address, position, mgrid, birthdate) " +
                                    "values ('@eid','@first', '@last','@user','@pass', '@address', '@position', '@mgrID', '@birthdate')";
                  command.Connection = connection;

                  command.Parameters.AddWithValue("first", FirstnameTextBox.Text);
                  command.Parameters.AddWithValue("last", LastnameTextBox.Text);
                  command.Parameters.AddWithValue("user", RegisterUser.UserName);
                  command.Parameters.AddWithValue("pass", RegisterUser.Password);
                  command.Parameters.AddWithValue("address", AddressTextBox.Text);
                  command.Parameters.AddWithValue("position", PositionTextBox.Text);
                  command.Parameters.AddWithValue("mgrid", 1); //Set manager id to the id of the user creating this account
                  command.Parameters.AddWithValue("birthdate", BirthdayTextBox.Text);
                  command.Parameters.AddWithValue("eid", eid);

                  try
                  {
                     connection.Open();
                     rowsAffected = command.ExecuteNonQuery();
                     connection.Close();
                  }
                  catch
                  {
                     //Display error message.
                  }
               }
            }

            if (String.IsNullOrEmpty(continueUrl))
            {
                continueUrl = "~/";
            }
            Response.Redirect(continueUrl);
        }

        private Exception Exception(string p)
        {
           throw new NotImplementedException();
        }

    }
}
