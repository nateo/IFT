using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

namespace Website.Admin
{
    public partial class Discounts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddDiscount_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["iftDB"].ToString();
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                using (SqlCommand myCommand = new SqlCommand("sp_AdjustPrices", myConnection))
                {
                    myCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    myCommand.Parameters.AddWithValue("@ModifiedBy", Membership.GetUser().UserName.ToString());
                    decimal percentage = Convert.ToDecimal(txtPercentage.Text);
                    myCommand.Parameters.AddWithValue("@Percentage", percentage);
                    myCommand.ExecuteNonQuery();
                }
            }
        }
    }
}