USE [master]
GO
/****** Object:  Database [QuanLyNhaSach]    Script Date: 5/1/2022 9:39:18 PM ******/
CREATE DATABASE [QuanLyNhaSach]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyNhaSach', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLyNhaSach.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyNhaSach_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLyNhaSach_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyNhaSach] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyNhaSach].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyNhaSach] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyNhaSach] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyNhaSach] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyNhaSach] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyNhaSach] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyNhaSach] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyNhaSach] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyNhaSach] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyNhaSach] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyNhaSach] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyNhaSach] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyNhaSach] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyNhaSach] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyNhaSach] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyNhaSach] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyNhaSach] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyNhaSach] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyNhaSach] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyNhaSach] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyNhaSach] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyNhaSach] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyNhaSach] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyNhaSach] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyNhaSach] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyNhaSach] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyNhaSach] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyNhaSach] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyNhaSach] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyNhaSach] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuanLyNhaSach]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 5/1/2022 9:39:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHoaDon] [int] NOT NULL,
	[MaSach] [int] NOT NULL,
	[SoLuongMua] [int] NULL,
	[DonGia] [nvarchar](max) NULL,
 CONSTRAINT [ChiTietHoaDon_PK] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 5/1/2022 9:39:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaKhachHang] [int] NULL,
	[NgayLapHoaDon] [date] NULL,
 CONSTRAINT [HoaDon_PK] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 5/1/2022 9:39:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[TenKhachHang] [nvarchar](max) NULL,
	[DienThoai] [nvarchar](max) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Tien] [int] NULL,
	[MaPhieuThuTien] [int] NULL,
 CONSTRAINT [KhachHang_PK] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 5/1/2022 9:39:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[tendangnhap] [nvarchar](100) NOT NULL,
	[matkhau] [nvarchar](max) NULL,
	[loai] [bit] NULL CONSTRAINT [DF_Users_Type]  DEFAULT ((0)),
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[tendangnhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 5/1/2022 9:39:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPhieuNhap] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhap] [date] NULL,
	[SoLuong] [int] NULL,
	[MaSach] [int] NULL,
 CONSTRAINT [PhieuNhap_PK] PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuThuTien]    Script Date: 5/1/2022 9:39:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuThuTien](
	[MaPhieuThuTien] [int] IDENTITY(1,1) NOT NULL,
	[NgayThuTien] [datetime] NULL,
	[SoTienThu] [int] NULL,
 CONSTRAINT [PhieuThuTien_PK] PRIMARY KEY CLUSTERED 
(
	[MaPhieuThuTien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuyDinh]    Script Date: 5/1/2022 9:39:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyDinh](
	[SoLuongSachTonToiThieuDeNhap] [int] NULL,
	[SoLuongSachNhapToiThieuDeNhap] [int] NULL,
	[TienToiDa] [int] NULL,
	[SoLuongSachTonToiThieuSauKhiBan] [int] NULL,
	[TienThuLonHonNo] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sach]    Script Date: 5/1/2022 9:39:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[MaSach] [int] IDENTITY(1,1) NOT NULL,
	[TenSach] [nvarchar](max) NULL,
	[TenTheLoai] [nvarchar](max) NULL,
	[TacGia] [nvarchar](max) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
 CONSTRAINT [Sach_PK] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[NguoiDung] ([tendangnhap], [matkhau], [loai]) VALUES (N'admin', N'admin', 1)
INSERT [dbo].[NguoiDung] ([tendangnhap], [matkhau], [loai]) VALUES (N'staff', N'staff', 0)
SET IDENTITY_INSERT [dbo].[PhieuNhap] ON 

INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (2, CAST(N'2022-05-01' AS Date), 11, 1)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (3, CAST(N'2022-08-05' AS Date), 11, 1)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (4, CAST(N'2022-05-01' AS Date), 11, 1)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (5, CAST(N'2022-05-10' AS Date), 11, 1)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (6, CAST(N'2022-07-12' AS Date), 11, 1)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (7, CAST(N'2022-07-13' AS Date), 11, 1)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (8, CAST(N'2022-05-08' AS Date), 12, 1)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (9, CAST(N'2022-05-02' AS Date), 15, 1)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (10, CAST(N'2022-05-02' AS Date), 15, 1)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (11, CAST(N'2022-05-22' AS Date), 5, 1)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (12, CAST(N'2022-05-22' AS Date), 7, 1)
SET IDENTITY_INSERT [dbo].[PhieuNhap] OFF
SET IDENTITY_INSERT [dbo].[Sach] ON 

INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [DonGia]) VALUES (1, N'Nhà Giả Kim', N'Văn học', N'Paulo Coelho', 137, 25000)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [DonGia]) VALUES (2, N'Tuổi Thơ Dữ Dội', N'Văn học', N'Phùng Quán', 50, 20000)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [DonGia]) VALUES (3, N'Chí Phèo', N'Văn học', N'Nam Cao', 30, 30000)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [DonGia]) VALUES (4, N'Vợ Nhặt', N'Văn học', N'Kim Lân', 40, 15000)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [DonGia]) VALUES (5, N'Tắt Đèn', N'Văn học', N'Ngô Tất Tố', 50, 45000)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [DonGia]) VALUES (6, N'Kinh điển về khởi nghiệp', N'Kinh Tế', N'BILL AULET', 25, 40000)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [DonGia]) VALUES (7, N'Lược Sử Kinh Tế Học', N'Kinh Tế', N'Niall Kishtainy', 30, 35000)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [DonGia]) VALUES (8, N'Xây dựng để trường tồn', N'Kinh Tế', N'Jim Collins ', 35, 20000)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [DonGia]) VALUES (9, N'Từ tốt đến vĩ đại', N'Kinh Tế', N'Jim Collins ', 27, 27000)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [DonGia]) VALUES (10, N'Thế Giới Phẳng', N'Kinh Tế', N'Thomas L.Friedman', 19, 60000)
SET IDENTITY_INSERT [dbo].[Sach] OFF
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietHo__MaHoa__21B6055D] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK__ChiTietHo__MaHoa__21B6055D]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__MaKhachH__20C1E124] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__MaKhachH__20C1E124]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK__KhachHang__MaPhi__1FCDBCEB] FOREIGN KEY([MaPhieuThuTien])
REFERENCES [dbo].[PhieuThuTien] ([MaPhieuThuTien])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK__KhachHang__MaPhi__1FCDBCEB]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_Sach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_Sach]
GO
USE [master]
GO
ALTER DATABASE [QuanLyNhaSach] SET  READ_WRITE 
GO
