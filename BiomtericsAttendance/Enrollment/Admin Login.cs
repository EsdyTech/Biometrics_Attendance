using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Enrollment
{
    public partial class Admin_Login : Form
    {
        string username = "";
        string password = "";
        private BiometricsAttendanceEntities dbContext;

        public Admin_Login()
        {
            InitializeComponent();
            dbContext = new BiometricsAttendanceEntities();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            username = textBox1.Text;
            password = textBox2.Text;

            var admin = dbContext.tbl_admin.Where(a => a.Username.Equals(username) && a.Password.Equals(password)).FirstOrDefault();
            if(admin != null)
            {
                MessageBox.Show("Administrator Login was Successful");
                Visible = false;
                AdminMenu am = new AdminMenu();
                am.ShowDialog();
            }
            else
            {
                MessageBox.Show("Invalid Administrator Login Credientials");
            }
        }

        private void Admin_Login_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            textBox1.Text = "";
            textBox2.Text = "";
        }

        private void closeApplicationToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
