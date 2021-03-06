USE [master]
GO
/****** Object:  Database [QuanLyNhaSach]    Script Date: 6/5/2022 10:40:34 AM ******/
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
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 6/5/2022 10:40:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHoaDon] [int] NOT NULL,
	[MaSach] [int] NOT NULL,
	[SoLuongMua] [int] NULL,
	[DonGia] [int] NULL,
 CONSTRAINT [ChiTietHoaDon_PK] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 6/5/2022 10:40:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaKhachHang] [int] NULL,
	[NgayLapHoaDon] [date] NULL,
	[BiXoa] [bit] NULL,
 CONSTRAINT [HoaDon_PK] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/5/2022 10:40:34 AM ******/
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
	[Tien] [int] NULL CONSTRAINT [DF_KhachHang_Tien]  DEFAULT ((0)),
	[BiXoa] [bit] NULL,
 CONSTRAINT [KhachHang_PK] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 6/5/2022 10:40:34 AM ******/
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
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 6/5/2022 10:40:34 AM ******/
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
/****** Object:  Table [dbo].[PhieuThuTien]    Script Date: 6/5/2022 10:40:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuThuTien](
	[MaPhieuThuTien] [int] IDENTITY(1,1) NOT NULL,
	[NgayThuTien] [datetime] NULL,
	[SoTienThu] [int] NULL,
	[MaKhachHang] [int] NULL,
 CONSTRAINT [PhieuThuTien_PK] PRIMARY KEY CLUSTERED 
(
	[MaPhieuThuTien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuyDinh]    Script Date: 6/5/2022 10:40:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyDinh](
	[SoLuongSachTonToiThieuDeNhap] [int] NULL,
	[SoLuongSachNhapToiThieuDeNhap] [int] NULL,
	[TienToiDa] [int] NULL,
	[SoLuongSachTonToiThieuSauKhiBan] [int] NULL,
	[TienThuLonHonNo] [bit] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_QuyDinh] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sach]    Script Date: 6/5/2022 10:40:34 AM ******/
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
	[BiXoa] [bit] NULL,
 CONSTRAINT [Sach_PK] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (2, 3, 5, 100000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (3, 5, 5, 10000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (4, 7, 5, 50000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (5, 3, 4, 50000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (6, 5, 4, 40000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (7, 4, 6, 60000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (8, 9, 4, 40000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (9, 1, 100, 50000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (10, 1, 100, 50000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (11, 1, 1000, 50000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (12, 1, 100, 10000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (13, 1, 100, 1111)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (14, 1, 100, 50000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (15, 1, 100, 50000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (16, 1, 100, 1111)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (17, 1, 100, 1112)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (18, 1, 1000, 50000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (19, 1, 4, 40000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (20, 1, 0, 50000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (21, 10, 20, 10)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (22, 4, 2, 5000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaSach], [SoLuongMua], [DonGia]) VALUES (23, 2, 100, 100)
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (1, 1, CAST(N'2022-05-08' AS Date), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (2, 2, CAST(N'2022-05-08' AS Date), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (3, 3, CAST(N'2022-05-10' AS Date), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (4, 2, CAST(N'2022-05-10' AS Date), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (5, 5, CAST(N'2022-05-10' AS Date), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (6, 5, CAST(N'2022-05-10' AS Date), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (7, 5, CAST(N'2022-05-06' AS Date), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (8, 2, CAST(N'2022-05-10' AS Date), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (9, 3, CAST(N'2022-05-10' AS Date), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (10, 1, CAST(N'2022-05-10' AS Date), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (11, 2, CAST(N'2022-06-04' AS Date), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (12, 1, CAST(N'2022-06-04' AS Date), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (13, 2, CAST(N'2022-06-04' AS Date), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (14, 1, CAST(N'2022-05-10' AS Date), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (15, 1, CAST(N'2022-05-10' AS Date), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (16, 1, CAST(N'2022-06-04' AS Date), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (17, 1, CAST(N'2022-06-07' AS Date), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (18, 2, CAST(N'2022-06-04' AS Date), 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (19, 3, CAST(N'2022-05-10' AS Date), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (20, 1, CAST(N'2022-06-04' AS Date), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (21, 1, CAST(N'2022-06-04' AS Date), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (22, 2, CAST(N'2022-05-10' AS Date), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaKhachHang], [NgayLapHoaDon], [BiXoa]) VALUES (23, 1, CAST(N'2022-06-05' AS Date), 1)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DienThoai], [DiaChi], [Email], [Tien], [BiXoa]) VALUES (1, N'Nguyễn Văn A', N'012345679', N'TPHCM', N'nguyenvana@gmail.com', 9600, 0)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DienThoai], [DiaChi], [Email], [Tien], [BiXoa]) VALUES (2, N'Nguyễn Văn B', N'0123456789', N'Long An', N'nguyenvanb@gmail.com', -12500, 0)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DienThoai], [DiaChi], [Email], [Tien], [BiXoa]) VALUES (3, N'Nguyễn Văn C', N'0123456789', N'An Giang', N'nguyenvanc@gmail.com', 0, 0)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DienThoai], [DiaChi], [Email], [Tien], [BiXoa]) VALUES (5, N'Nguyễn Thị E', N'123456789', N'Tiền Giang', N'nguyenthid@gmail.com', 0, 0)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DienThoai], [DiaChi], [Email], [Tien], [BiXoa]) VALUES (6, N'a', N'12345', N'a', N'a@gmail.com', 0, 1)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DienThoai], [DiaChi], [Email], [Tien], [BiXoa]) VALUES (7, N'a', N'12345', N'a', N'a@gmail.com', 0, 1)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
INSERT [dbo].[NguoiDung] ([tendangnhap], [matkhau], [loai]) VALUES (N'admin', N'admin', 1)
INSERT [dbo].[NguoiDung] ([tendangnhap], [matkhau], [loai]) VALUES (N'staff', N'staff', 0)
SET IDENTITY_INSERT [dbo].[PhieuNhap] ON 

INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (6, CAST(N'2022-07-12' AS Date), 11, 1)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (13, CAST(N'2022-05-11' AS Date), 22, 2)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (14, CAST(N'2022-05-02' AS Date), 15, 10)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (15, CAST(N'2022-05-02' AS Date), 10, 9)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (16, CAST(N'2022-05-03' AS Date), 50, 11)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (18, CAST(N'2022-06-04' AS Date), 100, NULL)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (19, CAST(N'2022-06-04' AS Date), 200, NULL)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (20, CAST(N'2022-05-02' AS Date), 150, NULL)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (21, CAST(N'2022-05-02' AS Date), 200, NULL)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (22, CAST(N'2022-05-11' AS Date), 200, NULL)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (23, CAST(N'2022-06-05' AS Date), 200, NULL)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (24, CAST(N'2022-06-05' AS Date), 200, NULL)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (25, CAST(N'2022-05-03' AS Date), 150, NULL)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (26, CAST(N'2022-05-03' AS Date), 150, NULL)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (27, CAST(N'2022-05-02' AS Date), 150, NULL)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (28, CAST(N'2022-05-02' AS Date), 150, NULL)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (29, CAST(N'2022-05-02' AS Date), 150, NULL)
INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [SoLuong], [MaSach]) VALUES (30, CAST(N'2022-06-05' AS Date), 150, 4)
SET IDENTITY_INSERT [dbo].[PhieuNhap] OFF
SET IDENTITY_INSERT [dbo].[PhieuThuTien] ON 

INSERT [dbo].[PhieuThuTien] ([MaPhieuThuTien], [NgayThuTien], [SoTienThu], [MaKhachHang]) VALUES (2, CAST(N'2022-05-14 00:00:00.000' AS DateTime), 10000, 5)
INSERT [dbo].[PhieuThuTien] ([MaPhieuThuTien], [NgayThuTien], [SoTienThu], [MaKhachHang]) VALUES (3, CAST(N'2022-05-14 00:00:00.000' AS DateTime), 5000, 3)
INSERT [dbo].[PhieuThuTien] ([MaPhieuThuTien], [NgayThuTien], [SoTienThu], [MaKhachHang]) VALUES (5, CAST(N'2022-06-04 00:00:00.000' AS DateTime), 10000, 1)
SET IDENTITY_INSERT [dbo].[PhieuThuTien] OFF
SET IDENTITY_INSERT [dbo].[QuyDinh] ON 

INSERT [dbo].[QuyDinh] ([SoLuongSachTonToiThieuDeNhap], [SoLuongSachNhapToiThieuDeNhap], [TienToiDa], [SoLuongSachTonToiThieuSauKhiBan], [TienThuLonHonNo], [id]) VALUES (400, 200, 20000, 20, 0, 1)
SET IDENTITY_INSERT [dbo].[QuyDinh] OFF
SET IDENTITY_INSERT [dbo].[Sach] ON 

INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [BiXoa]) VALUES (1, N'Nhà Giả Kim', N'Văn học', N'Paulo Coelho', 428, 0)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [BiXoa]) VALUES (2, N'Tuổi Thơ Dữ Dội', N'Văn học', N'Phùng Quán', 279, 0)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [BiXoa]) VALUES (3, N'Chí Phèo', N'Văn học', N'Nam Cao', 30, 0)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [BiXoa]) VALUES (4, N'Vợ Nhặt', N'Văn học', N'Kim Lân', 250, 0)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [BiXoa]) VALUES (5, N'Tắt Đèn', N'Văn học', N'Ngô Tất Tố', 50, 0)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [BiXoa]) VALUES (6, N'Kinh điển về khởi nghiệp', N'Kinh Tế', N'BILL AULET', 25, 0)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [BiXoa]) VALUES (7, N'Lược Sử Kinh Tế Học', N'Kinh Tế', N'Niall Kishtainy', 30, 0)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [BiXoa]) VALUES (8, N'Xây dựng để trường tồn', N'Kinh Tế', N'Jim Collins ', 35, 0)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [BiXoa]) VALUES (9, N'Từ tốt đến vĩ đại', N'Kinh Tế', N'Jim Collins ', 337, 0)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [BiXoa]) VALUES (10, N'Thế Giới Phẳng', N'Kinh Tế', N'Thomas L.Friedman', 165, 0)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [BiXoa]) VALUES (11, N'Hai Số Phận', N'Văn Học', N'Archer', 350, 0)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [BiXoa]) VALUES (12, N'â', N'a', N'a', 0, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TenTheLoai], [TacGia], [SoLuong], [BiXoa]) VALUES (13, N'Bắt Trẻ Đồng Xanh', N'Văn học', N'Salinger', 50, 0)
SET IDENTITY_INSERT [dbo].[Sach] OFF
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_Sach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_Sach]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_Sach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_Sach]
GO
ALTER TABLE [dbo].[PhieuThuTien]  WITH CHECK ADD  CONSTRAINT [FK_PhieuThuTien_KhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[PhieuThuTien] CHECK CONSTRAINT [FK_PhieuThuTien_KhachHang]
GO
USE [master]
GO
ALTER DATABASE [QuanLyNhaSach] SET  READ_WRITE 
GO
