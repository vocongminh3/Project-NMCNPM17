using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace QuanLyNhaSach.ViewModel
{
    public class MainViewModel : BaseViewModel
    {
        public bool Isloaded = false;
        public ICommand LoadedWindowCommand { get; set; }
        public ICommand BookCommand { get; set; }
        public ICommand BillCommand { get; set; }
        public ICommand CashCommand { get; set; }
        public ICommand CustomerCommand { get; set; }
        public ICommand UserCommand { get; set; }
        public ICommand ReportCommand { get; set; }
        public ICommand RuleCommand { get; set; }
        // mọi thứ xử lý sẽ nằm trong này
        public MainViewModel()
        {
            LoadedWindowCommand = new RelayCommand<object>((p) => { return true; }, (p) => {
                Isloaded = true;
                //LoginWindow loginWindow = new LoginWindow();
                //loginWindow.ShowDialog();
            }
              );           
            BookCommand = new RelayCommand<object>((p) => { return true; }, (p) => {BookWindow wd = new BookWindow(); wd.ShowDialog(); });
            BillCommand = new RelayCommand<object>((p) => { return true; }, (p) => { BillWindow wd = new BillWindow(); wd.ShowDialog(); });
            CashCommand = new RelayCommand<object>((p) => { return true; }, (p) => { CashWindow wd = new CashWindow(); wd.ShowDialog(); });
            CustomerCommand = new RelayCommand<object>((p) => { return true; }, (p) => { CustomerWindow wd = new CustomerWindow(); wd.ShowDialog(); });
            UserCommand = new RelayCommand<object>((p) => { return true; }, (p) => { UserWindow wd = new UserWindow(); wd.ShowDialog(); });
            ReportCommand = new RelayCommand<object>((p) => { return true; }, (p) => { ReportWindow wd = new ReportWindow(); wd.ShowDialog(); });
            RuleCommand = new RelayCommand<object>((p) => { return true; }, (p) => { RuleWindow wd = new RuleWindow(); wd.ShowDialog(); });
        }

    }
}
