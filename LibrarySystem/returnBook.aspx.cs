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
    public partial class returnBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnSubmit.Visible = false;
            lblExist.Visible = true;
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
        }

        protected void grdCheckout_SelectedIndexChanged(object sender, EventArgs e)
        {
            string checkout_id = grdCheckout.SelectedRow.Cells[1].Text;
            Session["checkout_id"] = checkout_id;
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;MultipleActiveResultSets=true;AttachDbFilename=C:\Users\dorab\source\repos\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    string sql = "SELECT * FROM tblCheckout WHERE id = @checkout_id";
                    using(SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@checkout_id", checkout_id);
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                btnSubmit.Visible = true;
                                lblExist.Visible = false;
                                if (reader.Read())
                                {
                                    string date_status;
                                    string fee_status;
                                    string dt = reader["date_deadline"].ToString();
                                    DateTime dtt = DateTime.Parse(dt);
                                    int ndt;

                                    if (dtt < DateTime.Now)
                                    {
                                        ndt = (DateTime.Now - dtt).Days;
                                        date_status = "You are late by " + ndt + " days.";
                                        double fee = ndt * 2;
                                        fee_status = "You are required to pay RM " + Math.Round(fee, 2) + " upon returning the book. ";

                                        con.Close();
                                        try
                                        {
                                            con.Open();
                                            string query = "UPDATE tblCheckout SET fee = @fee WHERE user_id = @userid AND id = @checkout_id";
                                            using (SqlCommand command = new SqlCommand(query, con))
                                            {
                                                command.Parameters.AddWithValue("@fee", fee);
                                                command.Parameters.AddWithValue("@userid", Session["user_id"]);
                                                command.Parameters.AddWithValue("@checkout_id", Session["checkout_id"]);
                                                command.ExecuteNonQuery();
                                            }
                                        }
                                        catch (SqlException exf)
                                        {
                                            lblmsg2.Text = exf.Message;
                                        }
                                        con.Close();
                                    }
                                    else
                                    {
                                        ndt = (dtt - DateTime.Now).Days;
                                        date_status = ndt + " days left.";
                                        fee_status = "";
                                    }

                                    lblMsg.Text = date_status + "<br />" + fee_status;
                                }
                            }
                            else
                            {
                                lblExist.Text = "You have not borrow any books yet.";
                            }
                        }
                    }
                }
                catch(SqlException ex)
                {
                    Response.Write(ex.Message);
                }
                finally
                {
                    
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string checkout_id = Session["checkout_id"].ToString();
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;MultipleActiveResultSets=true;AttachDbFilename=C:\Users\dorab\source\repos\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    string sql = "UPDATE tblCheckout SET status = 'RETURNED' WHERE Id = @checkout_id";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@checkout_id", checkout_id);
                        cmd.ExecuteNonQuery();
                        //Response.Redirect("returnBook.aspx");
                    }
                    con.Close();
                }catch(SqlException ex)
                {
                    Response.Write(ex.Message);
                }

                try
                {
                    int userid = Convert.ToInt32(Session["user_id"]);
                    con.Open();
                    string query = "UPDATE tblUser SET status = status + 1 WHERE userID = @userid";
                    using(SqlCommand command = new SqlCommand(query, con))
                    {
                        command.Parameters.AddWithValue("@userid", userid);
                        command.ExecuteNonQuery();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your return receipt has been submitted with the id: " + checkout_id + ", please bring your book to the counter along with your receipt ID number.')", true);
                        hplBack.Visible = true;
                    }
                }catch(SqlException exUpdateStat)
                {
                    Response.Write("Update Error: " + exUpdateStat.Message);
                }
            }
        }
    }
}