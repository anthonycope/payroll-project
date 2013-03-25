/******************************************************************************************************************
 * Note that currently the dynamically added options (links on the navigation bar containing "Home", "About", etc)
 * simply redirects the user to the home page because the proper pages have not been created yet.
 * ****************************************************************************************************************/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_Term_Project
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        //Keeps track of the items on the navigation bar; they're listed in the order in which
        // they appear in the navigation bar. This makes it easier to reference those items by index later.
        private enum items { home, about };

        //Menu item IDs
        static string createUserID = "New User"; //ID for MenuItem_createUserItem object
        static string payrollID = "Payroll"; //ID for MenuItem_payrollItem object
        static string payHistoryID = "Pay History"; //ID for MenuItem_myPayHistory object

        //Items (options) to be added to navigation bar at run-time based on the type of user that is logged in.
        private MenuItem MenuItem_createUserItem = new MenuItem ("Create New User", createUserID);
        private MenuItem MenuItem_payrollItem = new MenuItem("View Payroll", payrollID);
        private MenuItem MenuItem_myPayHistory = new MenuItem("View My Pay History", payHistoryID);


        protected void Page_Load(object sender, EventArgs e)
        {
            MenuItem_createUserItem.NavigateUrl = "~/Account/Register.aspx";
            MenuItem_myPayHistory.NavigateUrl = "~/Default.aspx";
            MenuItem_payrollItem.NavigateUrl = "~/Default.aspx";
            updateUserOptions(); //Shows appropriate options based on the user's login privileges
        }

        /// <summary>
        /// Adds add appropriate options for the type of user logged in
        /// </summary>
        private void updateUserOptions()
        {
            int myPayIndex = (int)items.home + 1; //Add the "View My Pay History" to the right of "Home"
            int createUserIndex = myPayIndex + 1; //Add the "Create User" to the right of "View My Pay History"
            int payrollIndex = createUserIndex + 1; //Add the "Create User" to the right of "Create User"

            /*Add "View My Pay History" option for any user*/
            if (Account.Login.IsLoggedIn)
                    NavigationMenu.Items.AddAt(myPayIndex, MenuItem_myPayHistory); //Add the "Create New User" link


            /*Add  "Create New User" option for admin*/
            if (Account.Login.IsAdmin)
                    NavigationMenu.Items.AddAt(createUserIndex, MenuItem_createUserItem); //Add the "Create New User" link         

            /*Add "View Payroll" option for admin*/
            if (Account.Login.IsAdmin)
                NavigationMenu.Items.AddAt(payrollIndex, MenuItem_payrollItem); //Add the "View Payroll" link
    
        }
    }
}
