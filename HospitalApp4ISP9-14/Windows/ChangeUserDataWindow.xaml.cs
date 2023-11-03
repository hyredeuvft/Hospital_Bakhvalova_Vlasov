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

namespace HospitalApp4ISP9_14.Windows
{
    /// <summary>
    /// Логика взаимодействия для ChangeUserDataWindow.xaml
    /// </summary>
    public partial class ChangeUserDataWindow : Window
    {
        private Patient editPatient;
        public ChangeUserDataWindow()
        {
            InitializeComponent();
            tbFIO.Text = AuthData.Patient.LName + " " + AuthData.Patient.FName + " " + AuthData.Patient.MName;
            dpDate.Text = AuthData.Patient.Birthday.ToString();
            tbPhone.Text = AuthData.Patient.Phone.ToString();
            tbAddress.Text = AuthData.Patient.Address.ToString();
            tbEmail.Text = AuthData.Patient.Email.ToString();
            if (AuthData.Patient.IdGender == 1)
            {
                rbMale.IsChecked = true;
            }
            else
            {
                rbFemale.IsChecked = true;
            }
            editPatient = AuthData.Patient;
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

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            UserWindow userWindow = new UserWindow();
            userWindow.Show();
            this.Close();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (checkData(tbFIO.Text) && checkData(dpDate.Text) && checkData(tbPhone.Text) && checkData(tbAddress.Text) && checkData(tbEmail.Text) && (rbFemale.IsChecked == true || rbMale.IsChecked == true))
            {
                try
                {
                    string[] FIO = tbFIO.Text.Split(' ');
                    if (FIO.Count() != 3)
                    {
                        MessageBox.Show("Невеное фио", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                    }
                    else 
                    {
                        editPatient.FName = FIO[0];
                        editPatient.LName = FIO[1];
                        editPatient.MName = FIO[2];
                        editPatient.Birthday = Convert.ToDateTime(dpDate.Text);
                        editPatient.Phone = tbPhone.Text;
                        editPatient.Address = tbAddress.Text;
                        editPatient.Email = tbEmail.Text;
                        if (rbMale.IsChecked == true)
                        {
                            editPatient.IdGender = 1;
                        }
                        else if (rbFemale.IsChecked == true)
                        {
                            editPatient.IdGender = 2;
                        }
                        DBHelper.Context.SaveChanges();
                        MessageBox.Show("Изменения сохранены", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                        UserWindow userWindow = new UserWindow();
                        userWindow.Show();
                        this.Close();
                    }
                   
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private bool checkData(string data)
        {
            if (String.IsNullOrEmpty(data))
            {
                return false;
            }
            if (String.IsNullOrWhiteSpace(data))
            {
                return false;
            }
            return true;
        }
    }
}
