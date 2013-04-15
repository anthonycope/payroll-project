using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace DB_Term_Project
{
    public partial class AddHours: System.Web.UI.Page
    {
        DateTime daySelected = DateTime.MaxValue;
        Double dayHours = 0;
        String connectionString = "Data Source=(local);Initial Catalog=DBProject;Integrated Security=True";
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
        }

        protected void HoursTextBox_TextChanged(object sender, EventArgs e)
        {
            Session["DayHours"] = Convert.ToDouble(HoursTextBox.Text);
            dayHours = (Double)Session["DayHours"];
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (daySelected == DateTime.MaxValue)
            {
                SelectDateLabel.Visible = true;
                //SelectDateLabel.Text = Convert.ToString(daySelected);
                SelectDateLabel.Text = "Please select a date";
            }
            else if (dayHours <= 0)
            {
                SelectDateLabel.Visible = true;
                SelectDateLabel.Text = "Please enter the number of hours";
            }
            else
            {
                SelectDateLabel.Visible = true;                
                //SelectDateLabel.Text = Convert.ToString(daySelected);

                /*
                //loop through days, subtract 1 day each time until day is sunday, use this value for weekOF
                DateTime weekOf = daySelected;
                while (weekOf.DayOfWeek != DayOfWeek.Sunday) // if not sunday, subtract a day until sunday
                {
                    //weekOf.Subtract(TimeSpan.FromDays(1)); // subtract a day
                    weekOf.AddDays(-1);
                    SelectDateLabel.Text = Convert.ToString(weekOf);
                }

                weekOf = weekOf.Date;
                */
                /*
                //send to database
                using( SqlConnection conn = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand())
                {
                    Int32 rowsAffected;
                    cmd.CommandText = "AddDailyHours";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@eid", 1);
                    cmd.Parameters.AddWithValue("@day", daySelected);
                    cmd.Parameters.AddWithValue("@hours", dayHours);
                    cmd.Parameters.AddWithValue("@weekStartDate", weekOf);

                    conn.Open();
                    rowsAffected = cmd.ExecuteNonQuery();
                    conn.Close();
                }*/
                
                
                //SelectDateLabel.Text = "Submission Successful";
                //SelectDateLabel.Text = Convert.ToString(weekOf);
                
                //reset variables
                Session["SelectedDate"] = null;
                Session["DayHours"] = null;
                daySelected = DateTime.MaxValue;
                dayHours = 0;
                
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            Session["SelectedDate"] = Calendar1.SelectedDate.Date;
            daySelected = (DateTime)Session["SelectedDate"];


        }
    }
}
