using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Data;
using System.Windows.Forms;

namespace Enrollment
{
	/* NOTE: This form is inherited from the CaptureForm,
		so the VisualStudio Form Designer may not load it properly
		(at least until you build the project).
		If you want to make changes in the form layout - do it in the base CaptureForm.
		All changes in the CaptureForm will be reflected in all derived forms 
		(i.e. in the EnrollmentForm and in the VerificationForm)
	*/
	public class VerificationForm : CaptureForm
	{
        SqlConnection con;
        MemoryStream stream;
        byte[] mbyte;
        private BiometricsAttendanceEntities dbContext;
        public void Verify(DPFP.Template template)
		{
			Template = template;
			ShowDialog();
		}

		protected override void Init()
		{
			base.Init();
			base.Text = "Fingerprint Verification";
			Verificator = new DPFP.Verification.Verification();		// Create a fingerprint template verificator
			UpdateStatus(0);
		}

		protected override void Process(DPFP.Sample Sample)
		{
			base.Process(Sample);

			// Process the sample and create a feature set for the enrollment purpose.
			DPFP.FeatureSet features = ExtractFeatures(Sample, DPFP.Processing.DataPurpose.Verification);

			// Check quality of the sample and start verification if it's good
			// TODO: move to a separate task
			if (features != null)
			{
                try { 
				// Compare the feature set with our template
				DPFP.Verification.Verification.Result result = new DPFP.Verification.Verification.Result();
                 
                    foreach(var std in dbContext.tbl_student)
                    {
                        stream = new MemoryStream(std.Finger);
                        Template = new DPFP.Template(stream);
                        string msg = string.Empty;

                        Verificator.Verify(features, Template, ref result);
                        UpdateStatus(result.FARAchieved);
                        if (result.Verified)
                        {
                            MakeReport(std.FirstName + " " + std.LastName + " Fingerprint was VERIFIED Successfully");

                            string todaydate = DateTime.Now.Date.ToShortDateString(); 
                            string thismonth = DateTime.Now.Month.ToString();
                            string year = DateTime.Now.Year.ToString();
                            string val = "1";
                            int b = ifalreadytoday(std.MatricNo, todaydate);
                            //int c = ifOnVaccation(emp.emp_name);
                            if (b > 0)
                            {
                                MakeReport(std.FirstName + " " + std.LastName + " Attendance has already been taken for today!");
                                MessageBox.Show(std.FirstName + " " + std.LastName + " With Matric Number " + std.MatricNo + " Attendance has already been taken for today!", "Attendance Capture");
                            }
                            //else if (c>0)
                            //{
                            //    MakeReport("Employee On Vaccation");
                            //}
                            else
                            {
                                string query = "insert into tbl_attendance(MatricNo,Val,TodayDate,Month,Year)values((select MatricNo from tbl_student where MatricNo='" + std.MatricNo + "'),'" + val + "','" + todaydate + "','" + thismonth + "','" + year + "')";
                                SqlCommand cmd = new SqlCommand(query, con);
                                con.Open();
                                int a = cmd.ExecuteNonQuery();
                                if (a > 0)
                                {
                                    MakeReport("Attendance is Taken Successfully! " + std.FirstName + " " + std.LastName);
                                    MessageBox.Show("Attendance is taken Successfully for " + std.FirstName + " " + std.LastName + " With Matric Number " + std.MatricNo, "Attendance Capture");
                                }

                                con.Close();
                            }

                            //continue;
                        }
                            
                            
                         else
                            MakeReport("The fingerprint was NOT VERIFIED.");
                    }

                }
                catch (Exception ex)
                {
                    MakeReport(ex.Message);
                }
                }
        }
        private int ifalreadytoday(string matricNo,string todaydate)
        {
            int a = 0;
            //string query = "select * from tbl_attendance where empid=(select Id from tbl_emp where emp_name='" + empname + "' AND today_date='" + todaydate + "')";
            string query = "select * from tbl_attendance where MatricNo=(select MatricNo from tbl_student where MatricNo='" + matricNo + "' AND TodayDate='" + todaydate + "')";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
                a = 1;
            else
                a = 0;
            con.Close();
            return a;
            
        }

        private int ifOnVaccation(string empname)
        {
            int a = 0;
            int onvacc=0;
            string query = "select * from tbl_emp where emp_name='" + empname + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                //onvacc = Convert.ToInt32(dr["on_vacc"]);
                onvacc = string.IsNullOrEmpty(dr["on_vacc"].ToString()) ? 0 : (int)dr["on_vacc"];
                if (onvacc > 0)
                {
                    a = 1;
                }
                else
                {
                    a = 0;
                }
            }
                
            con.Close();
            return a;

        }
        private void UpdateStatus(int FAR)
		{
			// Show "False accept rate" value
			SetStatus(String.Format("False Accept Rate (FAR) = {0}", FAR));
		}
        public VerificationForm()
        {
            dbContext = new BiometricsAttendanceEntities();
            InitializeComponent();
        }
		private DPFP.Template Template;
		private DPFP.Verification.Verification Verificator;

        private void InitializeComponent()
        {
            this.SuspendLayout();
            // 
            // VerificationForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.ClientSize = new System.Drawing.Size(581, 354);
            this.Name = "VerificationForm";
            this.Load += new System.EventHandler(this.VerificationForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        private void VerificationForm_Load(object sender, EventArgs e)
        {
            string st = @"Data Source=161.97.77.250;Initial Catalog=BiometricsAttendance;user id=user1;password=1111";
            //string st = @"Data Source=DESKTOP-U9ULOKT;Initial Catalog=empdatabase;Integrated Security=True";
            con = new SqlConnection(st);
        }
    }
}