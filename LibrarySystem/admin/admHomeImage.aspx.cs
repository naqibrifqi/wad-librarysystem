using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace LibrarySystem.admin
{
    public partial class admHomeImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
        }

        protected void dgvImage_SelectedIndexChanged(object sender, EventArgs e)
        {
            string checkout_id = dgvImage.SelectedRow.Cells[1].Text;
            lblSelected.Text = checkout_id;
        }

        protected void btnReplace_Click(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                if (Page.IsValid)
                {
                    string imageId = lblSelected.Text;
                    SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\dorab\source\repos\LibrarySystem\LibrarySystem\App_Data\DBO.mdf;Integrated Security=True");
                    
                    conn.Open();
                    string sql = "DELETE FROM tblSysImg WHERE id = @imageId";
                    using (SqlCommand cmmd = new SqlCommand(sql, conn))
                    {
                        cmmd.Parameters.AddWithValue("@imageid", imageId);
                        cmmd.ExecuteNonQuery();
                        string path = "C:/Users/user/Documents/Visual Studio 2017/Projects/LibrarySystem/LibrarySystem/Images/System/" + imageId + ".jpg";
                        FileInfo myfileinf = new FileInfo(path);
                        myfileinf.Delete();
                        lblMsg.Text = "Image with ID:" + imageId + " has been deleted successfully.";
                    }
                    conn.Close();


                    SqlCommand cmd = conn.CreateCommand();
                    conn.Open();
                    if (fulImage.HasFile)
                    {
                        //string filename = Path.GetFileName(imgUpload.PostedFile.FileName);
                        string filename = fulImage.FileName.ToString();
                        string imgName = "Image " + imageId;
                        fulImage.PostedFile.SaveAs(Server.MapPath("~/Images/System/banner") + imageId + ".jpg");

                        string imgdir = "~/Images/System/banner" + imageId + ".jpg";
                        cmd.CommandText = "INSERT INTO tblSysImg VALUES(@imageid, @name, @imagedir)";
                        cmd.Parameters.Add("@imageid", SqlDbType.Int).Value = imageId;
                        cmd.Parameters.Add("@name", SqlDbType.NVarChar).Value = imgName;
                        cmd.Parameters.Add("@imagedir", SqlDbType.NVarChar).Value = imgdir;
                        cmd.ExecuteNonQuery();
                    }
                }
            }
        }
    }
}