// Updated by XamlIntelliSenseFileGenerator 5/8/2022 11:40:35 AM
#pragma checksum "..\..\BillWindow.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "2AEDF722D164EF6FCA778412F41745EACCA932EC7EFA5086D38B847E7F39C878"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using MaterialDesignThemes.Wpf;
using MaterialDesignThemes.Wpf.Transitions;
using QuanLyNhaSach;
using QuanLyNhaSach.UserControlKteam;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace QuanLyNhaSach
{


    /// <summary>
    /// BillWindow
    /// </summary>
    public partial class BillWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector
    {

#line default
#line hidden


#line 44 "..\..\BillWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox customerCombobox;

#line default
#line hidden


#line 54 "..\..\BillWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox bookCombobox;

#line default
#line hidden


#line 64 "..\..\BillWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox typeBook;

#line default
#line hidden


#line 65 "..\..\BillWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox quantity;

#line default
#line hidden


#line 66 "..\..\BillWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox price;

#line default
#line hidden


#line 67 "..\..\BillWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DatePicker date;

#line default
#line hidden

        private bool _contentLoaded;

        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent()
        {
            if (_contentLoaded)
            {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/QuanLyKho;component/billwindow.xaml", System.UriKind.Relative);

#line 1 "..\..\BillWindow.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);

#line default
#line hidden
        }

        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal System.Delegate _CreateDelegate(System.Type delegateType, string handler)
        {
            return System.Delegate.CreateDelegate(delegateType, this, handler);
        }

        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target)
        {
            switch (connectionId)
            {
                case 1:
                    this.window = ((QuanLyNhaSach.BillWindow)(target));

#line 24 "..\..\BillWindow.xaml"
                    this.window.Loaded += new System.Windows.RoutedEventHandler(this.window_Loaded);

#line default
#line hidden
                    return;
                case 2:
                    this.customerCombobox = ((System.Windows.Controls.ComboBox)(target));
                    return;
                case 3:
                    this.bookCombobox = ((System.Windows.Controls.ComboBox)(target));

#line 54 "..\..\BillWindow.xaml"
                    this.bookCombobox.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.bookCombobox_SelectionChanged);

#line default
#line hidden
                    return;
                case 4:
                    this.typeBook = ((System.Windows.Controls.TextBox)(target));
                    return;
                case 5:
                    this.quantity = ((System.Windows.Controls.TextBox)(target));
                    return;
                case 6:
                    this.price = ((System.Windows.Controls.TextBox)(target));
                    return;
                case 7:
                    this.date = ((System.Windows.Controls.DatePicker)(target));
                    return;
                case 8:

#line 73 "..\..\BillWindow.xaml"
                    ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.add_Button);

#line default
#line hidden
                    return;
            }
            this._contentLoaded = true;
        }

        internal System.Windows.Window window;
        internal System.Windows.Controls.ListView billListview;
    }
}

