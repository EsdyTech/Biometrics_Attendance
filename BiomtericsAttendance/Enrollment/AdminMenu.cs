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
    public partial class AdminMenu : Form
    {
        public AdminMenu()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Visible = false;
            new AddEmployee().Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            VerificationForm vf = new VerificationForm();
            vf.ShowDialog();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Visible = false;
            new Form1().Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Visible = false;
            new MonthlyReport().Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Visible = false;
            new YearReport().Show();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Visible = false;
            new VaccationMode().Show();
        }

        private void AdminMenu_Load(object sender, EventArgs e)
        {

        }

        private void homeToolStripMenuItem_Click(object sender, EventArgs e)
        {
             Visible = false;
            new Admin_Login().Show();
        }

        private void closeApplicationToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
