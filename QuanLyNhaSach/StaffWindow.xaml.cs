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
    /// Interaction logic for StaffWindow.xaml
    /// </summary>
    public partial class StaffWindow : Window
    {
        public StaffWindow()
        {
            InitializeComponent();
        }
        private void ControlBarUC_Loaded(object sender, RoutedEventArgs e)
        {

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

        }
        protected override void OnClosed(EventArgs e)
        {
            base.OnClosed(e);

            Application.Current.Shutdown();
        }

        private void staffWindow_Loaded(object sender, RoutedEventArgs e)
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            var dataBookList = db.Saches.ToList();
            bookList.ItemsSource = dataBookList;
        }

        private void searchButton_Click(object sender, RoutedEventArgs e)
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            bookList.ItemsSource = db.Saches.Where(s => s.TenSach.Contains(searchText.Text)).ToList();
        }

        private void searchText_TextChanged(object sender, TextChangedEventArgs e)
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            bookList.ItemsSource = db.Saches.Where(s => s.TenSach.Contains(searchText.Text)).ToList();
        }
    }
}
