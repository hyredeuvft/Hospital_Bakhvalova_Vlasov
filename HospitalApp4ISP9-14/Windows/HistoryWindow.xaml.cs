using HospitalApp4ISP9_14.ClassHelper;
using HospitalApp4ISP9_14.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using static HospitalApp4ISP9_14.ClassHelper.DBHelper;
using HospitalApp4ISP9_14.Windows;

namespace HospitalApp4ISP9_14.Windows
{
    /// <summary>
    /// Логика взаимодействия для HistoryWindow.xaml
    /// </summary>
    public partial class HistoryWindow : Window
    {
        public HistoryWindow()
        {
            InitializeComponent();
            GetData();
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            PatientWindow patientWindow = new PatientWindow();
            patientWindow.Show();
            this.Close();
        }
        private void GetData()
        {
            List<Patient> patients = ClassHelper.DBHelper.Context.Patient.ToList();
            List<Appointment> appointments = DBHelper.Context.Appointment.ToList();
            List<Order> orders = DBHelper.Context.Order.ToList();
            List<Employee> employees = DBHelper.Context.Employee.ToList();
            List<MedicalService> medicalServices = DBHelper.Context.MedicalService.ToList();
            List<PatientDiagnosis> patientDiagnoses = DBHelper.Context.PatientDiagnosis.ToList();
            List<Diagnosis> diagnoses = DBHelper.Context.Diagnosis.ToList();

            var query = from patient in patients
                        join order in orders on patient.ID equals order.IDPatient
                        join appointment in appointments on order.IDAppointment equals appointment.ID
                        join medicalService in medicalServices on appointment.IDMedicalService equals medicalService.ID
                        join employee in employees on appointment.IDEmployee equals employee.ID
                        join patientDiagnosis in patientDiagnoses on patient.ID equals patientDiagnosis.IDPatient
                        join diagnosis in diagnoses on patientDiagnosis.IDDiagnosis equals diagnosis.ID

                        select new { id = patient.ID, Date = appointment.DateService.ToString("dd.MM.yyyy HH:mm"), 
                            Title = medicalService.TitleService, Employee = employee.LName, 
                            SysDate = appointment.DateService,
                            Diagnos = diagnosis.Title};

            DGAppointments.ItemsSource = query.ToList().Where(i => i.id == AuthData.Patient.ID &&
                i.SysDate <= DateTime.Now);
            if (DGAppointments.Items.Count <= 0)
            {
                MessageBox.Show("Записей нет", "Внимание", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            var DialogResult = MessageBox.Show("Вы уверены, что хотите выйти?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (DialogResult == MessageBoxResult.Yes)
            {
                PatientWindow patientWindow = new PatientWindow();
                patientWindow.Show();
                this.Close();
            }
        }
    }
}
