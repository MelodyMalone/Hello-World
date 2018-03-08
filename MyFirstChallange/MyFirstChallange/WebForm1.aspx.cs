using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyFirstChallange
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void resultButton_Click(object sender, EventArgs e)
        {
            string age = ageTextBox.Text;
            string cash = cashTextBox.Text;

            string result = "I would expect a " + age + " year old to have more than " + cash + " in their pocket.";

            resultLabel.Text = result;
        }
    }
}