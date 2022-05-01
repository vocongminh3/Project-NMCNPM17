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
        private QuanLyKho.Sach sachChoie;


        public BookWindow(QuanLyKho.Sach sach)
        {
            sachChoie = sach;
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
                    phieunhap.MaSach = sachChoie.MaSach;
                    //phieunhap.NgayNhap = selectedDate.Value;
                    phieunhap.NgayNhap = selectedDate.Value;
                    phieunhap.SoLuong = Int32.Parse(quantity.Text);
                    db.PhieuNhaps.Add(phieunhap);
                    var book = db.Saches.Find(sachChoie.MaSach);
                    book.SoLuong += Int32.Parse(quantity.Text);
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
            name.Text = sachChoie.TenSach;
            type.Text = sachChoie.TenTheLoai;
            author.Text = sachChoie.TacGia;
        }

        private void nameBook_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            
        }

        //private void InitializeComponent()
        //{
        ///return 0;
        //}
    }
}
