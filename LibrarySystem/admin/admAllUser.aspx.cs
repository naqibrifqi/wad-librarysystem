using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace LibrarySystem.admin
{
    public partial class admAllUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnDelete.OnClientClick = @"return confirm('Delete User?');";
            //Check whether the user is logged in or not
            if ((Session["username"] != null) && (Session["user_id"] != null) && (Session["role_id"] != null))
            {
                string roleid = Session["role_id"].ToString();
                if (roleid == "1")
                {
                    string user = string.Empty;
                    user = Convert.ToString(Session["username"]);
                }
                else
                {
                    Response.Redirect("../accDenied.aspx");
                }
            }
            else //if not logged in, user are sent back to login page
            {
                Response.Redirect("../accDenied.aspx");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string search = txtSearch.Text;
            //dtlUser.Visible = true;
            //btnDelete.Visible = true;
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;MultipleActiveResultSets=true;AttachDbFilename=C:\Users\dorab\source\repos\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    string sql = "SELECT userID FROM tblUser WHERE username LIKE @username OR userID LIKE @userid";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@username", "%" + search + "%");
                        cmd.Parameters.AddWithValue("@userid", "%" + search + "%");
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.HasRows)
                            {
                                if (dr.Read())
                                {
                                    lblForOp.Visible = true;
                                    ddlOperation.Visible = true;
                                    lblSelected.Text = dr["userID"].ToString();
                                }
                            }
                            else
                            {
                                lblSelected.Text = "No data exist on search enquiry.";
                            }
                        }
                    }
                    con.Close();
                }
                catch (SqlException ex)
                {
                    Response.Write("Ex " + ex.Message);
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string userid = GridView1.SelectedRow.Cells[1].Text;
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;MultipleActiveResultSets=true;AttachDbFilename=C:\Users\dorab\source\repos\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    string sql = "SELECT userID, username AS 'Username', age AS 'Age', CONCAT(firstname, ' ' ,lastname), " +
                        "CONCAT(address, ' ', postcode, ' ', city, ' ', state), status AS 'Status'" +
                        "FROM tblUser WHERE userID = @userid";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@userid", userid);
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.HasRows)
                            {
                                if (dr.Read())
                                {
                                    txtSearch.Text = dr["userID"].ToString();
                                    lblSelected.Text = dr["userID"].ToString();
                                    ddlOperation.Visible = true;
                                    lblForOp.Visible = true;
                                }
                            }
                        }
                    }
                    con.Close();
                }
                catch (SqlException ex)
                {
                    Response.Write("Ex " + ex.Message);
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string userid = txtSearch.Text;
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;MultipleActiveResultSets=true;AttachDbFilename=c:\users\user\documents\visual studio 2017\Projects\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    string sql = "DELETE FROM tblUser WHERE userID = @userid";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@userid", userid);
                        cmd.ExecuteNonQuery();
                        Response.Redirect("admAllUser.aspx");
                    }
                }catch(SqlException ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }

        protected void ddlOperation_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlOperation.SelectedValue == "1")
            {
                ddlRole.Visible = true;
                btnDelete.Visible = false;
                btnChange.Visible = true;
                lblForRole.Visible = true;
            }
            else if(ddlOperation.SelectedValue == "2")
            {
                ddlRole.Visible = false;
                lblForRole.Visible = false;
                btnDelete.Visible = true;
                btnChange.Visible = false;
            }
        }

        protected void ddlRole_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userid = lblSelected.Text;
            string roleid = ddlRole.SelectedValue;
            string rolename = ddlRole.SelectedItem.Text;
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;MultipleActiveResultSets=true;AttachDbFilename=c:\users\user\documents\visual studio 2017\Projects\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    string sql = "UPDATE tblUser SET role_id = @roleid WHERE userid = @userid";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@roleid", roleid);
                        cmd.Parameters.AddWithValue("@userid", userid);
                        cmd.ExecuteNonQuery();
                        lblMsg.Text = "Successfully changed role for User " + userid + " to " + rolename;
                    }
                }
                catch (SqlException ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }
    }
}