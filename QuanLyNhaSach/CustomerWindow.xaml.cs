using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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
    /// Interaction logic for CustomerWindow.xaml
    /// </summary>
    public partial class CustomerWindow : Window
    {

        private void LoadData()
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            var data = db.KhachHangs.ToList();
            

            customerListview.ItemsSource = data;
        }
        public CustomerWindow()
        {
            InitializeComponent();
        }

        private void addCustomer_Button(object sender, RoutedEventArgs e)
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            var foo = new EmailAddressAttribute();
            if (name.Text == "" || adress.Text=="" || numberphone.Text == "" || email.Text == "")
            {
                MessageBox.Show("Thiếu dữ liệu");
            }
            else if(foo.IsValid(email.Text) == false)
            {
                MessageBox.Show("Email không đúng định dạng");
            }
            else if(numberphone.Text.All(char.IsDigit)==false)
            {
                MessageBox.Show("Số điện thoại phải là số");
            }
            else
            {
                var customer = new QuanLyKho.KhachHang();
                customer.TenKhachHang = name.Text;
                customer.DiaChi = adress.Text;
                customer.DienThoai = numberphone.Text;
                customer.Email = email.Text;
                customer.Tien = 0;
                db.KhachHangs.Add(customer);
                db.SaveChanges();
                LoadData();
            }
        }

        private void window_Loaded(object sender, RoutedEventArgs e)
        {
            LoadData();
        }

        private void updateCustomer_Button(object sender, RoutedEventArgs e)
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            var foo = new EmailAddressAttribute();
            if (customerListview.SelectedItem == null)
            {
                MessageBox.Show("Chọn Khách Hàng Cần Sửa");
            }    
            else
            {
                
                if (name.Text == "" || adress.Text == "" || numberphone.Text == "" || email.Text == "")
                {
                    MessageBox.Show("Thiếu dữ liệu");
                }
                else if (foo.IsValid(email.Text) == false)
                {
                    MessageBox.Show("Email không đúng định dạng");
                }
                else if (numberphone.Text.All(char.IsDigit) == false)
                {
                    MessageBox.Show("Số điện thoại phải là số");
                }
                else
                {
                    var selected = customerListview.SelectedItem as QuanLyKho.KhachHang;
                    var selectedCustomer = db.KhachHangs.Find(selected.MaKhachHang);
                    selectedCustomer.TenKhachHang = name.Text;
                    selectedCustomer.DiaChi = adress.Text;
                    selectedCustomer.DienThoai = numberphone.Text;
                    selectedCustomer.Email = email.Text;
                    db.SaveChanges();
                    
                    LoadData();
                }
                
                
            }
            customerListview.SelectedItem = null;
        }

        private void customerListview_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if(customerListview.SelectedItem != null)
            {
                var selectedCustomer = customerListview.SelectedItem as QuanLyKho.KhachHang;
                name.Text = selectedCustomer.TenKhachHang;
                adress.Text = selectedCustomer.DiaChi;
                numberphone.Text = selectedCustomer.DienThoai;
                email.Text = selectedCustomer.Email;
            }    
            
        }

        private void deleteCustomer_Button(object sender, RoutedEventArgs e)
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            var foo = new EmailAddressAttribute();
            if (customerListview.SelectedItem == null)
            {
                MessageBox.Show("Chọn Khách Hàng Cần Sửa");
            }
            else
            {

                if (name.Text == "" || adress.Text == "" || numberphone.Text == "" || email.Text == "")
                {
                    MessageBox.Show("Thiếu dữ liệu");
                }
                else if (foo.IsValid(email.Text) == false)
                {
                    MessageBox.Show("Email không đúng định dạng");
                }
                else if (numberphone.Text.All(char.IsDigit) == false)
                {
                    MessageBox.Show("Số điện thoại phải là số");
                }
                else
                {
                    var selected = customerListview.SelectedItem as QuanLyKho.KhachHang;
                    var selectedCustomer = db.KhachHangs.Find(selected.MaKhachHang);
                    db.KhachHangs.Remove(selectedCustomer);

                    db.SaveChanges();

                    LoadData();
                }


            }
            customerListview.SelectedItem = null;
        }
    }
}
