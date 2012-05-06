using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Website.Admin
{
    public partial class Products1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSubcategoryName.Visible = true;
            txtSubCategory.Visible = true;
            btnAddSubCategory.Visible = true;
            
        }

        protected void gvProducts_Init(object sender, EventArgs e)
        {
            sdsProducts.UpdateParameters["ModifiedBy"].DefaultValue = User.Identity.Name;
        }


    }
}