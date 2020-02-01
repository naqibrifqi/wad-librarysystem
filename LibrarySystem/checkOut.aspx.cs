using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Services;

namespace LibrarySystem
{
    public partial class checkOut : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            //Check whether the user is logged in or not
            if (Session["username"] != null)
            {
                string user = string.Empty;
                user = Convert.ToString(Session["username"]);
            }
            else //if not logged in, user are sent back to login page
            {
                Response.Redirect("accDenied.aspx");
            }
        }

        protected void ddlBook_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSelected.Text = ddlBook.SelectedValue + " " + ddlBook.SelectedItem;
            TextBox1.Text = "";
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            string user = string.Empty;
            user = Convert.ToString(Session["username"]);
            if (Page.IsPostBack)
            {
                if (Page.IsValid)
                {
                    using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;MultipleActiveResultSets=true;AttachDbFilename=c:\users\user\documents\visual studio 2017\Projects\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
                    {
                        try
                        {
                            con.Open();
                            string sql = "SELECT userID, status FROM tblUser WHERE username = @user";

                            using (SqlCommand cmd = new SqlCommand(sql, con))
                            {
                                cmd.Parameters.AddWithValue("@user", user);
                                using (SqlDataReader reader = cmd.ExecuteReader())
                                {
                                    if(reader.Read())
                                    {
                                        string status = reader["status"].ToString(); //read status number from database
                                        int stat = int.Parse(status);
                                        string user_id = reader["userID"].ToString();

                                        con.Close();
                                        if(stat > 0) //check whether user status are permitted to borrow book
                                        {
                                            try
                                            {
                                                //string sql2 = "INSERT INTO tblCheckout VALUES('" + ddlBook.SelectedValue + "', '" + user_id + "')";
                                                //string sql2 = "INSERT INTO tblCheckout VALUES(@book_id, @userID)";
                                                //using (SqlCommand cmnd = new SqlCommand(sql2, con))
                                                //{
                                                //cmnd.Parameters.AddWithValue("@book_id", ddlBook.SelectedValue);
                                                //cmnd.Parameters.AddWithValue("@userID", user_id);
                                                //con.Open();
                                                //cmnd.ExecuteNonQuery();
                                                //}
                                                con.Open();
                                                string bookid;
                                                if (TextBox1.Text == "")
                                                {
                                                    bookid = ddlBook.SelectedValue;
                                                }
                                                else
                                                {
                                                    //bookid = TextBox1.Text;
                                                    bookid = Session["bookid"].ToString();
                                                }
                                                string userid = user_id;
                                                SqlCommand cmnd = con.CreateCommand();
                                                cmnd.CommandType = System.Data.CommandType.Text;
                                                cmnd.CommandText = "INSERT INTO tblCheckout VALUES('" + bookid + "','" + userid + "','" + DateTime.Now + "','" + DateTime.Now.AddDays(7) + "','CHECKED OUT',0.00)";
                                                cmnd.ExecuteNonQuery();

                                            }catch(SqlException exp)
                                            {
                                                lblTest.Text = exp.Message + " EXP";
                                            }
                                            finally
                                            {
                                                con.Close();
                                                int nstat = stat - 1;
                                                try
                                                {
                                                    con.Open();
                                                    SqlCommand cmmd = con.CreateCommand();
                                                    cmmd.CommandType = System.Data.CommandType.Text;
                                                    cmmd.CommandText = "UPDATE tblUser SET status = @nstat WHERE username = @user_id";
                                                    cmmd.Parameters.AddWithValue("@nstat", nstat);
                                                    cmmd.Parameters.AddWithValue("@user_id", user);
                                                    cmmd.ExecuteNonQuery();
                                                }
                                                catch (SqlException exc)
                                                {
                                                    lblTest.Text = exc.Message + " EXC";
                                                }
                                                finally
                                                {
                                                    con.Close();
                                                    //int avail
                                                    try
                                                    {
                                                        con.Open();
                                                        string bookid = ddlBook.SelectedValue;
                                                        SqlCommand cmds = con.CreateCommand();
                                                        cmds.CommandType = System.Data.CommandType.Text;
                                                        cmds.CommandText = "UPDATE tblBookReg SET availability = availability - 1 WHERE book_isbn = @bookid AND availability > 0";
                                                        cmds.Parameters.AddWithValue("@bookid", bookid);
                                                        cmds.ExecuteNonQuery();
                                                    }catch(SqlException excp)
                                                    {
                                                        lblTest.Text = excp.Message + " EXCP";
                                                    }
                                                    finally
                                                    {
                                                        //con.Close();
                                                       // lblTest.Text = "The books is successfully checked out! <p>Please return the books by " + DateTime.Now.AddDays(7) + "</p><p>Available books to be " +
                                                            //"borrowed: " + nstat + "</p>";
                                                    }
                                                    con.Close();
                                                    lblTest.Text = "The books is successfully checked out! <p>Please return the books by " + DateTime.Now.AddDays(7) + "</p><p>Available books to be " +
                                                        "borrowed: " + nstat + "</p>";
                                                }
                                            }
                                        }
                                        else //If user has reach maximum number of books borrowed which is 5
                                        {
                                            lblTest.Text = "You have exceeded your maximum number of books able to be borrow, please return some books to borrow more.";
                                        }
                                    }
                                }
                            }
                        }
                        catch(SqlException ex)
                        {
                            lblTest.Text = ex.Message + " EX";
                        }
                        finally
                        {
                        }
                        con.Close();
                    }


                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string bookid = GridView1.SelectedRow.Cells[].Text;
            string bookgrid = GridView1.SelectedRow.Cells[1].Text;
            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;MultipleActiveResultSets=true;AttachDbFilename=c:\users\user\documents\visual studio 2017\Projects\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT book_isbn, book_title FROM tblBookReg WHERE book_isbn = @isbn";
                    using (SqlCommand command = new SqlCommand(query, conn))
                    {
                        command.Parameters.AddWithValue("@isbn", bookgrid);
                        using (SqlDataReader dr = command.ExecuteReader())
                        {
                            if (dr.HasRows)
                            {
                                if (dr.Read())
                                {
                                    lblSelected.Text = bookgrid + " " + dr["book_title"];
                                    Session["bookid"] = bookgrid;
                                }
                            }
                        }
                    }
                }catch(SqlException exc)
                {
                    Response.Write(exc.Message);
                }
                conn.Close();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
    }
}