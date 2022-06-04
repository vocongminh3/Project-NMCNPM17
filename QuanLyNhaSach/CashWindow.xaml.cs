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
    /// Interaction logic for CashWindow.xaml
    /// </summary>
    public partial class CashWindow : Window
    {
        private void LoadDatacombobox()
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            var customers = db.KhachHangs.Where(s => s.BiXoa == false).ToList();
            customerCombobox.ItemsSource = customers;
        }

        private void LoadData()
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            var data = (from ptt in db.PhieuThuTiens
                        join kh in db.KhachHangs on ptt.MaKhachHang equals kh.MaKhachHang
                        where kh.BiXoa == false
                        select new
                        {
                            ptt.MaPhieuThuTien,
                            kh.TenKhachHang,
                            kh.DienThoai,
                            kh.DiaChi,
                            kh.Email,
                            ptt.SoTienThu,
                            ptt.NgayThuTien
                        }).ToList();
            cashListview.ItemsSource = data;
        }
        public CashWindow()
        {
            InitializeComponent();
        }

        private void window_Loaded(object sender, RoutedEventArgs e)
        {
            LoadDatacombobox();
            LoadData();
        }

        private void customerCombobox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var selected = customerCombobox.SelectedItem as QuanLyKho.KhachHang;
            phone.Text = selected.DienThoai;
            email.Text = selected.Email;
            adress.Text = selected.DiaChi;
            //money.Text = selected.Tien.ToString();
        }

        private void add_Button(object sender, RoutedEventArgs e)
        {
            DateTime? selectedDate = date.SelectedDate;
            if (customerCombobox.SelectedItem == null || date.SelectedDate == null || money.Text == "")
            {
                MessageBox.Show("Thiếu dữ liệu");
            }
            else if (money.Text.All(char.IsDigit) == false )
            {
                MessageBox.Show("Số lượng và giá phải là số");
            }
            else 
            {
                var db = new QuanLyKho.QuanLyNhaSachEntities();
                var rule = db.QuyDinhs.FirstOrDefault();
                var customerSelected = customerCombobox.SelectedItem as QuanLyKho.KhachHang;
                var customer = db.KhachHangs.Find(customerSelected.MaKhachHang);
                var cash = new QuanLyKho.PhieuThuTien();
                var moneyText = int.Parse(money.Text);
                if ((bool)rule.TienThuLonHonNo == true)
                {
                    if (moneyText + customer.Tien >= 0 )
                    {
                        MessageBox.Show("Số tiền thu không vượt quá số tiền đang nợ");
                    }
                    else
                    {
                        cash.MaKhachHang = customer.MaKhachHang;
                        cash.NgayThuTien = selectedDate.Value;
                        cash.SoTienThu = moneyText;

                        //cap nhap so tien khach hang
                        var changeCustomer = db.KhachHangs.Find(customer.MaKhachHang);
                        changeCustomer.Tien += moneyText;


                        db.SaveChanges();

                        db.PhieuThuTiens.Add(cash);
                        db.SaveChanges();

                        LoadData();
                    }    
                }
                else
                {
                    cash.MaKhachHang = customer.MaKhachHang;
                    cash.NgayThuTien = selectedDate.Value;
                    cash.SoTienThu = moneyText;

                    //cap nhap so tien khach hang
                    var changeCustomer = db.KhachHangs.Find(customer.MaKhachHang);
                    changeCustomer.Tien += moneyText;


                    db.SaveChanges();

                    db.PhieuThuTiens.Add(cash);
                    db.SaveChanges();

                    LoadData();
                }    

                
                

                

            }
        }

        private void update_Button(object sender, RoutedEventArgs e)
        {
            if(cashListview.SelectedItem == null)
            {
                MessageBox.Show("Vui lòng chọn hóa đơn cần sửa");
            }
            else
            {
                DateTime? selectedDate = date.SelectedDate;
                if (customerCombobox.SelectedItem == null || date.SelectedDate == null || money.Text == "")
                {
                    MessageBox.Show("Thiếu dữ liệu");
                }
                else if (money.Text.All(char.IsDigit) == false)
                {
                    MessageBox.Show("Số lượng và giá phải là số");
                }
                else
                {
                    var db = new QuanLyKho.QuanLyNhaSachEntities();
                    var idPhieuThuTien = int.Parse(cashListview.SelectedItem.ToString().Split(',').ToList()[0].Split(' ').ToList()[3]);
                    var cash = db.PhieuThuTiens.Find(idPhieuThuTien);
                    var customerSelected = customerCombobox.SelectedItem as QuanLyKho.KhachHang;
                    var customer = db.KhachHangs.Find(customerSelected.MaKhachHang);
                    customer.Tien = customer.Tien + int.Parse(money.Text) - cash.SoTienThu;
                    db.SaveChanges();

                    cash.NgayThuTien = selectedDate.Value;
                    cash.SoTienThu = int.Parse(money.Text);
                    cash.MaKhachHang = customerSelected.MaKhachHang;

                    db.SaveChanges();
                    LoadData();
                    cashListview.SelectedItem = null;
                }
            }
        }

        private void cashListview_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if(cashListview.SelectedItem != null)
            {
                var db = new QuanLyKho.QuanLyNhaSachEntities();
                var idPhieuThuTien = int.Parse(cashListview.SelectedItem.ToString().Split(',').ToList()[0].Split(' ').ToList()[3]);
                var cash = db.PhieuThuTiens.Find(idPhieuThuTien);
                money.Text = cash.SoTienThu.ToString();
                date.SelectedDate = cash.NgayThuTien;
            }
            
        }

        private void delete_Button(object sender, RoutedEventArgs e)
        {
            if (cashListview.SelectedItem == null)
            {
                MessageBox.Show("Vui lòng chọn phiếu thu tiền cần sửa");
            }
            else
            {
                var Result = MessageBox.Show("Bạn có chắc muốn phiếu thu tiền không", "", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (Result == MessageBoxResult.Yes)
                {
                    var db = new QuanLyKho.QuanLyNhaSachEntities();
                    //Lấy mã khách hàng từ chuỗi chọn trên Listview
                    var idPhieuThuTien = int.Parse(cashListview.SelectedItem.ToString().Split(',').ToList()[0].Split(' ').ToList()[3]);
                    var cash = db.PhieuThuTiens.Find(idPhieuThuTien);
                    var customer = db.KhachHangs.Find(cash.MaKhachHang);
                    customer.Tien -= cash.SoTienThu;
                    db.PhieuThuTiens.Remove(cash);
                    db.SaveChanges();
                    LoadData();
                    cashListview.SelectedItem = null;
                }
                else if (Result == MessageBoxResult.No)
                {

                }
            }
        }
    }
}
