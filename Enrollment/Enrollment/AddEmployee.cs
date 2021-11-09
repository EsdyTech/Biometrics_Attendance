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
    public partial class AddEmployee : Form
    {
        private empdatabaseEntities1 empdatabase;
        private DPFP.Template Template;
        SqlConnection con;
        public AddEmployee()
        {
            InitializeComponent();
            //string st = @"Data Source=DESKTOP-U9ULOKT;Initial Catalog=empdatabase;Integrated Security=True";
            string st = @"Data Source=161.97.77.250;Initial Catalog=empdatabase;Integrated Security=True";
            con = new SqlConnection(st);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            EnrollmentForm Enroller = new EnrollmentForm();
            Enroller.OnTemplate += this.OnTemplate;
            Enroller.ShowDialog();
        }
        private void OnTemplate(DPFP.Template template)
        {
            this.Invoke(new Function(delegate ()
            {
                Template = template;
                button2.Enabled= (Template != null);
                if (Template != null)
                {
                    MessageBox.Show("The fingerprint template is ready for fingerprint verification.", "Fingerprint Enrollment");
                    textBox6.Text = "FingerPrint Captured";
                }
                
                else
                    MessageBox.Show("The fingerprint template is not valid. Repeat fingerprint enrollment.", "Fingerprint Enrollment");
            }));
        }

        private void button2_Click(object sender, EventArgs e)
        {

            try { 

            byte[] fingerbytes = Template.Bytes;

            tbl_emp tblemp = new tbl_emp
            {
                emp_name = textBox1.Text,
                emp_age = textBox2.Text,
                emp_cell = textBox3.Text,
                emp_desig = textBox4.Text,
                emp_salary = textBox5.Text,
                emp_finger = fingerbytes

            };
            empdatabase.tbl_emp.Add(tblemp);
            empdatabase.SaveChanges();
           
            Initiliaze();
            Template = null;
            MessageBox.Show("Saved");
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message + ex.StackTrace);
            }
            /*
            string query = "insert into tbl_emp(emp_name,emp_age,emp_cell,emp_desig,emp_salary,emp_finger)values('" + textBox1.Text + "','" + textBox2.Text + "','" + textBox3.Text + "','" + textBox4.Text + "','" + textBox5.Text + "',(SELECT convert(varbinary, '"+fingerbytes+"')))";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                MessageBox.Show("Employee Added");
            }
            else
            {
                MessageBox.Show("Error");
            }
            con.Close();
            */
        }

        private void Initiliaze()
        {
            var employe = from emp in empdatabase.tbl_emp
                          select new
                          {
                              ID = emp.Id,
                              NAME = emp.emp_name,
                              AGE = emp.emp_age,
                              CELL = emp.emp_cell,
                              DESIG = emp.emp_desig,
                              SALARY = emp.emp_salary
                              
                          };
            if (employe!=null)
            {
                dataGridView1.DataSource = employe.ToList();
            }
        }
        private void button3_Click(object sender, EventArgs e)
        {
            VerificationForm vf = new VerificationForm();
            vf.ShowDialog();
        }

        private void AddEmployee_Load(object sender, EventArgs e)
        {
            empdatabase = new empdatabaseEntities1();
            Initiliaze();
        }
    }
}
