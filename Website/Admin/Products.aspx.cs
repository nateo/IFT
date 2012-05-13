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

        protected void gvProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            panelProductDetails.Visible = true;


            string path = Server.MapPath("~/Images/Products");
            string[] files = System.IO.Directory.GetFiles(path, gvProducts.SelectedDataKey.Value.ToString() + ".*");
            if (files.Length > 0)
            {
                string fileName = System.IO.Path.GetFileName(files[0]);
                imageProduct.ImageUrl = @"~/Images/Products/" + fileName;
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (!fuPicture.FileName.EndsWith(".js"))
            {
                string filePath = Server.MapPath("~/Images/Products/" + gvProducts.SelectedDataKey.Value.ToString());
                fuPicture.SaveAs(filePath + System.IO.Path.GetExtension(fuPicture.FileName));
            }
        }



    }
}