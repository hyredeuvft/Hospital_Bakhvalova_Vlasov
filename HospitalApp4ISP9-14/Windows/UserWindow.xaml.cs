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
using HospitalApp4ISP9_14.ClassHelper;


namespace HospitalApp4ISP9_14.Windows
{
    /// <summary>
    /// Логика взаимодействия для UserWindow.xaml
    /// </summary>
    public partial class UserWindow : Window
    {
        public UserWindow()
        {
            InitializeComponent();
            tbFIO.Text = AuthData.Patient.LName + " " + AuthData.Patient.FName+ " " + AuthData.Patient.MName;
            tbDate.Text = AuthData.Patient.Birthday.ToString();
            tbPhone.Text = AuthData.Patient.Phone.ToString();
            tbGender.Text = AuthData.Patient.Gender.GenderName;
            tbAddress.Text = AuthData.Patient.Address.ToString();
            tbEmail.Text = AuthData.Patient.Email.ToString();
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            ChangeUserDataWindow changeUserDataWindow = new ChangeUserDataWindow();
            changeUserDataWindow.Show();
            this.Close();
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            PatientWindow patientWindow = new PatientWindow();
            patientWindow.Show();
            this.Close();
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            var DialogResult = MessageBox.Show("Вы уверены, что хотите выйти?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (DialogResult == MessageBoxResult.Yes)
            {
                AuthWindow authWindow = new AuthWindow();
                authWindow.Show();
                this.Close();
            }
        }
    }
}
