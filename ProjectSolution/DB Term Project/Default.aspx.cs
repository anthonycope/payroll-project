﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_Term_Project
{
   //This is simply a class that will make it easier for us to access the connection string in any of the project files.
   /// <summary>
   /// Static class that allows access to the project db's connection string
   /// </summary>
   public static class ConnectionStringClass
   {
<<<<<<< HEAD
      private static String connectionString = "Data Source=(local);Initial Catalog=DBProject;Integrated Security=True";
=======
      private static String connectionString = "Data Source=(local);Initial Catalog=DBProject;Integrated Security=True";// "Data Source=(local)\\SQLEXPRESS;Initial Catalog=DBProject;Integrated Security=True";
      //"Data Source=(local);Initial Catalog=DBProject;Integrated Security=True"
>>>>>>> Developer

      /// <summary>
      /// Returns db's connection string.
      /// </summary>
      public static String ConnectionString
      {
         get { return connectionString; }
      }
   }

    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           //Redirect user to login page if user is not logged in.
           if (!Account.Login.IsLoggedIn)
              Response.Redirect("/Account/Login.aspx");
           else
              Response.Redirect("/AddHours.aspx");
        }
    }
}
