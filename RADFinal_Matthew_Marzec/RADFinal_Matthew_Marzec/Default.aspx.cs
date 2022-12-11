//MATTHEW MARZEC
//RAD FINAL 2022
//DEC 10, 2022
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RADFinal_Matthew_Marzec
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            UserStore<IdentityUser> userStore = new UserStore<IdentityUser>();
            UserManager<IdentityUser> manager = new UserManager<IdentityUser>(userStore);
            IdentityUser user = manager.Find(loginName.Text, loginPassword.Text);
            if (user == null)
            {
                Label1.Text = "Username or password is incorrect.";
            }
            else
            {              
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                authenticationManager.SignIn(userIdentity);
                Label1.Text = user.UserName;

                Response.Redirect("~/Inventory.aspx");
            }
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            UserStore<IdentityUser> userStore = new UserStore<IdentityUser>();
            UserManager<IdentityUser> manager = new UserManager<IdentityUser>(userStore);
            IdentityUser user = new IdentityUser(TextBox1.Text);
            if(regPass.Text == regPassConfirm.Text)
            {
                IdentityResult idResult = manager.Create(user, regPass.Text);
                if (idResult.Succeeded)
                {
                    this.Label2.Text = user.UserName;

                }
                else
                {
                    this.Label2.Text = "Please try again later";
                }
            }
           
        }
    }
}