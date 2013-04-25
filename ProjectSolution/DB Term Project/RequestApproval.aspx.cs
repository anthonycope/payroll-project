using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace DB_Term_Project
{
    public partial class RequestApproval: System.Web.UI.Page
    {
        DateTime daySelected = DateTime.MaxValue;
        int eid = 0;
        String connectionString =  ConnectionStringClass.ConnectionString;//"Data Source=(local)\\SQLEXPRESS;Initial Catalog=DBProject;Integrated Security=True";
        //Anthony's Connection// "Data Source=(local);Initial Catalog=DBProject;Integrated Security=True"
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SelectedDate"] != null)
            {
                daySelected = (DateTime)Session["SelectedDate"];
            }

            if (Session["Eid"] != null)
            {
                eid = (int)Session["Eid"];
            }
        }



        protected void ApprovalButton_Click(object sender, EventArgs e)
        {
            if (daySelected == DateTime.MaxValue)
            {
                SelectDateLabel.Visible = true;
                //SelectDateLabel.Text = Convert.ToString(daySelected);
                SelectDateLabel.Text = "Please select a date";
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
                    //SelectDateLabel.Text = Convert.ToString(weekOf);
                }

                weekOf = weekOf.Date;
                
                
                //send to database
                using( SqlConnection conn = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand())
                {
                    Int32 rowsAffected;
                    cmd.CommandText = "RequestApproval";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@eid", eid);
                    cmd.Parameters.AddWithValue("@weekOf", weekOf);

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
                //eid = 0;

                Calendar1.SelectedDates.Clear();
                //EidTextBox.Text =EidTextBox.Text.Remove(0);
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            Session["SelectedDate"] = Calendar1.SelectedDate.Date;
            daySelected = (DateTime)Session["SelectedDate"];

            DateTime weekOf = daySelected;
            while (weekOf.DayOfWeek != DayOfWeek.Sunday) // if not sunday, subtract a day until sunday
            {
                //weekOf.Subtract(TimeSpan.FromDays(1)); // subtract a day
                weekOf = weekOf.AddDays(-1);
                //SelectDateLabel.Text = Convert.ToString(weekOf);
            }

            weekOf = weekOf.Date;
            HiddenField1.Value = Convert.ToString(weekOf);

            SqlDataSource1.SelectCommand = "SELECT weekOf, Hours_Worked FROM Weekly_Hours WHERE Eid = " + eid + " AND weekOf = '" + weekOf.ToString() + "'";
            GridView1.DataBind();

        }

        protected void EidTextBox_TextChanged(object sender, EventArgs e)
        {
            //Session["TempEid"] = Convert.ToInt32(EidTextBox.Text);
            //eid = (int)Session["TempEid"];
        }



    }
}
