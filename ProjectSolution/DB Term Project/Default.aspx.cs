using System;
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
      private static String connectionString = "Data Source=(local)\\SQLEXPRESS;Initial Catalog=DBProject;Integrated Security=True";

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
        //string position = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
