using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace LibrarySystem
{
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                Page.Validate();
                if (Page.IsValid)
                {
                    using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=c:\users\user\documents\visual studio 2017\Projects\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
                    {
                        using(SqlCommand cmd = new SqlCommand("spInsertUser", conn))
                        {
                            int stat = 5;
                            int role = 2;
                            cmd.CommandType = CommandType.StoredProcedure;

                            cmd.Parameters.AddWithValue("@username", SqlDbType.NVarChar).Value = txtUsername.Text;
                            cmd.Parameters.AddWithValue("@password", SqlDbType.NVarChar).Value = txtPass1.Text;
                            cmd.Parameters.AddWithValue("@firstname", SqlDbType.NVarChar).Value = txtFname.Text;
                            cmd.Parameters.AddWithValue("@lastname", SqlDbType.NVarChar).Value = txtLname.Text;
                            cmd.Parameters.AddWithValue("@address", SqlDbType.NVarChar).Value = txtAddr.Text;
                            cmd.Parameters.AddWithValue("@postcode", SqlDbType.NVarChar).Value = txtPostcode.Text;
                            cmd.Parameters.AddWithValue("@city", SqlDbType.NVarChar).Value = txtCity.Text;
                            cmd.Parameters.AddWithValue("@state", SqlDbType.NVarChar).Value = txtState.Text;
                            cmd.Parameters.AddWithValue("@age", SqlDbType.NVarChar).Value = txtAge.Text;
                            cmd.Parameters.AddWithValue("@status", SqlDbType.Int).Value = stat;
                            cmd.Parameters.AddWithValue("@role_id", SqlDbType.Int).Value = role;

                            try
                            {
                                conn.Open();
                                cmd.ExecuteNonQuery();
                                lblMsg.Text = "You have successfully registered to the system!";
                            }catch(SqlException ex)
                            {
                                lblMsg.Text = ex.Message;
                            }
                            finally
                            {
                                conn.Close();
                            }
                        }
                    }
                }
            }
        }
    }
}