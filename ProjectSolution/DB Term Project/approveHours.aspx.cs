﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace DB_Term_Project
{
    public partial class approveHours : System.Web.UI.Page
    {
        public string mgrid { get; set; }
        String connectionString = "Data Source=(local)\\SQLEXPRESS;Initial Catalog=DBProject;Integrated Security=True";
        //Anthony's Connection// "Data Source=(local);Initial Catalog=DBProject;Integrated Security=True"

        protected void Page_Load(object sender, EventArgs e)
        {
            mgrid = "1";
        }

        protected void WeekHourGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = WeekHourGridView.SelectedRow;

            string queryString = "INSERT INTO DBProject.dbo.Approval VALUES(" + row.Cells[1].Text + ",'" + row.Cells[2].Text + "'," + mgrid + ", 'Approved')";
            //send to database
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                try
                {
                    while (reader.Read())
                    {
                        Console.WriteLine(String.Format("{0}, {1}", reader[0], reader[1]));
                    }
                }
                finally
                {
                    // Always call Close when done reading.
                    reader.Close();
                }
            }


            Literal1.Text = "Approval Successful";
            //SelectDateLabel.Text = Convert.ToString(weekOf);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            mgrid = DropDownList1.SelectedValue.ToString();
            SqlDataSource1.SelectCommand = "SELECT w.Eid, w.weekOf, w.Hours_Worked FROM Weekly_Hours AS w INNER JOIN Employees AS e ON w.Eid = e.Eid AND e.Mgrid = " + mgrid;
            WeekHourGridView.DataBind();
        }
    }
}