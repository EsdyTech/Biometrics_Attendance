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
        private BiometricsAttendanceEntities dbContext;
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
                    textBox6.Text = "FingerPrint Captured Successfully";
                }
                
                else
                    MessageBox.Show("The fingerprint template is not valid. Repeat fingerprint enrollment.", "Fingerprint Enrollment");
            }));
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (textBox1.Text == "" && textBox2.Text == "" && textBox3.Text == "" && textBox7.Text == "" && comboBox1.Text == "" && comboBox2.Text == "")
                {
                    MessageBox.Show("Please fill all the Textboxes", "Input Validation Error");
                }
                if (textBox6.Text == "")
                {
                    MessageBox.Show("Please Capture Fingerprint", "Input Validation Error");
                }
                //else if (comboBox1.SelectedItem == null && comboBox2.SelectedItem == null)
                //{
                //    MessageBox.Show("Student Sex must be Male or Female", "Input Validation Error");
                //}
                //else if (comboBox2.SelectedText.ToString() != "Male" || comboBox2.SelectedText.ToString() != "Female")
                //{
                //    MessageBox.Show("Student Sex must be Male or Female", "Input Validation Error");
                //}
                //else if (comboBox1.SelectedText.ToString() != "ND1" || comboBox1.SelectedText.ToString() != "ND2" || comboBox1.SelectedText.ToString() != "HND1" || comboBox1.SelectedText.ToString() != "HND2")
                //{
                //    MessageBox.Show("Student Level must be ND1, ND2, HND1 or HND2", "Input Validation Error");
                //}
                else
                {
                    var student = dbContext.tbl_student.Where(s => s.MatricNo.Trim() == textBox7.Text.Trim()).FirstOrDefault();

                    if (student == null)
                    {
                        byte[] fingerbytes = Template.Bytes;
                        tbl_student tblemp = new tbl_student
                        {
                            FirstName = textBox1.Text,
                            LastName = textBox2.Text,
                            OtherName = textBox3.Text,
                            Sex = comboBox2.Text,
                            StudentLevel = comboBox1.Text,
                            MatricNo = textBox7.Text,
                            Finger = fingerbytes,
                            DateCreated = DateTime.Now.ToString()

                        };
                        dbContext.tbl_student.Add(tblemp);
                        dbContext.SaveChanges();

                        Initiliaze();
                        Template = null;
                        MessageBox.Show("New Student Added and Saved Successfully");
                    }
                    else
                    {
                        MessageBox.Show("Student with MatricNo: " + textBox7.Text + " Already Exists!");
                    }
                   
                }
            }
            catch(Exception ex)
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
            var student = from std in dbContext.tbl_student
                          select new
                          {
                              ID = std.Id,
                              FIRSTNAME = std.FirstName,
                              LASTNAME = std.LastName,
                              OTHERNAME = std.OtherName,
                              SEX = std.Sex,
                              LEVEL = std.StudentLevel,
                              MATRICNO = std.MatricNo,
                              
                          };
            if (student != null)
            {
                dataGridView1.DataSource = student.ToList();
            }
        }
        private void button3_Click(object sender, EventArgs e)
        {
            VerificationForm vf = new VerificationForm();
            vf.ShowDialog();
        }

        public void loadLevel()
        {
            comboBox1.Items.Add("ND1");
            comboBox1.Items.Add("ND2");
            comboBox1.Items.Add("HND1");
            comboBox1.Items.Add("HND2");
        }

        public void loadGender()
        {
            comboBox2.Items.Add("Male");
            comboBox2.Items.Add("Female");
        }

        private void AddEmployee_Load(object sender, EventArgs e)
        {
            dbContext = new BiometricsAttendanceEntities();
            Initiliaze();
            loadLevel();
            loadGender();
        }

        private void homeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Visible = false;
            new AdminMenu().Show();
        }

        private void logoutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Visible = false;
            new Admin_Login().Show();
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
