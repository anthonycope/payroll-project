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
        //Keeps track of the items on the navigation bar. Makes it easier to reference those
        //items by index later.
        private enum items { home, addUser, about };
        private MenuItem addUserItem = new MenuItem ("Create New User");


        protected void Page_Load(object sender, EventArgs e)
        {
            int index = (int)items.addUser;
            addUserItem.NavigateUrl = "~/Default.aspx";

            if (Account.Login.IsAdmin)
                if (NavigationMenu.Items [index].Value != "New User") //Add the "Create New User" link if it hasn't been already added
                    NavigationMenu.Items.AddAt(index, addUserItem);
            else
                if (NavigationMenu.Items[index].Value == "New User") //Remove the "Create New User" link if it hasn't already been removed
                    NavigationMenu.Items.RemoveAt(index);
        }
    }
}
