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
        private void LoadData()
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            var dataBookList = db.Saches.Where(s => s.BiXoa == false).ToList();
            bookList.ItemsSource = dataBookList;
        }

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
            LoadData();
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

        private void PhieuNhap_button(object sender, RoutedEventArgs e)
        {
            this.Hide();
            BookWindow bookWindow = new BookWindow();
            bookWindow.ShowDialog();
            LoadData();
            this.ShowDialog();
        }

        private void bansach_button(object sender, RoutedEventArgs e)
        {
            this.Hide();
            BillWindow billWindow = new BillWindow();
            billWindow.ShowDialog();
            LoadData();
            this.ShowDialog();
        }

        private void bookList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
