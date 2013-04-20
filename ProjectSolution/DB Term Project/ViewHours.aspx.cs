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
        int eid;
        String connectionString = "Data Source=(local);Initial Catalog=DBProject;Integrated Security=True"; //"Data Source=(local)\\SQLEXPRESS;Initial Catalog=DBProject;Integrated Security=True";
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


 

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            Session["SelectedDate"] = Calendar1.SelectedDate.Date;
            daySelected = (DateTime)Session["SelectedDate"];


        }

        protected void EidTextBox_TextChanged(object sender, EventArgs e)
        {
            Session["Eid"] = Convert.ToInt32(EidTextBox.Text);
            eid = (int)Session["Eid"];
        }

    }
}
