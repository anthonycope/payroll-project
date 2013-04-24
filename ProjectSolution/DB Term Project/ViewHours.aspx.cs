﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace DB_Term_Project
{
    public partial class ViewHours: System.Web.UI.Page
    {
        DateTime daySelected = DateTime.MaxValue;
        Double dayHours;
        int eid;
        String connectionString = ConnectionStringClass.ConnectionString; //"Data Source=(local);Initial Catalog=DBProject;Integrated Security=True"; //"Data Source=(local)\\SQLEXPRESS;Initial Catalog=DBProject;Integrated Security=True";
        //Anthony's Connection// "Data Source=(local);Initial Catalog=DBProject;Integrated Security=True"
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SelectedDate"] != null)
            {
                daySelected = (DateTime)Session["SelectedDate"];
            }
            if (Session["DayHours"] != null)
            {
                dayHours = (Double)Session["DayHours"];
            }

            if (Session["TempEid"] != null)
            {
                eid = (int)Session["TempEid"];
            }
        }

        protected void HoursTextBox_TextChanged(object sender, EventArgs e)
        {
            Double temp;
            bool valid = Double.TryParse(HoursTextBox.Text, out temp);
            if (valid)
            {
                Session["DayHours"] = temp;
                dayHours = (Double)Session["DayHours"];
                InvalidInput1.Visible = false;
            }
            else
            {
                InvalidInput1.Visible = true;
                SelectDateLabel.Text = "";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (daySelected == DateTime.MaxValue)
            {
                SelectDateLabel.Visible = true;
                //SelectDateLabel.Text = Convert.ToString(daySelected);
                SelectDateLabel.Text = "Please select a date";
            }

            else if (dayHours <= 0 && !InvalidInput1.Visible)
            {
                SelectDateLabel.Visible = true;
                SelectDateLabel.Text = "Please enter the number of hours";
            }
            else if (InvalidInput1.Visible)
            {
                // don't execute query
            }

            else
            {
                SelectDateLabel.Visible = true;
                //SelectDateLabel.Text = Convert.ToString(daySelected);


                //loop through days, subtract 1 day each time until day is sunday, use this value for weekOF
                DateTime weekOf = daySelected;
                while (weekOf.DayOfWeek != DayOfWeek.Sunday) // if not sunday, subtract a day until sunday
                {
                    //weekOf.Subtract(TimeSpan.FromDays(1)); // subtract a day
                    weekOf = weekOf.AddDays(-1);
                    SelectDateLabel.Text = Convert.ToString(weekOf);
                }

                weekOf = weekOf.Date;


                //send to database
                using (SqlConnection conn = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand())
                {
                    Int32 rowsAffected;
                    cmd.CommandText = "AddDailyHours";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@eid", eid);
                    cmd.Parameters.AddWithValue("@day", daySelected);
                    cmd.Parameters.AddWithValue("@hours", dayHours);
                    cmd.Parameters.AddWithValue("@weekStartDate", weekOf);

                    conn.Open();
                    rowsAffected = cmd.ExecuteNonQuery();
                    conn.Close();
                }


                SelectDateLabel.Text = "Submission Successful";
                //SelectDateLabel.Text = Convert.ToString(weekOf);

                //reset variables
                Session["SelectedDate"] = null;
                Session["DayHours"] = null;
                Session["TempEid"] = null;

                daySelected = DateTime.MaxValue;
                dayHours = 0;
                eid = 0;

                Calendar1.SelectedDates.Clear();
                EidTextBox.Text = EidTextBox.Text.Remove(0);
                HoursTextBox.Text = HoursTextBox.Text.Remove(0);
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            Session["SelectedDate"] = Calendar1.SelectedDate.Date;
            daySelected = (DateTime)Session["SelectedDate"];


        }

        protected void EidTextBox_TextChanged(object sender, EventArgs e)
        {
            Session["TempEid"] = Convert.ToInt32(EidTextBox.Text);
            eid = (int)Session["TempEid"];
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

    }
}
