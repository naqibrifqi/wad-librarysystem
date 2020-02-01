using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibrarySystem
{
    public partial class admindash : System.Web.UI.Page
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
                    Response.Redirect("accDenied.aspx");
                }
            }
            else //if not logged in, user are sent back to login page
            {
                Response.Redirect("accDenied.aspx");
            }
        }
    }
}