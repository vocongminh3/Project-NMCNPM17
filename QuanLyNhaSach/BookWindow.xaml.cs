using Microsoft.OData.Edm;
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
    /// Interaction logic for BookWindow.xaml
    /// </summary>
    
    

    public partial class BookWindow : Window
    {
        private void LoadData()
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            var data = (from s in db.Saches
                        join pn in db.PhieuNhaps on s.MaSach equals pn.MaSach
                        //where
                        select new
                        {
                            s.TenSach,
                            s.TenTheLoai,
                            s.TacGia,
                            pn.NgayNhap,
                            pn.SoLuong,
                            pn.MaPhieuNhap,
                        }).ToList();

            input.ItemsSource = data;
        }


        public bool checkNotEmpty(string str)
        {
            return str != "";
        }


        public BookWindow()
        {
            InitializeComponent();

        }

        private void addButton_Click(object sender, RoutedEventArgs e)
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            DateTime? selectedDate = date.SelectedDate;
            if (selectedDate.HasValue && checkNotEmpty(quantity.Text))
            {
                //string dateInput = selectedDate.Value.ToString("dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                if (quantity.Text.All(char.IsDigit) == false)
                {
                    MessageBox.Show("Số lượng phải là số nguyên");
                }
                else
                {

                    var phieunhap = new QuanLyKho.PhieuNhap();
                    //phieunhap.NgayNhap = selectedDate.Value;
                    var book = db.Saches.Where(s => s.TenSach == name.Text).FirstOrDefault();
                    if(book == null)
                    {
                        var newBook = new QuanLyKho.Sach();
                        newBook.TenSach = name.Text;
                        newBook.TenTheLoai = type.Text;
                        newBook.TacGia = author.Text;
                        newBook.SoLuong = Int32.Parse(quantity.Text);
                        db.Saches.Add(newBook);
                        phieunhap.MaSach =  newBook.MaSach;
                    }
                    else
                    {
                        book.SoLuong += Int32.Parse(quantity.Text);
                    }
                    
                    phieunhap.NgayNhap = selectedDate.Value;
                    phieunhap.SoLuong = Int32.Parse(quantity.Text);
                    //phieunhap.MaSach = book.MaSach;
                    db.PhieuNhaps.Add(phieunhap);
                    
                    db.SaveChanges();

                }


            }
            else
            {
                MessageBox.Show("Dữ liệu thiếu");
            }
            LoadData();
            
        }

        private void bookWindow_Loaded(object sender, RoutedEventArgs e)
        {

            LoadData();
        }


        private void updatePhieuNhap_Button(object sender, RoutedEventArgs e)
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            if (input.SelectedItem == null)
            {
                MessageBox.Show("Chọn Phiếu Nhập Cần Sửa");
            }
            else
            {
                // Lấy giá trị Mã phiếu nhập từ listview
                var selectedInput = input.SelectedItem.ToString().Split(',').ToList()[5].Split(' ').ToList()[3].ToString();
                int maPhieuNhap = Int32.Parse(selectedInput);
                var PhieuNhap = db.PhieuNhaps.Find(maPhieuNhap);
                var book = db.Saches.Find(PhieuNhap.MaSach);
                int oldQuantity = (int)PhieuNhap.SoLuong;
                PhieuNhap.SoLuong = Int32.Parse(quantity.Text);
                PhieuNhap.NgayNhap = date.SelectedDate;
                book.SoLuong += PhieuNhap.SoLuong - oldQuantity;
                db.SaveChanges();
                LoadData();
                input.SelectedItem = null;
            }
        }

        private void input_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
           
            // Lấy giá trị Mã phiếu nhập từ listview
            if (input.SelectedItem != null)
            {
                var selectedInput = input.SelectedItem.ToString().Split(',').ToList()[5].Split(' ').ToList()[3].ToString();
                int maPhieuNhap = Int32.Parse(selectedInput);
                var PhieuNhap = db.PhieuNhaps.Find(maPhieuNhap);
                var book = db.Saches.Find(PhieuNhap.MaSach);
                name.Text = book.TenSach;
                type.Text = book.TenTheLoai;
                author.Text = book.TacGia;
                quantity.Text = PhieuNhap.SoLuong.ToString();
                date.SelectedDate = PhieuNhap.NgayNhap;
            }
            
        }

        private void deletePhieuNhap_Button(object sender, RoutedEventArgs e)
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            if (input.SelectedItem == null)
            {
                MessageBox.Show("Chọn Phiếu Nhập Cần Xóa");
            }
            else
            {
                var Result = MessageBox.Show("Bạn có chắc muốn xóa phiếu nhập", "", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (Result == MessageBoxResult.Yes)
                {
                    // Lấy giá trị Mã phiếu nhập từ listview
                    var selectedInput = input.SelectedItem.ToString().Split(',').ToList()[5].Split(' ').ToList()[3].ToString();
                    int maPhieuNhap = Int32.Parse(selectedInput);
                    var PhieuNhap = db.PhieuNhaps.Find(maPhieuNhap);
                    var book = db.Saches.Find(PhieuNhap.MaSach);
                    PhieuNhap.SoLuong = Int32.Parse(quantity.Text);
                    PhieuNhap.NgayNhap = date.SelectedDate;
                    book.SoLuong -= PhieuNhap.SoLuong;
                    db.PhieuNhaps.Remove(PhieuNhap);
                    db.SaveChanges();
                    LoadData();
                    input.SelectedItem = null;
                }
                else if (Result == MessageBoxResult.No)
                {
                    
                }
                
            }
        }

        //private void InitializeComponent()
        //{
        ///return 0;
        //}
    }
}
