using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_Term_Project
{
   public partial class ChangeEmployeeInfo : System.Web.UI.Page
   {
      protected void Page_Load(object sender, EventArgs e)
      {
          ErrorLabel.Visible = false;
      }

      protected void SubmitChangesButton_Clicked(object sender, EventArgs e)
      {
          StringBuilder update = new StringBuilder (); //String for update clause
          //Check if eid exists in the db.
          
          if (EmployeeIDTextBox.Text == "")
          {
              ErrorLabel.Text = "Employee ID is required";
              ErrorLabel.Visible = true;
              return;
          }

          //Make sure passwords match
          if (PasswordChangeTextBox.Text != "" && ConfirmPasswordChangeTextBox.Text != PasswordChangeTextBox.Text)
          {
              ErrorLabel.Text = "Passwords must match";
              ErrorLabel.Visible = true;
              return;
          }

          //Generate UPDATE clause (include only information from textboxes that are no blank)
          if (WageChangeTextBox.Text != "")
              update.Append("wage = @wage,");
          if (UsernameChangeTextBox.Text != "")
              update.Append ("username = @username,");
          if (AddressChangeTextBox.Text != "")
              update.Append("address = @address,");
          if (PasswordChangeTextBox.Text != "")
              update.Append( "password = @password,");
          if (PositionChangeTextBox.Text != "")
              update.Append( "position = @position,");
          if (MgrIDChangeTextbox.Text != "")
              update.Append( "mgrid = @mgrid");

          //Check if the last character of the "update" string is a comma. If it is, remove it.
          if (update[update.Length - 1] == ',')
             update.Remove(update.Length - 1, 1);


          //Update values
          using (SqlConnection connection = new SqlConnection(ConnectionStringClass.ConnectionString))
          {
             using (SqlCommand command = new SqlCommand())
             {
                command.CommandText = "UPDATE Employees " +
                                      "SET " + update +
                                      " WHERE Eid = @eid";
                command.Parameters.AddWithValue("@username", UsernameChangeTextBox.Text);
                command.Parameters.AddWithValue("@password", PasswordChangeTextBox.Text);
                command.Parameters.AddWithValue("@eid", int.Parse(EmployeeIDTextBox.Text));

                if (WageChangeTextBox.Text != "")//Add only if wage change box is not empty
                  command.Parameters.AddWithValue("@wage", Double.Parse (WageChangeTextBox.Text) );
                command.Parameters.AddWithValue("@address", AddressChangeTextBox.Text);
                command.Parameters.AddWithValue("@position", PositionChangeTextBox.Text);

                if (MgrIDChangeTextbox.Text != "")
                  command.Parameters.AddWithValue("@mgrid", int.Parse (MgrIDChangeTextbox.Text) );

                command.Connection = connection;

                try
                {
                   connection.Open();
                   command.ExecuteNonQuery ();
                   connection.Close();
                }
                catch
                {
                   connection.Close();
                   Page.RegisterClientScriptBlock("mes", "<script language='javascript'>alert('Sorry, an error occurred.')</script>");
                   return;
                }

                Page.RegisterClientScriptBlock("mes", "<script language='javascript'>alert('Employee Information Updated.')</script>");
                clearContents();
             }//end inner using
          }//end outer using
      }//end function

      /// <summary>
      /// Clears contents of all textboxes.
      /// </summary>
      private void clearContents()
      {
         EmployeeIDTextBox.Text = WageChangeTextBox.Text = AddressChangeTextBox.Text = UsernameChangeTextBox.Text = PasswordChangeTextBox.Text
            = ConfirmPasswordChangeTextBox.Text = PositionChangeTextBox.Text = MgrIDChangeTextbox.Text = "";
      }
   }
}