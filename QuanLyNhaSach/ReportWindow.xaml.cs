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
    
    

    public partial class ReportWindow : Window
    {

        public void LoadComboBox()
        {
            for(int i = 1; i <= 12; i++ )
            {
                month.Items.Add(i);
            }
            for (int i = 1999; i <= 2030; i++)
            {
                year.Items.Add(i);
            }
        }
        
        public ReportWindow()
        {
            InitializeComponent();

        }

        

        private void reportLoaded(object sender, RoutedEventArgs e)
        {
            var db = new QuanLyKho.QuanLyNhaSachEntities();
            var a = db.PhieuNhaps.ToList();
            LoadComboBox();
            
            test.ItemsSource = a;

        }

        private void searchReport_Click(object sender, RoutedEventArgs e)
        {
            if(month.SelectedItem == null || year.SelectedItem == null)
            {
                MessageBox.Show("Vui lòng chọn đủ năm và tháng");
            }
            else
            {
                var db = new QuanLyKho.QuanLyNhaSachEntities();
                MessageBox.Show(month.Text + year.Text);
                //test commit Viet
                DateTime dt1 = DateTime.Parse("07/12/2011");
                DateTime dt2 = DateTime.Now;


                if (dt1.Date > dt2.Date)
                {
                    //It's a later date
                }
                else
                {
                    //It's an earlier or equal date
                }

                


            }
        }
    }
}
