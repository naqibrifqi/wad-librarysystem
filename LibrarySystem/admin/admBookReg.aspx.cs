using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace LibrarySystem.admin
{
    public partial class admBookReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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

        protected void dgvBook_SelectedIndexChanged(object sender, EventArgs e)
        {
            string book_isbn = dgvBook.SelectedRow.Cells[1].Text;
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;MultipleActiveResultSets=true;AttachDbFilename=c:\users\user\documents\visual studio 2017\Projects\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    string sql = "SELECT book_isbn, book_title, availability, book_img FROM tblBookReg WHERE book_isbn = @isbn";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@isbn", book_isbn);
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.HasRows)
                            {
                                if (dr.Read())
                                {
                                    lblISBN.Text = dr["book_isbn"].ToString();
                                    txtTitle.Visible = true;
                                    txtTitle.Text = dr["book_title"].ToString();
                                    txtAvail.Visible = true;
                                    txtAvail.Text = dr["availability"].ToString();
                                    imgBook.ImageUrl = dr["book_img"].ToString();
                                    btnDelete.Visible = true;
                                    btnUpdate.Visible = true;
                                }
                            }
                        }
                    }
                    con.Close();
                }
                catch(SqlException ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //string script = "<script type=\"text/javascript\">alert('Do you want to delete this book?');</script>";
            //ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
            string bookid = lblISBN.Text;
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;MultipleActiveResultSets=true;AttachDbFilename=c:\users\user\documents\visual studio 2017\Projects\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    string sql = "DELETE FROM tblBookReg WHERE book_isbn = @bookid";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@bookid", bookid);
                        cmd.ExecuteNonQuery();
                        lblMsg.Text = "Book with ID:" + bookid + " has been deleted successfully.";
                        hplRefresh.Visible = true;
                    }
                    con.Close();
                }
                catch (SqlException ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;MultipleActiveResultSets=true;AttachDbFilename=c:\users\user\documents\visual studio 2017\Projects\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
            {
                string title = txtTitle.Text;
                string isbn = lblISBN.Text;
                string avail = txtAvail.Text;
                try
                {
                    con.Open();
                    string sql = "UPDATE tblBookReg SET book_title = @title, availability = @avail WHERE book_isbn = @isbn";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@title", title);
                        cmd.Parameters.AddWithValue("@isbn", isbn);
                        cmd.Parameters.AddWithValue("@avail", avail);
                        cmd.ExecuteNonQuery();
                        lblMsg.Text = "Book with ID:" + isbn + " has been updated successfully.";
                        hplRefresh.Visible = true;
                    }
                    con.Close();
                }
                catch (SqlException ex)
                {
                    Response.Write("Error Updating: " + ex.Message);
                }
            }
        }
    }
}