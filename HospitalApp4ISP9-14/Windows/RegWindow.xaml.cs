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
using HospitalApp4ISP9_14.DB;
using HospitalApp4ISP9_14.Windows;
using static HospitalApp4ISP9_14.ClassHelper.DBHelper;

namespace HospitalApp4ISP9_14.Windows
{
    /// <summary>
    /// Логика взаимодействия для RegWindow.xaml
    /// </summary>
    public partial class RegWindow : Window
    {
        public RegWindow()
        {
            InitializeComponent();
        }

        private void btnReg_Click(object sender, RoutedEventArgs e)
        {
            if (checkData(tbLName.Text) && checkData(tbFName.Text) && checkData(tbMName.Text) && checkData(tbAddress.Text)
                && checkData(tbPhone.Text) && checkData(tbEmail.Text) && checkData(tbLogin.Text) && checkData(tbPassword.Text)
                && checkData(dpBirthDay.Text) && (rbFemale.IsChecked == true || rbMale.IsChecked == true))
            {
                if (Convert.ToDateTime(dpBirthDay.Text) >= DateTime.Now)
                {
                    MessageBox.Show("Неправильная дата рожденияю", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                else
                {
                    try
                    {
                        Patient patient = new Patient();
                        patient.LName = tbLName.Text;
                        patient.FName = tbFName.Text;
                        patient.MName = tbMName.Text;
                        patient.Address = tbAddress.Text;
                        patient.Phone = tbPhone.Text;
                        patient.Email = tbEmail.Text;
                        patient.Login = tbLogin.Text;
                        patient.Password = tbPassword.Text;
                        patient.Birthday = Convert.ToDateTime(dpBirthDay.Text);
                        if (rbMale.IsChecked == true)
                        {
                            patient.IdGender = 1;
                        }
                        else { patient.IdGender = 2; }
                        Context.Patient.Add(patient);
                        Context.SaveChanges();
                        MessageBox.Show("Вы успешно");
                        AuthWindow authWindow = new AuthWindow();
                        authWindow.Show();
                        this.Close();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }
            }
            else
            {
                MessageBox.Show("Заполните все поля!", "Внимание", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            AuthWindow authWindow = new AuthWindow();
            authWindow.Show();
            this.Close();
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
        private void forGotFocus(TextBox textBox)
        {
            textBox.Text = "";
            textBox.Foreground = Brushes.Black;
        }

        private void forLostFocus(TextBox textBox, string a)
        {
            if (textBox.Text == null || textBox.Text == "")
            {
                textBox.Text = "Введите " + a;
                textBox.Foreground = Brushes.Gray;
            }
        }

        private void tbLName_GotFocus(object sender, RoutedEventArgs e)
        {
            forGotFocus(tbLName);
        }

        private void tbLName_LostFocus(object sender, RoutedEventArgs e)
        {
            forLostFocus(tbLName, "фамилию");
        }

        private void tbFName_GotFocus(object sender, RoutedEventArgs e)
        {
            forGotFocus(tbFName);
        }

        private void tbFName_LostFocus(object sender, RoutedEventArgs e)
        {
            forLostFocus(tbFName, "имя");
        }

        private void tbMName_GotFocus(object sender, RoutedEventArgs e)
        {
            forGotFocus(tbMName);
        }

        private void tbMName_LostFocus(object sender, RoutedEventArgs e)
        {
            forLostFocus(tbMName, "отчество");
        }

        private void tbAddress_GotFocus(object sender, RoutedEventArgs e)
        {
            forGotFocus(tbAddress);
        }

        private void tbAddress_LostFocus(object sender, RoutedEventArgs e)
        {
            forLostFocus(tbAddress, "адрес");
        }

        private void tbPhone_GotFocus(object sender, RoutedEventArgs e)
        {
            forGotFocus(tbPhone);
        }

        private void tbPhone_LostFocus(object sender, RoutedEventArgs e)
        {
            forLostFocus(tbPhone, "телефон");
        }

        private void tbEmail_GotFocus(object sender, RoutedEventArgs e)
        {
            forGotFocus(tbEmail);
        }

        private void tbEmail_LostFocus(object sender, RoutedEventArgs e)
        {
            forLostFocus(tbEmail, "почту");
        }

        private void tbLogin_GotFocus(object sender, RoutedEventArgs e)
        {
            forGotFocus(tbLogin);
        }

        private void tbLogin_LostFocus(object sender, RoutedEventArgs e)
        {
            forLostFocus(tbLogin, "логин");
        }

        private void tbPassword_GotFocus(object sender, RoutedEventArgs e)
        {
            forGotFocus(tbPassword);
        }

        private void tbPassword_LostFocus(object sender, RoutedEventArgs e)
        {
            forLostFocus(tbPassword, "пароль");
        }
    }
}
