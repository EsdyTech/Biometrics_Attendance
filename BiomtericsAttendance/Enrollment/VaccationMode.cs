using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace Enrollment
{
    public partial class VaccationMode : Form
    {
        SqlConnection con;

        public VaccationMode()
        {
            InitializeComponent();
            string st = @"Data Source=DESKTOP-U9ULOKT;Initial Catalog=empdatabase;Integrated Security=True";
            con = new SqlConnection(st);
        }

        private void VaccationMode_Load(object sender, EventArgs e)
        {
            string query = "select * from tbl_emp";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                comboBox1.Items.Add(dr["emp_name"].ToString());
            }
            con.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string query = "update tbl_emp set on_vacc='1' where emp_name='" + comboBox1.SelectedItem.ToString() + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                MessageBox.Show("Vaccation mode active");
            }
            else
            {
                MessageBox.Show("Error");
            }
            con.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string query = "update tbl_emp set on_vacc='0' where emp_name='" + comboBox1.SelectedItem.ToString() + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                MessageBox.Show("Vaccation mode de active");
            }
            else
            {
                MessageBox.Show("Error");
            }
            con.Close();
        }
    }
}
