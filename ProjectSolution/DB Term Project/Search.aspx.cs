using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_Term_Project
{
    public partial class Search : System.Web.UI.Page
    {
        String searchText;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void SearchTextBox_Changed(object sender, EventArgs e)
        {
            searchText = SearchTextBox.Text;
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {

        }


    }
}
