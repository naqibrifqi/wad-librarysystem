using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;


namespace LibrarySystem
{
    public partial class newBook : System.Web.UI.Page
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

        /*protected void Upload(object sender, EventArgs e)
        {
            if (imgUpload.HasFile)
            {
                string filename = Path.GetFileName(imgUpload.PostedFile.FileName);
                imgUpload.PostedFile.SaveAs(Server.MapPath("~/Images/Books/") + filename);
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }*/
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                if (Page.IsValid)
                {
                    /*FileUpload img = (FileUpload)imgUpload;
                    Byte[] imgByte = null;
                    if(img.HasFile && img.PostedFile != null)
                    {
                        HttpPostedFile File = imgUpload.PostedFile;
                        imgByte = new Byte[File.ContentLength];
                        File.InputStream.Read(imgByte, 0, File.ContentLength);
                    }*/

                    SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=c:\users\user\documents\visual studio 2017\Projects\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True");

                    SqlCommand cmd = conn.CreateCommand();
                    /*
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.CommandText = "INSERT INTO tblBookReg VALUES(@isbn, @title, @pagecount, @status, @availability, @img)";
                    cmd.Parameters.Add("@isbn", SqlDbType.NVarChar).Value = txtISBN.Text;
                    cmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = txtTitle.Text;
                    cmd.Parameters.Add("@pagecount", SqlDbType.NVarChar).Value = txtPageCount.Text;
                    cmd.Parameters.Add("@status", SqlDbType.NVarChar).Value = txtStatus.Text;
                    cmd.Parameters.Add("@availability", SqlDbType.NVarChar).Value = txtAvailability.Text;
                    cmd.ExecuteNonQuery();*/

                    //SqlCommand cmd = new SqlCommand("spInsertBook", conn);
                    //cmd.CommandType = CommandType.StoredProcedure;

                    conn.Open();
                    if (imgUpload.HasFile)
                    {
                        //string filename = Path.GetFileName(imgUpload.PostedFile.FileName);
                        string filename = imgUpload.FileName.ToString();
                        imgUpload.PostedFile.SaveAs(Server.MapPath("~/Images/Books/") + filename);

                        string imgdir = "~/Images/Books/" + filename;
                        cmd.CommandText = "INSERT INTO tblBookReg VALUES(@isbn, @title, @pagecount, @availability, @img)";
                        cmd.Parameters.Add("@isbn", SqlDbType.NVarChar).Value = txtISBN.Text;
                        cmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = txtTitle.Text;
                        cmd.Parameters.Add("@pagecount", SqlDbType.NVarChar).Value = txtPageCount.Text;
                        cmd.Parameters.Add("@availability", SqlDbType.NVarChar).Value = txtAvailability.Text;
                        cmd.Parameters.Add("@img", SqlDbType.NVarChar).Value = imgdir;
                        cmd.ExecuteNonQuery();
                        lblMsg.Text = "Book registered with images.";
                    }
                    else
                    {
                        cmd.CommandText = "INSERT INTO tblBookReg VALUES(@isbn, @title, @pagecount, @availability)";
                        cmd.Parameters.Add("@isbn", SqlDbType.NVarChar).Value = txtISBN.Text;
                        cmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = txtTitle.Text;
                        cmd.Parameters.Add("@pagecount", SqlDbType.NVarChar).Value = txtPageCount.Text;
                        cmd.Parameters.Add("@availability", SqlDbType.NVarChar).Value = txtAvailability.Text;
                        cmd.ExecuteNonQuery();
                        lblMsg.Text = "Book registered with no images.";
                    }
                }
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect("newBook.aspx");
        }
    }
}