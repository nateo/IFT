using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Website.Admin
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["iftDB"].ToString();
                string sql = "select CategoryID, Description as CategoryDescription from Categories; " +
                    "select TypeID, CategoryID, Description as TypeDescription from Types; ";
                using (SqlConnection conn = new SqlConnection(connectionString))
                {

                    using (SqlDataAdapter da = new SqlDataAdapter(sql, conn))
                    {
                        da.TableMappings.Add("Categories", "Categories");
                        da.TableMappings.Add("Types", "Types");
                        
                        da.Fill(ds);

                        ds.Relations.Add("Category_Type_relation",
                            ds.Tables[0].Columns["CategoryID"],
                            ds.Tables[1].Columns["CategoryID"]);
                    }
                }
            }
            finally 
            {
                CategoriesRepeater.DataSource = ds.Tables[0];
                CategoriesRepeater.DataBind();             
            }
        }


    }
}