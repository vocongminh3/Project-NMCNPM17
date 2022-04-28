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

namespace QuanLyNhaSach
{
    /// <summary>
    /// Interaction logic for LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {
            InitializeComponent();
        }

        private void login_buttun(object sender, RoutedEventArgs e)
        {
            if(username.Text == "admin" && FloatingPasswordBox.Password == "admin")
            {
                this.Hide();
                MainWindow mainWindow = new MainWindow();
                mainWindow.ShowDialog();

            }
            if (username.Text == "staff" && FloatingPasswordBox.Password == "staff")
            {
                this.Hide();
                StaffWindow staffWindow = new StaffWindow();
                staffWindow.ShowDialog();

            }
        }
        protected override void OnClosed(EventArgs e)
        {
            base.OnClosed(e);

            Application.Current.Shutdown();
        }
    }
}
