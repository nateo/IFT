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
    public partial class AdjustPrices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdjustPrices_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["iftDB"].ToString();
                using (SqlConnection myConnection = new SqlConnection(connectionString))
                {
                    myConnection.Open();
                    using (SqlCommand myCommand = new SqlCommand("sp_AdjustPrices", myConnection))
                    {
                        myCommand.CommandType = System.Data.CommandType.StoredProcedure;
                        myCommand.Parameters.AddWithValue("@ModifiedBy", Membership.GetUser().UserName.ToString());
                        decimal percentage = 0;
                        switch (rblAdjustmentDirection.SelectedValue.ToString())
                        {
                            case "Raise":
                                percentage = Convert.ToDecimal(txtPercentage.Text) ;
                                break;
                            case "Lower":
                                percentage = Convert.ToDecimal(txtPercentage.Text) * -1;
                                break;

                        }
                        myCommand.Parameters.AddWithValue("@Percentage", percentage);
                        myCommand.ExecuteNonQuery();
                    }
                }
                lblResult.Visible = true;
                lblResult.Text = "Command confirmed...Prices have been adjusted";
            }
            catch (Exception exception)
            {
                lblResult.Visible = true;
                lblResult.Text = "Something went wrong..." + exception.Message.ToString();
            }
            gvPriceHistory.DataBind();
        }
    }
}