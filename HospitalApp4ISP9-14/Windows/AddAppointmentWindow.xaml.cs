using HospitalApp4ISP9_14.ClassHelper;
using HospitalApp4ISP9_14.DB;
using System;
using System.Collections.Generic;
using System.Linq;
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

namespace HospitalApp4ISP9_14.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddAppointmentWindow.xaml
    /// </summary>
    public partial class AddAppointmentWindow : Window
    {
        public AddAppointmentWindow()
        {
            InitializeComponent();
            GetData();
            dpDate.DisplayDateStart = DateTime.Now;
        }

        private void GetData()
        {
            cmbEmployee.ItemsSource = DBHelper.Context.Employee.ToList(); 
            cmbEmployee.SelectedIndex = 0;
            cmbEmployee.DisplayMemberPath = "LName";
            cmbMedService.ItemsSource = DBHelper.Context.MedicalService.ToList();
            cmbMedService.SelectedIndex = 0;
            cmbMedService.DisplayMemberPath = "TitleService";
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            var DialogResult = MessageBox.Show("Вы уверены, что хотите выйти?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (DialogResult == MessageBoxResult.Yes)
            {
                AuthWindow authWindow= new AuthWindow();
                authWindow.Show();
                this.Close();
            }
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            PatientWindow patientWindow = new PatientWindow();
            patientWindow.Show();
            this.Close();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (Convert.ToDateTime(dpDate.Text) <= DateTime.Now || dpDate.Text == "")
                {
                    MessageBox.Show("Невозможно записаться на выбранную дату", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                else
                {
                    Appointment appointment = new Appointment();
                    appointment.IDEmployee = (cmbEmployee.SelectedItem as Employee).ID;
                    appointment.IDMedicalService = (cmbMedService.SelectedItem as MedicalService).ID;
                    appointment.DateService = Convert.ToDateTime(dpDate.Text);
                    DBHelper.Context.Appointment.Add(appointment);
                    DBHelper.Context.SaveChanges();
                    Order order = new Order();
                    order.IDAppointment = Context.Appointment.ToList().LastOrDefault().ID;
                    order.IDPatient = AuthData.Patient.ID;
                    DBHelper.Context.Order.Add(order);
                    DBHelper.Context.SaveChanges();
                    MessageBox.Show("ok");
                    PatientWindow patientWindow = new PatientWindow();
                    patientWindow.Show();
                    this.Close();
                }
            }
            catch (Exception )
            {
                MessageBox.Show("Невозможно записаться на выбранную дату", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            
        }
    }
}
