using System;
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
          String update = "";
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
              update += "wage = @wage,";
          if (UsernameChangeTextBox.Text != "")
              update += "username = @username,";
          if (AddressChangeTextBox.Text != "")
              update += "address = @address,";
          if (PasswordChangeTextBox.Text != "")
              update += "password = @password,";
          if (PositionChangeTextBox.Text != "")
              update += "position = @position,";
          if (MgrIDChangeTextbox.Text != "")
              update += "mgrID = @mgrID";

          //Check if the last character of the "update" string is a comma. If it is, remove it.




          //Update current values

      }
   }
}