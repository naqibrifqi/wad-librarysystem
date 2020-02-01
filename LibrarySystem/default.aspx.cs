using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace LibrarySystem
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=c:\users\user\documents\visual studio 2017\Projects\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True"))
            {
                try
                {
                    string sql = "SELECT directory FROM tblSysImg WHERE id = 1";
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            dr.Read();
                            img1.ImageUrl = dr["directory"].ToString();
                        }
                    }
                    conn.Close();
                }
                catch (SqlException ex)
                {
                    Response.Write(ex.Message);
                }

                try
                {
                    string sql = "SELECT directory FROM tblSysImg WHERE id = 2";
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            dr.Read();
                            img2.ImageUrl = dr["directory"].ToString();
                        }
                    }
                    conn.Close();
                }
                catch (SqlException ex)
                {
                    Response.Write(ex.Message);
                }

                try
                {
                    string sql = "SELECT directory FROM tblSysImg WHERE id = 3";
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            dr.Read();
                            img3.ImageUrl = dr["directory"].ToString();
                        }
                    }
                    conn.Close();
                }
                catch (SqlException ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }
    }
}