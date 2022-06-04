using Microsoft.OData.Edm;
using System;
using System.Collections.Generic;
using System.Globalization;
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
    
    

    public partial class RuleWindow : Window
    {

        
        
        public RuleWindow()
        {
            InitializeComponent();

        }

        private void ruleLoaded(object sender, RoutedEventArgs e)
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            var quydinh = db.QuyDinhs.FirstOrDefault();
            slnhaptoithieu.Text = quydinh.SoLuongSachNhapToiThieuDeNhap.ToString();
            sltontoithieu.Text = quydinh.SoLuongSachTonToiThieuDeNhap.ToString();
            notoida.Text = quydinh.TienToiDa.ToString();
            tonsaukhiban.Text = quydinh.SoLuongSachTonToiThieuSauKhiBan.ToString();
            sotienthu.IsChecked = quydinh.TienThuLonHonNo;
        }

        private void updateButton(object sender, RoutedEventArgs e)
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            var quydinh = db.QuyDinhs.FirstOrDefault();
            quydinh.SoLuongSachNhapToiThieuDeNhap = int.Parse(slnhaptoithieu.Text);
            quydinh.SoLuongSachTonToiThieuDeNhap = int.Parse(slnhaptoithieu.Text);
            quydinh.TienToiDa = int.Parse(notoida.Text);
            quydinh.SoLuongSachTonToiThieuSauKhiBan = int.Parse(tonsaukhiban.Text);
            quydinh.TienThuLonHonNo = sotienthu.IsChecked;
            db.SaveChanges();
        }
    }
    
}
