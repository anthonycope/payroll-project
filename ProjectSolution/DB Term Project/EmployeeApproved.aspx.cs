using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_Term_Project
{
    public partial class EmployeeApproved : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           //Make connection strings the same as the one defined in Default.aspx.cs.
           SqlDataSource1.ConnectionString = ConnectionStringClass.ConnectionString;
           SqlDataSource2.ConnectionString = ConnectionStringClass.ConnectionString;
           SqlDataSource3.ConnectionString = ConnectionStringClass.ConnectionString;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT [weekOf], [mgrid], [Amount], [Hours] FROM [Approval] WHERE eid = " + DropDownList1.SelectedValue + " AND Approved = 'Approved'";
            SqlDataSource2.SelectCommand = "SELECT [weekOf], [Amount], [Hours], [mgrid] FROM [Approval] WHERE eid = " + DropDownList1.SelectedValue + " AND APPROVED = 'Awaiting Approval'";
            GridView1.DataBind();
            GridView2.DataBind();
        }
    }
}