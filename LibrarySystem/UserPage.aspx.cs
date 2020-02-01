using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace LibrarySystem
{
    public partial class UserPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //btnUpdate.OnClientClick = @"return confirm('Confirm updating your address?');";
            //Check whether the user is logged in or not
            if ((Session["username"] != null) && (Session["user_id"] != null))
            {
                string user = string.Empty;
                user = Convert.ToString(Session["username"]);
            }
            else //if not logged in, user are sent back to login page
            {
                Response.Redirect("accDenied.aspx");
            }

            if (!Page.IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;MultipleActiveResultSets=true;AttachDbFilename=c:\users\user\documents\visual studio 2017\Projects\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
                {
                    string userid = Session["user_id"].ToString();
                    try
                    {
                        conn.Open();
                        string query = "SELECT address, postcode, city, state FROM tblUser WHERE userID = @userid";
                        using (SqlCommand command = new SqlCommand(query, conn))
                        {
                            command.Parameters.AddWithValue("@userid", userid);
                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                if (reader.HasRows)
                                {
                                    if (reader.Read())
                                    {
                                        txtAddr.Text = reader["address"].ToString();
                                        txtCity.Text = reader["city"].ToString();
                                        txtPostcode.Text = reader["postcode"].ToString();
                                        txtState.Text = reader["state"].ToString();
                                    }
                                }
                            }
                            conn.Close();
                        }
                    }
                    catch (SqlException exp)
                    {
                        Response.Write(exp.Message);
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string userid = Session["user_id"].ToString();
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;MultipleActiveResultSets=true;AttachDbFilename=c:\users\user\documents\visual studio 2017\Projects\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
            {
                try
                {
                    string addr = txtAddr.Text;
                    string post = txtPostcode.Text;
                    string city = txtCity.Text;
                    string state = txtState.Text;

                    con.Open();
                    SqlCommand cmds = con.CreateCommand();
                    cmds.CommandType = System.Data.CommandType.Text;
                    cmds.CommandText = "UPDATE tblUser " +
                        "SET address = '" + addr + "', postcode = '" + post + "', city = '" + city + "', state = '" + state + "' " +
                        "WHERE userID = '" + userid + "'";
                    cmds.ExecuteNonQuery();

                    /*string sql = "UPDATE tblUser " +
                        "SET address = '" + addr + "', postcode = '" + post + "', city = '" + city + "', state = '" + state + "' " +
                        "WHERE userID = '"+ userid + "'";*/
                    lblMsg.Text = "Your address have been updated successfully!";

                }
                catch (SqlException ex)
                {
                    Response.Write("Error ex: " + ex.Message);
                }
                con.Close();
            }
        }
    }
}