using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace LibrarySystem.admin
{
    public partial class admallCheckout : System.Web.UI.Page
    {
        public void ctrlHide()
        {
            txtCheckout.Visible = txtDCheckout.Visible = txtDDeadline.Visible = txtFee.Visible = txtISBN.Visible = txtStatus.Visible = txtUserID.Visible = false;
        }

        public void ctrlShow()
        {
            txtCheckout.Visible = txtDCheckout.Visible = txtDDeadline.Visible = txtFee.Visible = txtISBN.Visible = txtStatus.Visible = txtUserID.Visible = true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ctrlHide();
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ctrlShow();
            string checkout_id = GridView1.SelectedRow.Cells[1].Text;
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;MultipleActiveResultSets=true;AttachDbFilename=c:\users\user\documents\visual studio 2017\Projects\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    string sql = "SELECT id, book_isbn, user_id, date_checkout, date_deadline, status, fee FROM tblCheckout WHERE id = @chekout";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@chekout", checkout_id);
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.HasRows)
                            {
                                if (dr.Read())
                                {
                                    lblEdit.Text = dr["id"].ToString();
                                    txtCheckout.Text = dr["id"].ToString();
                                    txtUserID.Text = dr["user_id"].ToString();
                                    txtISBN.Text = dr["book_isbn"].ToString();
                                    txtDCheckout.Text = dr["date_checkout"].ToString();
                                    txtDDeadline.Text = dr["date_deadline"].ToString();
                                    txtStatus.Text = dr["status"].ToString();
                                    txtFee.Text = dr["fee"].ToString();
                                    btnDelete.Visible = true;
                                    btnUpdate.Visible = true;
                                }
                            }
                        }
                    }
                    con.Close();
                }
                catch (SqlException ex)
                {
                    Response.Write("Error er: " + ex.Message);
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;MultipleActiveResultSets=true;AttachDbFilename=c:\users\user\documents\visual studio 2017\Projects\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
            {
                try
                {
                    conn.Open();
                    string query = "UPDATE tblCheckout " +
                        "SET book_isbn = @isbn, user_id = @userid, date_checkout = @datec, date_deadline = @dated, status = @stat, fee = @fee " +
                        "WHERE id = @id";
                    using (SqlCommand command = new SqlCommand(query, conn))
                    {
                        command.Parameters.AddWithValue("@id", txtCheckout.Text);
                        command.Parameters.AddWithValue("@isbn", txtISBN.Text);
                        command.Parameters.AddWithValue("@userid", txtUserID.Text);
                        command.Parameters.AddWithValue("@datec", txtDCheckout.Text);
                        command.Parameters.AddWithValue("@dated", txtDDeadline.Text);
                        command.Parameters.AddWithValue("@stat", txtStatus.Text);
                        command.Parameters.AddWithValue("@fee", txtFee.Text);
                        command.ExecuteNonQuery();
                        lblEdit.Text = "Succeed Update";
                        Response.Redirect("admallCheckout.aspx");
                    }
                    conn.Close();
                }catch(SqlException exc)
                {
                    Response.Write("Error exc: " + exc.Message);
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string checkoutid = txtCheckout.Text;
            using (SqlConnection comd = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;MultipleActiveResultSets=true;AttachDbFilename=c:\users\user\documents\visual studio 2017\Projects\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
            {
                try
                {
                    comd.Open();
                    string sql = "DELETE FROM tblCheckout WHERE id = @checkoutid";
                    using (SqlCommand cmdd = new SqlCommand(sql, comd))
                    {
                        cmdd.Parameters.AddWithValue("@checkoutid", checkoutid);
                        cmdd.ExecuteNonQuery();
                        lblEdit.Text = "Record with ID:" + checkoutid + " has been deleted successfully.";
                    }
                    comd.Close();
                }
                catch (SqlException exd)
                {
                    Response.Write("Error deleting: " + exd.Message);
                }
            }
        }
    }
}