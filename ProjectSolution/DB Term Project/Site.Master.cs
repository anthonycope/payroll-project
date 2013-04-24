﻿/******************************************************************************************************************
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
        private enum items {viewHours, approvalRequest, addHours, /*myPay,*/ createUser, /*payRoll,*/ modifyInfo, approveHours, search, about };

        //Menu item IDs
        static string createUserID = "New User"; //ID for MenuItem_createUserItem object
        static string payrollID = "Payroll"; //ID for MenuItem_payrollItem object
        static string payHistoryID = "Pay History"; //ID for MenuItem_myPayHistory object
        static string addHoursID = "Add Hours";
        static string approveHoursID = "Approve Hours";
        static string modifyInfoID = "Modify Info";
        static string approvalRequestID = "Approval Request";
        static string searchID = "Search";
        static string viewHoursID = "View Hours";


        /*Items (options) to be added to navigation bar at run-time based on the type of user that is logged in.*/
        private MenuItem MenuItem_createUserItem = new MenuItem ("Create New User", createUserID);
        private MenuItem MenuItem_payrollItem = new MenuItem("View Payroll", payrollID);
        private MenuItem MenuItem_myPayHistory = new MenuItem("View My Pay History", payHistoryID);
        private MenuItem MenuItem_addHours = new MenuItem(addHoursID, addHoursID);
        private MenuItem MenuItem_approveHours = new MenuItem(approveHoursID, approveHoursID);
        private MenuItem MenuItem_modifyInfo = new MenuItem(modifyInfoID, modifyInfoID);
        private MenuItem MenuItem_approvalRequest = new MenuItem (approvalRequestID, approvalRequestID);
        private MenuItem MenuItem_search = new MenuItem(searchID, searchID);
        private MenuItem MenuItem_viewHours = new MenuItem(viewHoursID, viewHoursID);


        protected void Page_Load(object sender, EventArgs e)
        {
           if (Account.Login.IsLoggedIn)
              LoginLink.Text = "[Log Out]";
           else
              LoginLink.Text = "[Log In]";

            MenuItem_createUserItem.NavigateUrl = "~/Account/Register.aspx";
            MenuItem_myPayHistory.NavigateUrl = "~/Default.aspx";
            MenuItem_payrollItem.NavigateUrl = "~/Default.aspx";
            MenuItem_approveHours.NavigateUrl = "~/approveHours.aspx";
            MenuItem_addHours.NavigateUrl = "~/AddHours.aspx";
            MenuItem_modifyInfo.NavigateUrl = "~/ChangeEmployeeInfo.aspx";
            MenuItem_approvalRequest.NavigateUrl = "~/RequestApproval.aspx";
            MenuItem_search.NavigateUrl = "~/Search.aspx";
            MenuItem_addHours.NavigateUrl = "~/AddHours.aspx";
            MenuItem_viewHours.NavigateUrl = "~/ViewHours.aspx";

            updateUserOptions(); //Shows appropriate options based on the user's login privileges
        }

        /// <summary>
        /// Adds add appropriate options for the type of user logged in
        /// </summary>
        private void updateUserOptions()
        {

            /*Add options for any user*/
            if (Account.Login.IsLoggedIn)
            {
                //NavigationMenu.Items.AddAt((int)items.myPay, MenuItem_myPayHistory);
                NavigationMenu.Items.AddAt((int)items.viewHours, MenuItem_viewHours);
                NavigationMenu.Items.AddAt((int)items.approvalRequest, MenuItem_approvalRequest);
                NavigationMenu.Items.AddAt((int)items.addHours, MenuItem_addHours); 
            }


            /*Add menu options for admin*/
            if (Account.Login.IsAdmin)
            {
                NavigationMenu.Items.AddAt( (int)items.createUser, MenuItem_createUserItem);
                //NavigationMenu.Items.AddAt((int)items.payRoll, MenuItem_payrollItem);               
                NavigationMenu.Items.AddAt((int)items.modifyInfo, MenuItem_modifyInfo);
                NavigationMenu.Items.AddAt((int)items.approveHours, MenuItem_approveHours);
                NavigationMenu.Items.AddAt((int)items.search, MenuItem_search);
            }
    
        }

        protected void LoginLink_Click(object sender, EventArgs e)
        {
           //If user is already logged in, redirect him to the home page upon logout.
           if (Account.Login.IsLoggedIn)
           {
              //Set the loggedIn and admin values to false so next time the page loads, the
              //admin and user options will be gone
              Account.Login.IsLoggedIn = false;
              Account.Login.IsAdmin = false;
              Response.Redirect("/Account/Login.aspx");
           }
           else
           {
              Response.Redirect("/Account/Login.aspx");
           }
        }
    }
}
