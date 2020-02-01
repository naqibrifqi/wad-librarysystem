using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace LibrarySystem
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                if (Page.IsValid)
                {
                    string username = txtusername.Text;
                    string pass = txtpass.Text;

                    using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\dorab\source\repos\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
                    {
                        try
                        {
                            con.Open();
                            string sql = "SELECT userID, username, password, role_id FROM tbluser WHERE username = '" + username + "' AND password = '" + pass + "'";

                            using (SqlCommand cmd = new SqlCommand(sql, con))
                            {
                                using (SqlDataReader reader = cmd.ExecuteReader())
                                {
                                    if (reader.HasRows)
                                    {
                                        reader.Read();
                                        string userid = reader["userID"].ToString();
                                        Session["username"] = username;
                                        Session["user_id"] = userid;
                                        Session["role_id"] = reader["role_id"].ToString();
                                        String roleid = reader["role_id"].ToString();
                                        if (roleid == "1")
                                        {
                                            Response.Redirect("admindash.aspx");
                                        }
                                        else
                                        {
                                            Response.Redirect("default.aspx");
                                        }
                                    }
                                    else
                                    {
                                        lblmessage.Text = "User not found!";
                                    }
                                }
                            }
                        }catch(SqlException ex)
                        {
                            lblmessage.Text = ex.Message;
                        }
                        finally
                        {
                            if(con.State != ConnectionState.Closed)
                            {
                                con.Close();
                            }
                        }
                    }

                    /*SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C: \Users\user\
                        documents\visual studio 2017\Projects\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True");

                    try
                    {
                        con.Open();
                        string sql = "SELECT username, password FROM tbluser WHERE username = '" + username + "' AND password = '" + pass + "'";
                        using ()
                            SqlCommand cmd = con.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT username, password FROM tbluser WHERE username = '" + username + "' AND password = '" + pass + "'";
                        cmd.ExecuteNonQuery();
                        if()

                    }
                    catch(SqlException ex)
                    {
                        txtusername.Text = ex.Message;
                    }
                    finally
                    {
                        Response.Redirect("home.aspx");
                    }
                    con.Close();
                    */
                }
            }
        }
    }
}