using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

namespace Website.BL
{
    public class Customer
    {

        internal static bool CustomerExists()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["iftDB"].ToString();
            bool customerExists = false;
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                using (SqlCommand myCommand = new SqlCommand("select * from customers where username = @UserName", myConnection))
                {
                    myCommand.Parameters.AddWithValue("UserName", Membership.GetUser().UserName.ToString());
                    using (SqlDataReader myDataReader = myCommand.ExecuteReader())
                    {
                        if (myDataReader.Read())
                        {
                            customerExists = true;
                        }
                    }
                }
            }
            return customerExists;
        }


        internal static void InsertCustomer()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["iftDB"].ToString();
            string sql = "insert into Customers(UserName) Values(@UserName)";
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                using (SqlCommand myCommand = new SqlCommand(sql, myConnection))
                {
                    myCommand.Parameters.AddWithValue("@UserName", Membership.GetUser().UserName.ToString());
                    myCommand.ExecuteNonQuery();
                }
            }
        }
    }
}