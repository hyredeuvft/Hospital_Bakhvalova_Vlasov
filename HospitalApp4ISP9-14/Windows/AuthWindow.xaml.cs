using HospitalApp4ISP9_14.ClassHelper;
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
    /// Логика взаимодействия для AuthWindow.xaml
    /// </summary>
    public partial class AuthWindow : Window
    {
        public AuthWindow()
        {
            InitializeComponent();
        }

        private void btnReg_Click(object sender, RoutedEventArgs e)
        {
            RegWindow regWindow = new RegWindow();
            regWindow.Show();
            this.Close();
        }

        private void btnEnter_Click(object sender, RoutedEventArgs e)
        {
            var auth = Context.Patient.ToList().Where(i => i.Login == tbLogin.Text && i.Password == pbPassword.Password).FirstOrDefault();
            if (auth != null)
            {
                AuthData.Patient = auth;
                PatientWindow patientWindow = new PatientWindow();
                patientWindow.Show();
                this.Close();
            }
            else 
            {
                MessageBox.Show("Такого пользователя нет.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
