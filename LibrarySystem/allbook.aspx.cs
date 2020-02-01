using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace LibrarySystem
{
    public partial class allbook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HyperLink5.Visible = false;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            HyperLink5.Visible = true;

            string book_isbn = GridView1.SelectedRow.Cells[1].Text;
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;MultipleActiveResultSets=true;AttachDbFilename=c:\users\user\documents\visual studio 2017\Projects\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    string sql = "SELECT book_isbn, book_title, page_count, availability, book_img FROM tblBookReg WHERE book_isbn = @book_isbn";
                    using(SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@book_isbn", book_isbn);
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                lblISBN.Text = dr["book_isbn"].ToString();
                                lblTitle.Text = dr["book_title"].ToString();
                                lblStatus.Text = dr["availability"].ToString();
                                lblCount.Text = dr["page_count"].ToString();
                                imgBook.ImageUrl = dr["book_img"].ToString();
                            }
                        }
                    }
                }catch(SqlException ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }
    }
}