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
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                if (Page.IsValid)
                {
                    string username = txtUsername.Text;
                    string pass1 = txtPass1.Text;
                    string pass2 = txtPass2.Text;
                    string fname = txtFname.Text;
                    string lname = txtLname.Text;
                    string addr = txtAddr.Text;
                    string postcode = txtPostcode.Text;
                    string city = txtCity.Text;
                    string state = txtState.Text;
                    string age = txtAge.Text;
                    string membership = "normal";

                    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=c:\users\user\documents\visual studio 2017\Projects\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True");

                    SqlCommand cmd = new SqlCommand("spInsertUser", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@username", SqlDbType.NVarChar).Value = txtUsername.Text;
                    cmd.Parameters.Add("@password", SqlDbType.NVarChar).Value = txtPass1.Text;
                    cmd.Parameters.Add("@firstname", SqlDbType.NVarChar).Value = txtFname.Text;
                    cmd.Parameters.Add("@lastname", SqlDbType.NVarChar).Value = txtLname.Text;
                    cmd.Parameters.Add("@address", SqlDbType.NVarChar).Value = txtAddr.Text;
                    cmd.Parameters.Add("@postcode", SqlDbType.NVarChar).Value = txtPostcode.Text;
                    cmd.Parameters.Add("@city", SqlDbType.NVarChar).Value = txtCity.Text;
                    cmd.Parameters.Add("@state", SqlDbType.NVarChar).Value = txtState.Text;
                    cmd.Parameters.Add("@age", SqlDbType.Int).Value = txtAge.Text;
                    cmd.Parameters.Add("@membership", SqlDbType.NVarChar).Value = membership;
                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        lblStatus.Text = "Registration Successful!";
                    }
                    catch(SqlException ex)
                    {
                        lblStatus.Text = ex.Message;
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
        }
    }
}