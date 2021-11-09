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
    public partial class YearReport : Form
    {
        SqlConnection con;
        public YearReport()
        {
            InitializeComponent();
            string st = @"Data Source=DESKTOP-U9ULOKT;Initial Catalog=empdatabase;Integrated Security=True";
            con = new SqlConnection(st);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string query = "SELECT te.emp_name,te.emp_age,te.emp_cell,te.emp_desig,ta.today_date,ta.val from tbl_attendance ta JOIN tbl_emp te ON te.Id=ta.empid where ta.year='" + comboBox2.SelectedItem.ToString() + "'";

            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            BindingSource bs = new BindingSource();
            bs.DataSource = dt;
            dataGridView1.DataSource = bs;
            da.Update(dt);
            con.Close();
        }
    }
}
