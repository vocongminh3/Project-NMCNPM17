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
    /// Interaction logic for BillWindow.xaml
    /// </summary>
    public partial class BillWindow : Window
    {
        private void LoadDataCombobox()
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            var customers = db.KhachHangs.Where(s=> s.BiXoa == false).ToList();
            customerCombobox.ItemsSource = customers;
            var books = db.Saches.ToList();
            bookCombobox.ItemsSource = books;
        }

        private void LoadData()
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            var data = (from hd in db.HoaDons
                        join cthd in db.ChiTietHoaDons on hd.MaHoaDon equals cthd.MaHoaDon
                        join s in db.Saches on cthd.MaSach equals s.MaSach
                        join kh in db.KhachHangs on hd.MaKhachHang equals kh.MaKhachHang
                        where hd.BiXoa == false
                        select new
                        {
                            hd.MaHoaDon,
                            kh.TenKhachHang,
                            s.TenSach,
                            s.TenTheLoai,
                            cthd.SoLuongMua,
                            cthd.DonGia,
                            hd.NgayLapHoaDon
                        }).ToList();
            billListview.ItemsSource = data;
        }

        public BillWindow()
        {
            InitializeComponent();
        }

        private void window_Loaded(object sender, RoutedEventArgs e)
        {
            LoadDataCombobox();
            LoadData();
        }

        private void bookCombobox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var selected = bookCombobox.SelectedIndex;
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            var books = db.Saches.ToList()[selected].TenTheLoai;
            typeBook.Text = books;
        }

        private void add_Button(object sender, RoutedEventArgs e)
        {
            DateTime? selectedDate = date.SelectedDate;
            if (customerCombobox.SelectedItem == null || bookCombobox.SelectedItem == null || date.SelectedDate == null)
            {
                MessageBox.Show("Thiếu dữ liệu");
            }
            else if (quantity.Text.All(char.IsDigit) == false || price.Text.All(char.IsDigit) == false)
            {
                MessageBox.Show("Số lượng và giá phải là số");
            }
            else
            {
                var db = new QuanLyKho.QuanLyNhaSachEntities();
                var bill = new QuanLyKho.HoaDon();
                var detailBill = new QuanLyKho.ChiTietHoaDon();
                var customerSelected = customerCombobox.SelectedItem as QuanLyKho.KhachHang;
                var bookSelected = bookCombobox.SelectedItem as QuanLyKho.Sach;

                bill.MaKhachHang = customerSelected.MaKhachHang;
                bill.NgayLapHoaDon = selectedDate.Value;
                bill.BiXoa = false;
                db.HoaDons.Add(bill);
                
                detailBill.DonGia = int.Parse(price.Text);
                detailBill.SoLuongMua = int.Parse(quantity.Text);
                detailBill.MaHoaDon = bill.MaHoaDon;
                detailBill.MaSach = bookSelected.MaSach;
                db.ChiTietHoaDons.Add(detailBill);
                db.SaveChanges();
                LoadData();
            }
        }

        private void update_Button(object sender, RoutedEventArgs e)
        {
            if(billListview.SelectedItem == null)
            {
                MessageBox.Show("Vui lòng chọn hóa đơn cần sửa");
            }
            else
            {
                DateTime? selectedDate = date.SelectedDate;
                if (customerCombobox.SelectedItem == null || bookCombobox.SelectedItem == null || date.SelectedDate == null)
                {
                    MessageBox.Show("Thiếu dữ liệu");
                }
                else if (quantity.Text.All(char.IsDigit) == false || price.Text.All(char.IsDigit) == false)
                {
                    MessageBox.Show("Số lượng và giá phải là số");
                }
                else
                {
                    var db = new QuanLyKho.QuanLyNhaSachEntities();
                    var customerSelected = customerCombobox.SelectedItem as QuanLyKho.KhachHang;
                    var bookSelected = bookCombobox.SelectedItem as QuanLyKho.Sach;
                    var quantityBill = int.Parse(quantity.Text);
                    var priceBill = int.Parse(price.Text);
                    var date = selectedDate.Value;

                    //Lấy mã khách hàng từ chuỗi chọn trên Listview
                    var idBillSelected = int.Parse(billListview.SelectedItem.ToString().Split(',').ToList()[0].Split(' ').ToList()[3]);

                    var billSelected = db.HoaDons.Find(idBillSelected);
                    //var detailBill = db.ChiTietHoaDons.Where(s => s.MaHoaDon == billSelected.MaHoaDon).FirstOrDefault();
                    var detailBill = db.ChiTietHoaDons.Single(s => s.MaHoaDon == billSelected.MaHoaDon);
                    var newDetailBill = new QuanLyKho.ChiTietHoaDon();
                    billSelected.NgayLapHoaDon = date;
                    billSelected.MaKhachHang = customerSelected.MaKhachHang;

                    newDetailBill.MaHoaDon = billSelected.MaHoaDon;
                    newDetailBill.SoLuongMua = quantityBill;
                    newDetailBill.DonGia = priceBill;
                    newDetailBill.MaSach = bookSelected.MaSach;
                    db.ChiTietHoaDons.Remove(detailBill);
                    db.ChiTietHoaDons.Add(newDetailBill);
                    db.SaveChanges();
                    LoadData();
                }
                
            }    
        }

        private void billListview_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {


            //Lấy giá trị Mã phiếu nhập từ listview
            if (billListview.SelectedItem != null)
            {
                var db = new QuanLyKho.QuanLyNhaSachEntities();
                //var selectedInput = input.SelectedItem.ToString().Split(',').ToList()[5].Split(' ').ToList()[3].ToString();
                //Lấy mã khách hàng từ chuỗi chọn trên Listview
                var idBillSelected = int.Parse(billListview.SelectedItem.ToString().Split(',').ToList()[0].Split(' ').ToList()[3]);
                var billSelected = db.HoaDons.Find(idBillSelected);
                var detailBill = db.ChiTietHoaDons.Where(s => s.MaHoaDon == billSelected.MaHoaDon).FirstOrDefault();
                quantity.Text = detailBill.SoLuongMua.ToString();
                price.Text = detailBill.DonGia.ToString();
                date.SelectedDate = billSelected.NgayLapHoaDon;

            }
        }
    }
}
