//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLyKho
{
    using System;
    using System.Collections.Generic;
    
    public partial class PhieuThuTien
    {
        public bool MaPhieuThuTien { get; set; }
        public Nullable<System.DateTime> NgayThuTien { get; set; }
        public Nullable<int> SoTienThu { get; set; }
        public Nullable<int> MaKhachHang { get; set; }
    
        public virtual KhachHang KhachHang { get; set; }
    }
}
