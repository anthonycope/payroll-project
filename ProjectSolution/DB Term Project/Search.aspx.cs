using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DB_Term_Project
{
    public partial class Search : System.Web.UI.Page
    {
        String searchText;
        String connectionString = "Data Source=(local);Initial Catalog=DBProject;Integrated Security=True"; //"Data Source=(local)\\SQLEXPRESS;Initial Catalog=DBProject;Integrated Security=True";
        //Anthony's Connection// "Data Source=(local);Initial Catalog=DBProject;Integrated Security=True"

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SearchText"] != null)
            {
                searchText = (String)Session["SearchText"];
            }
        }

        protected void SearchTextBox_Changed(object sender, EventArgs e)
        {
            searchText = SearchTextBox.Text;
            Session["SearchText"] = searchText;
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            bool textOkay = true;

            using (SqlConnection conn = new SqlConnection(ConnectionStringClass.ConnectionString))
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "Search";
                //cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Connection = conn;                
                cmd.Parameters.AddWithValue("@Choice", DropDownList1.SelectedIndex);

                int index = DropDownList1.SelectedIndex;

                switch (index)
                {
                    case 0: // Eid/MgrID
                    case 5:
                        int temp;
                        bool validInt = Int32.TryParse(searchText, out temp);
                        if (!validInt)
                        {
                            // print out error
                            textOkay = false;
                        }
                        else
                        {
                            if (index == 0)
                            {
                                cmd.Parameters.AddWithValue("@eid", temp);
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@mgrid", temp);
                            }
                        }
                        break;
                    case 1:
                    case 2:
                    case 3:
                    case 6:
                        //text should always be okay because it's a string, so just won't return if invalid
                        if (index == 1)
                        {
                            cmd.Parameters.AddWithValue("@firstName", searchText);
                        }
                        else if (index == 2)
                        {
                            cmd.Parameters.AddWithValue("@lastName", searchText);
                        }
                        else if (index == 3)
                        {
                            cmd.Parameters.AddWithValue("@position", searchText);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@username", searchText);
                        }
                        break;

                    case 4:
                        DateTime tempDate;
                        bool validDate = DateTime.TryParse(searchText, out tempDate);
                        if (!validDate)
                        {
                            textOkay = false;
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@birthdate", tempDate);
                        }
                        break;
                    case 7:
                        Decimal tempDecimal;
                        bool validDecimal = Decimal.TryParse(searchText, out tempDecimal);
                        if (!validDecimal)
                        {
                            textOkay = false;
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@wage", tempDecimal);
                        }
                        break;



                }

                if (textOkay)
                {
                    InvalidInput.Visible = false;
                    DataTable datatable = new DataTable();
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    adp.Fill(datatable);

                    GridView1.DataSource = datatable;
                    GridView1.DataBind();
                }
                else
                {
                    InvalidInput.Visible = true;
                }

                SearchTextBox.Text = SearchTextBox.Text.Remove(0);

            }
                
        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }


    }
}
