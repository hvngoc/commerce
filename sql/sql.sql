USE [master]
GO
/****** Object:  Database [Shoping]    Script Date: 28/06/2015 10:41:57 AM ******/
CREATE DATABASE [Shoping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shoping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Shoping.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Shoping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Shoping_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Shoping] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shoping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shoping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shoping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shoping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shoping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shoping] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shoping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shoping] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Shoping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shoping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shoping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shoping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shoping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shoping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shoping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shoping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shoping] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Shoping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shoping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shoping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shoping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shoping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shoping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shoping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shoping] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Shoping] SET  MULTI_USER 
GO
ALTER DATABASE [Shoping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shoping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shoping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shoping] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Shoping]
GO
/****** Object:  StoredProcedure [dbo].[addTaiKhoan]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[addTaiKhoan] @TaiKhoan nvarchar(50), @MatKhau nvarchar(50),
@Email nvarchar(50), @LastName nvarchar(50), @FirstName nvarchar(50), @Loai int 
as
insert into TaiKhoan values (@TaiKhoan, @MatKhau, @Email, @LastName, @FirstName, @Loai)

GO
/****** Object:  StoredProcedure [dbo].[deleteFromSanPhamCatalog]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteFromSanPhamCatalog] @catalogID nchar(10), @sanPhamID nchar(10)
as
delete from SanPhamCatalog
where SanPhamID = @sanPhamID and CatalogID = @catalogID

GO
/****** Object:  StoredProcedure [dbo].[getAllCatalog]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllCatalog]
as
Select * from Catalog

GO
/****** Object:  StoredProcedure [dbo].[getAllHinhAnhSuKien]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllHinhAnhSuKien]
as
SELECT * FROM HinhAnhSuKien
GO
/****** Object:  StoredProcedure [dbo].[getALLSanPhamTheoCatalogID]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getALLSanPhamTheoCatalogID] @catalogID nchar(10)
as
SELECT s.SanPhamID, s.TenSanPham, s.MoTa, s.HinhAnh, s.GiaCu, s.GiaMoi
FROM SanPham s, SanPhamCatalog c
where c.CatalogID = @catalogID  and s.SanPhamID = c.SanPhamID

GO
/****** Object:  StoredProcedure [dbo].[getDichVuHinhAnh]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getDichVuHinhAnh] @IdInf nvarchar(50)
as
select DichVuHinhAnh from DichVu where DichVuID = @IdInf

GO
/****** Object:  StoredProcedure [dbo].[getGiaMoitheoID]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getGiaMoitheoID] @sanpham nchar(10)
as
select GiaMoi from SanPham where SanPhamID = @sanpham

GO
/****** Object:  StoredProcedure [dbo].[getHinhAnhBoSungTheoSanPhamID]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getHinhAnhBoSungTheoSanPhamID] @sanpham nchar(10)
as
select h.HinhAnhBoSung from HinhAnhBoSung h where h.SanPhamID = @sanpham

GO
/****** Object:  StoredProcedure [dbo].[getListGiaoDichTheoTaiKhoan]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getListGiaoDichTheoTaiKhoan] @taikhoan nvarchar(50)
as
select HoaDonID, SoLuong, TongTien from GiaoDich where TaiKhoanID = @taikhoan

GO
/****** Object:  StoredProcedure [dbo].[getListViewModelSanPham]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getListViewModelSanPham] @catalogID nchar(10)
as
select distinct s.SanPhamID, c.CatalogName, s.TenSanPham, s.MoTa, s.GiaMoi, tt.LuotMua
from Catalog c, SanPhamCatalog sc, SanPham s, ThongTinBoSung tt
where sc.CatalogID = @catalogID and sc.CatalogID = c.CatalogID and 
	s.SanPhamID = sc.SanPhamID and s.SanPhamID = tt.SanPhamID

GO
/****** Object:  StoredProcedure [dbo].[getMatKhaufromTKvaEmail]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getMatKhaufromTKvaEmail] @taikhoan nvarchar(50), @email nvarchar(50)
as
select MatKhau from TaiKhoan where TaiKhoan = @taikhoan and Email = @email

GO
/****** Object:  StoredProcedure [dbo].[getSanPhamTheoID]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getSanPhamTheoID] @sanpham nchar(10)
as
select SanPhamID, TenSanPham, MoTa, GiaMoi from SanPham where SanPhamID = @sanpham

GO
/****** Object:  StoredProcedure [dbo].[getTaiKhoantuID]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTaiKhoantuID] @taikhoan nvarchar(50)
as
select * from TaiKhoan where TaiKhoan = @taikhoan

GO
/****** Object:  StoredProcedure [dbo].[getThongTinBoSungTheoSanPhamID]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[getThongTinBoSungTheoSanPhamID] @sanpham nchar(10)
as
select s.TenSanPham, s.MoTa, t.SoSao, t.DanhGia, t.LuotMua, t.LuotXem, t.KieuDang, t.TonKho, s.GiaMoi 
from SanPham s, ThongTinBoSung t 
where s.SanPhamID = @sanpham and t.SanPhamID = @sanpham

GO
/****** Object:  StoredProcedure [dbo].[getTongHoaDonDaBan]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTongHoaDonDaBan]
as
select count (Distinct HoaDonID) as TongTaiKhoanDaMua from GiaoDich

GO
/****** Object:  StoredProcedure [dbo].[getTongNguoiDaMua]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTongNguoiDaMua]
as
select count (Distinct TaiKhoanID) as TongTaiKhoanDaMua from GiaoDich

GO
/****** Object:  StoredProcedure [dbo].[getTongSanPhamDaBan]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTongSanPhamDaBan]
as
select count (distinct SanPhamID) as SumSanPham from HoaDon

GO
/****** Object:  StoredProcedure [dbo].[getTongSoLuongDaBan]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTongSoLuongDaBan]
as
select sum (SoLuong) as TongTaiKhoanDaMua from GiaoDich

GO
/****** Object:  StoredProcedure [dbo].[getTongTienThuDuoc]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTongTienThuDuoc]
as
select sum (TongTien) as TongTaiKhoanDaMua from GiaoDich

GO
/****** Object:  StoredProcedure [dbo].[getTop10SanPhamLienQuanTheoSanPhamID]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTop10SanPhamLienQuanTheoSanPhamID] @sanpham nchar(10)
as
select distinct top 10 s.SanPhamID, s.TenSanPham, s.HinhAnh, s.GiaMoi 
from SanPhamCatalog c, SanPhamCatalog c2, SanPham s 
where c.SanPhamID = @sanpham and c.CatalogID = c2.CatalogID and c2.SanPhamID = s.SanPhamID

GO
/****** Object:  StoredProcedure [dbo].[getTop10YKienDongGop]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTop10YKienDongGop]
as
select top 10 * from GopYNguoiDung order by DateNow desc

GO
/****** Object:  StoredProcedure [dbo].[getTop4SanPhamTheoCatalogID]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTop4SanPhamTheoCatalogID] @catalogID nchar(10)
as
SELECT top 4 s.SanPhamID, s.TenSanPham, s.MoTa, s.HinhAnh, s.GiaCu, s.GiaMoi
FROM SanPham s, SanPhamCatalog c
where c.CatalogID = @catalogID  and s.SanPhamID = c.SanPhamID

GO
/****** Object:  StoredProcedure [dbo].[getTop8SanPhamBanChay]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTop8SanPhamBanChay]
as
select top 8 s.SanPhamID ,s.TenSanPham, s.HinhAnh 
from SanPham s, ThongTinBoSung t
where t.SanPhamID = s.SanPhamID
order by t.LuotMua desc

GO
/****** Object:  StoredProcedure [dbo].[insertGiaoDich]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertGiaoDich] @hoadon nvarchar(50), @taikhoan nvarchar(50), @soluong int, @tongtien int
as
insert into GiaoDich values (@hoadon, @taikhoan, @soluong, @tongtien)

GO
/****** Object:  StoredProcedure [dbo].[insertGopY]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[insertGopY] @DateNow nvarchar(50), @TaiKhoanID nvarchar(50), @NoiDung nvarchar(50)
as
insert into GopYNguoiDung values (@DateNow, @TaiKhoanID, @NoiDung)

GO
/****** Object:  StoredProcedure [dbo].[insertHoaDon]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertHoaDon] @hoadon nvarchar(50), @sanpham nchar(10), @soluong int
as
insert into HoaDon values( @hoadon, @sanpham, @soluong)

GO
/****** Object:  StoredProcedure [dbo].[isDangNhapThanhCong]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[isDangNhapThanhCong] @taikhoan nvarchar(50), @matkhau nvarchar(50)
as
select * from TaiKhoan where TaiKhoan = @taikhoan and MatKhau = @matkhau

GO
/****** Object:  StoredProcedure [dbo].[isEmailHopLe]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[isEmailHopLe] @email nvarchar(50)
as
select TaiKhoan from  TaiKhoan where Email = @email

GO
/****** Object:  StoredProcedure [dbo].[isTaiKhoanHopLe]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[isTaiKhoanHopLe] @taikhoan nvarchar(50)
as
select TaiKhoan from TaiKhoan where TaiKhoan = @taikhoan

GO
/****** Object:  StoredProcedure [dbo].[setLuotMuaAdd1]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[setLuotMuaAdd1] @sanphamID nchar(10)
  as
  update ThongTinBoSung
  set LuotMua = LuotMua + 1
  where SanPhamID = @sanphamID
GO
/****** Object:  StoredProcedure [dbo].[setLuotXemAdd1]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  create proc [dbo].[setLuotXemAdd1] @sanphamID nchar(10)
  as
  update ThongTinBoSung
  set LuotXem = LuotXem + 1
  where SanPhamID = @sanphamID

GO
/****** Object:  StoredProcedure [dbo].[UpdateMatKhau]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateMatKhau] @taikhoan nvarchar(50), @matkhau nvarchar(50)
as
update TaiKhoan set MatKhau = @matkhau where TaiKhoan = @taikhoan

GO
/****** Object:  StoredProcedure [dbo].[UpdateTaiKhoan]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateTaiKhoan] @taikhoan nvarchar(50), @first nvarchar(50), @last nvarchar(50)
as
update TaiKhoan set LastName = @last, FirstName = @first where TaiKhoan = @taikhoan

GO
/****** Object:  StoredProcedure [dbo].[XoaTaiKhoan]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaTaiKhoan] @taikhoan nvarchar(50)
as
delete from TaiKhoan where TaiKhoan = @taikhoan

GO
/****** Object:  Table [dbo].[Catalog]    Script Date: 28/06/2015 10:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog](
	[CatalogID] [nchar](10) NOT NULL,
	[CatalogName] [nvarchar](50) NULL,
 CONSTRAINT [PK_CatalogSanPham] PRIMARY KEY CLUSTERED 
(
	[CatalogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 28/06/2015 10:41:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[DichVuID] [nvarchar](50) NOT NULL,
	[DichVuHinhAnh] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiaoDich]    Script Date: 28/06/2015 10:41:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoDich](
	[HoaDonID] [nvarchar](50) NULL,
	[TaiKhoanID] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[TongTien] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GopYNguoiDung]    Script Date: 28/06/2015 10:41:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GopYNguoiDung](
	[DateNow] [nvarchar](50) NULL,
	[TaiKhoanID] [nvarchar](50) NULL,
	[NoiDung] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HinhAnhBoSung]    Script Date: 28/06/2015 10:41:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhAnhBoSung](
	[SanPhamID] [nchar](10) NULL,
	[HinhAnhBoSung] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HinhAnhSuKien]    Script Date: 28/06/2015 10:41:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhAnhSuKien](
	[HinhAnhSuKien] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 28/06/2015 10:41:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[HoaDonID] [nvarchar](50) NOT NULL,
	[SanPhamID] [nchar](10) NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[HoaDonID] ASC,
	[SanPhamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 28/06/2015 10:41:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[SanPhamID] [nchar](10) NOT NULL,
	[TenSanPham] [nvarchar](50) NULL,
	[MoTa] [nvarchar](500) NULL,
	[HinhAnh] [nvarchar](50) NULL,
	[GiaCu] [int] NULL,
	[GiaMoi] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SanPhamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPhamCatalog]    Script Date: 28/06/2015 10:41:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPhamCatalog](
	[CatalogID] [nchar](10) NOT NULL,
	[SanPhamID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_SanPhamCatalog] PRIMARY KEY CLUSTERED 
(
	[CatalogID] ASC,
	[SanPhamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 28/06/2015 10:41:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TaiKhoan] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[Loai] [int] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongTinBoSung]    Script Date: 28/06/2015 10:41:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinBoSung](
	[SanPhamID] [nchar](10) NOT NULL,
	[SoSao] [int] NULL,
	[DanhGia] [nvarchar](50) NULL,
	[LuotMua] [int] NULL,
	[LuotXem] [int] NULL,
	[KieuDang] [nvarchar](50) NULL,
	[TonKho] [int] NULL,
 CONSTRAINT [PK_ThongTinBoSung] PRIMARY KEY CLUSTERED 
(
	[SanPhamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Catalog] ([CatalogID], [CatalogName]) VALUES (N'Ao        ', N'Áo')
INSERT [dbo].[Catalog] ([CatalogID], [CatalogName]) VALUES (N'Dep       ', N'Dép')
INSERT [dbo].[Catalog] ([CatalogID], [CatalogName]) VALUES (N'Giay      ', N'Giày')
INSERT [dbo].[Catalog] ([CatalogID], [CatalogName]) VALUES (N'KhuyenMai ', N'Khuyến Mãi')
INSERT [dbo].[Catalog] ([CatalogID], [CatalogName]) VALUES (N'MoiNhat   ', N'Mới Nhất')
INSERT [dbo].[Catalog] ([CatalogID], [CatalogName]) VALUES (N'Nam       ', N'Nam')
INSERT [dbo].[Catalog] ([CatalogID], [CatalogName]) VALUES (N'Non       ', N'Nón')
INSERT [dbo].[Catalog] ([CatalogID], [CatalogName]) VALUES (N'NoStyle   ', N'No Style')
INSERT [dbo].[Catalog] ([CatalogID], [CatalogName]) VALUES (N'Nu        ', N'Nữ')
INSERT [dbo].[Catalog] ([CatalogID], [CatalogName]) VALUES (N'OutLet    ', N'OutLet')
INSERT [dbo].[Catalog] ([CatalogID], [CatalogName]) VALUES (N'Quan      ', N'Quần')
INSERT [dbo].[Catalog] ([CatalogID], [CatalogName]) VALUES (N'Vay       ', N'Váy')
INSERT [dbo].[DichVu] ([DichVuID], [DichVuHinhAnh]) VALUES (N'TuyenDung', N'Tuyendung.png')
INSERT [dbo].[DichVu] ([DichVuID], [DichVuHinhAnh]) VALUES (N'DatHang', N'dathang.png')
INSERT [dbo].[DichVu] ([DichVuID], [DichVuHinhAnh]) VALUES (N'VanChuyen', N'vanchuyen.png')
INSERT [dbo].[DichVu] ([DichVuID], [DichVuHinhAnh]) VALUES (N'DoiTra', N'doitra.png')
INSERT [dbo].[DichVu] ([DichVuID], [DichVuHinhAnh]) VALUES (N'DoiTra', N'doitra2.png')
INSERT [dbo].[DichVu] ([DichVuID], [DichVuHinhAnh]) VALUES (N'BaoHanh', N'baohanh.png')
INSERT [dbo].[DichVu] ([DichVuID], [DichVuHinhAnh]) VALUES (N'KhachVip', N'khachvip.png')
INSERT [dbo].[GiaoDich] ([HoaDonID], [TaiKhoanID], [SoLuong], [TongTien]) VALUES (N'23/06/2015 15:16:57.981', N'ngoc', 4, 2060)
INSERT [dbo].[GiaoDich] ([HoaDonID], [TaiKhoanID], [SoLuong], [TongTien]) VALUES (N'23/06/2015 16:47:42.911', N'admin', 3, 1600)
INSERT [dbo].[GiaoDich] ([HoaDonID], [TaiKhoanID], [SoLuong], [TongTien]) VALUES (N'23/06/2015 22:32:15.733', N'ngoc', 2, 160)
INSERT [dbo].[GiaoDich] ([HoaDonID], [TaiKhoanID], [SoLuong], [TongTien]) VALUES (N'24/06/2015 14:57:53.164', N'admin', 2, 460)
INSERT [dbo].[GiaoDich] ([HoaDonID], [TaiKhoanID], [SoLuong], [TongTien]) VALUES (N'28/06/2015 09:18:24.215', N'buoi', 9, 1060)
INSERT [dbo].[GopYNguoiDung] ([DateNow], [TaiKhoanID], [NoiDung]) VALUES (N'12/12/2014', N'admin', N'Tuy?t V?i')
INSERT [dbo].[GopYNguoiDung] ([DateNow], [TaiKhoanID], [NoiDung]) VALUES (N'25/06/2015', N'ngoc', N'đóng cái nồi')
INSERT [dbo].[GopYNguoiDung] ([DateNow], [TaiKhoanID], [NoiDung]) VALUES (N'25/06/2015', N'admin', N'không thể tin được')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao1       ', N'Ao1_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao1       ', N'Ao1_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao1       ', N'Ao1_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao1       ', N'Ao1_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao2       ', N'Ao2_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao2       ', N'Ao2_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao2       ', N'Ao2_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao2       ', N'Ao2_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao2       ', N'Ao2_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao2       ', N'Ao2_6.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao3       ', N'Ao3_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao3       ', N'Ao3_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao3       ', N'Ao3_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao3       ', N'Ao3_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao3       ', N'Ao3_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay1     ', N'Giay1_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay1     ', N'Giay1_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep1      ', N'Dep1_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep2      ', N'Dep2_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep3      ', N'Dep3_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep4      ', N'Dep4_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay1     ', N'Giay1_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay1     ', N'Giay1_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay2     ', N'Giay2_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay2     ', N'Giay2_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay2     ', N'Giay2_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay2     ', N'Giay2_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay3     ', N'Giay3_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay3     ', N'Giay3_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non1      ', N'Non1_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay3     ', N'Giay3_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay3     ', N'Giay3_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay3     ', N'Giay3_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non1      ', N'Non1_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non1      ', N'Non1_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non2      ', N'Non2_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non2      ', N'Non2_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non2      ', N'Non2_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non3      ', N'Non3_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non3      ', N'Non3_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non3      ', N'Non3_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan1     ', N'Quan1_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan1     ', N'Quan1_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan1     ', N'Quan1_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan1     ', N'Quan1_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan2     ', N'Quan2_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan2     ', N'Quan2_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan2     ', N'Quan2_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan2     ', N'Quan2_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan3     ', N'Quan3_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan3     ', N'Quan3_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan3     ', N'Quan3_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep1      ', N'Dep1_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep1      ', N'Dep1_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep2      ', N'Dep2_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep2      ', N'Dep2_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep3      ', N'Dep3_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep3      ', N'Dep3_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep3      ', N'Dep3_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep4      ', N'Dep4_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep4      ', N'Dep4_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay1      ', N'Vay1_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay1      ', N'Vay1_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay1      ', N'Vay1_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay1      ', N'Vay1_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay1      ', N'Vay1_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay2      ', N'Vay2_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay2      ', N'Vay2_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay2      ', N'Vay2_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay2      ', N'Vay2_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay3      ', N'Vay3_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay3      ', N'Vay3_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay3      ', N'Vay3_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay3      ', N'Vay3_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay3      ', N'Vay3_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay4      ', N'Vay4_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay4      ', N'Vay4_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay4      ', N'Vay4_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay4      ', N'Vay4_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay4      ', N'Vay4_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay5      ', N'Vay5_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay5      ', N'Vay5_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay5      ', N'Vay5_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay5      ', N'Vay5_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay5      ', N'Vay5_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay6      ', N'Vay6_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay6      ', N'Vay6_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay6      ', N'Vay6_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay6      ', N'Vay6_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay7      ', N'Vay7_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay7      ', N'Vay7_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay7      ', N'Vay7_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay7      ', N'Vay7_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay7      ', N'Vay7_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay8      ', N'Vay8_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay8      ', N'Vay8_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay8      ', N'Vay8_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay8      ', N'Vay8_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay9      ', N'Vay9_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay9      ', N'Vay9_2.jpg')
GO
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay9      ', N'Vay9_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay9      ', N'Vay9_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay10     ', N'Vay10_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay10     ', N'Vay10_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay10     ', N'Vay10_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay10     ', N'Vay10_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay10     ', N'Vay10_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay11     ', N'Vay11_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay11     ', N'Vay11_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay11     ', N'Vay11_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay11     ', N'Vay11_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay12     ', N'Vay12_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay12     ', N'Vay12_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay12     ', N'Vay12_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay12     ', N'Vay12_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay13     ', N'Vay13_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay13     ', N'Vay13_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay13     ', N'Vay13_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay13     ', N'Vay13_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay13     ', N'Vay13_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay14     ', N'Vay14_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay14     ', N'Vay14_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay14     ', N'Vay14_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay14     ', N'Vay14_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay15     ', N'Vay15_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay15     ', N'Vay15_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay15     ', N'Vay15_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay15     ', N'Vay15_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay15     ', N'Vay15_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay16     ', N'Vay16_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay16     ', N'Vay16_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay16     ', N'Vay16_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay16     ', N'Vay16_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay16     ', N'Vay16_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay17     ', N'Vay17_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay17     ', N'Vay17_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay17     ', N'Vay17_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay17     ', N'Vay17_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay18     ', N'Vay18_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay18     ', N'Vay18_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay18     ', N'Vay18_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay18     ', N'Vay18_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay18     ', N'Vay18_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay19     ', N'Vay19_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay19     ', N'Vay19_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay19     ', N'Vay19_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay19     ', N'Vay19_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay19     ', N'Vay19_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay20     ', N'Vay20_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay20     ', N'Vay20_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay20     ', N'Vay20_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay20     ', N'Vay20_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay21     ', N'Vay21_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay21     ', N'Vay21_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay21     ', N'Vay21_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay21     ', N'Vay21_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay21     ', N'Vay21_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay22     ', N'Vay22_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay22     ', N'Vay22_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay22     ', N'Vay22_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay22     ', N'Vay22_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay22     ', N'Vay22_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay23     ', N'Vay23_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay23     ', N'Vay23_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay23     ', N'Vay23_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay23     ', N'Vay23_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay23     ', N'Vay23_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay24     ', N'Vay24_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay24     ', N'Vay24_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay24     ', N'Vay24_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay24     ', N'Vay24_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay24     ', N'Vay24_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay25     ', N'Vay25_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay25     ', N'Vay25_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay25     ', N'Vay25_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay25     ', N'Vay25_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay25     ', N'Vay25_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay26     ', N'Vay26_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay26     ', N'Vay26_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay26     ', N'Vay26_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay26     ', N'Vay26_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay26     ', N'Vay26_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay27     ', N'Vay27_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay27     ', N'Vay27_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay27     ', N'Vay27_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay27     ', N'Vay27_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay27     ', N'Vay27_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay28     ', N'Vay28_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay28     ', N'Vay28_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay28     ', N'Vay28_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay28     ', N'Vay28_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay28     ', N'Vay28_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay29     ', N'Vay29_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay29     ', N'Vay29_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay29     ', N'Vay29_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay29     ', N'Vay29_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay29     ', N'Vay29_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay30     ', N'Vay30_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay30     ', N'Vay30_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay30     ', N'Vay30_3.jpg')
GO
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay30     ', N'Vay30_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay31     ', N'Vay31_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay31     ', N'Vay31_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay31     ', N'Vay31_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay31     ', N'Vay31_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay31     ', N'Vay31_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay32     ', N'Vay32_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay32     ', N'Vay32_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay32     ', N'Vay32_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay32     ', N'Vay32_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay32     ', N'Vay32_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay33     ', N'Vay33_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay33     ', N'Vay33_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay33     ', N'Vay33_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay33     ', N'Vay33_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay33     ', N'Vay33_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay34     ', N'Vay34_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay34     ', N'Vay34_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay34     ', N'Vay34_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay34     ', N'Vay34_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay34     ', N'Vay34_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay35     ', N'Vay35_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay35     ', N'Vay35_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay35     ', N'Vay35_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay35     ', N'Vay35_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay35     ', N'Vay35_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay36     ', N'Vay36_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay36     ', N'Vay36_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay36     ', N'Vay36_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay36     ', N'Vay36_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay36     ', N'Vay36_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay37     ', N'Vay37_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay37     ', N'Vay37_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay37     ', N'Vay37_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay37     ', N'Vay37_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay37     ', N'Vay37_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay38     ', N'Vay38_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay38     ', N'Vay38_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay38     ', N'Vay38_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay38     ', N'Vay38_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay39     ', N'Vay39_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay39     ', N'Vay39_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay39     ', N'Vay39_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay39     ', N'Vay39_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay39     ', N'Vay39_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay40     ', N'Vay40_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay40     ', N'Vay40_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay40     ', N'Vay40_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay40     ', N'Vay40_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay40     ', N'Vay40_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay41     ', N'Vay41_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay41     ', N'Vay41_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay41     ', N'Vay41_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay41     ', N'Vay41_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay41     ', N'Vay41_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay42     ', N'Vay42_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay42     ', N'Vay42_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay42     ', N'Vay42_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay42     ', N'Vay42_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay42     ', N'Vay42_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay43     ', N'Vay43_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay43     ', N'Vay43_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay43     ', N'Vay43_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay43     ', N'Vay43_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay43     ', N'Vay43_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay44     ', N'Vay44_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay44     ', N'Vay44_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay44     ', N'Vay44_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay44     ', N'Vay44_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Vay44     ', N'Vay44_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao4       ', N'Ao4_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao4       ', N'Ao4_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao4       ', N'Ao4_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao33      ', N'Ao33_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao33      ', N'Ao33_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao33      ', N'Ao33_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao34      ', N'Ao34_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao34      ', N'Ao34_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao34      ', N'Ao34_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao34      ', N'Ao34_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao34      ', N'Ao34_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao35      ', N'Ao35_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao35      ', N'Ao35_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao35      ', N'Ao35_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao35      ', N'Ao35_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao5       ', N'Ao5_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao5       ', N'Ao5_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao5       ', N'Ao5_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao5       ', N'Ao5_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao5       ', N'Ao5_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao6       ', N'Ao6_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao6       ', N'Ao6_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao6       ', N'Ao6_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao6       ', N'Ao6_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao6       ', N'Ao6_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao7       ', N'Ao7_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao7       ', N'Ao7_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao7       ', N'Ao7_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao7       ', N'Ao7_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao7       ', N'Ao7_5.jpg')
GO
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao8       ', N'Ao8_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao8       ', N'Ao8_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao8       ', N'Ao8_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao8       ', N'Ao8_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao8       ', N'Ao8_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao9       ', N'Ao9_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao9       ', N'Ao9_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao9       ', N'Ao9_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao9       ', N'Ao9_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao9       ', N'Ao9_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao10      ', N'Ao10_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao10      ', N'Ao10_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao10      ', N'Ao10_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao13      ', N'Ao13_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao13      ', N'Ao13_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao13      ', N'Ao13_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao13      ', N'Ao13_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao13      ', N'Ao13_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao10      ', N'Ao10_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao10      ', N'Ao10_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao11      ', N'Ao11_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao11      ', N'Ao11_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao11      ', N'Ao11_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao11      ', N'Ao11_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao11      ', N'Ao11_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao12      ', N'Ao12_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao12      ', N'Ao12_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao12      ', N'Ao12_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao12      ', N'Ao12_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao12      ', N'Ao12_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao14      ', N'Ao14_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao14      ', N'Ao14_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao14      ', N'Ao14_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao14      ', N'Ao14_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao14      ', N'Ao14_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao15      ', N'Ao15_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao15      ', N'Ao15_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao15      ', N'Ao15_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao15      ', N'Ao15_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao15      ', N'Ao15_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao16      ', N'Ao16_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao16      ', N'Ao16_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao16      ', N'Ao16_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao16      ', N'Ao16_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao16      ', N'Ao16_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao17      ', N'Ao17_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao17      ', N'Ao17_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao17      ', N'Ao17_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao17      ', N'Ao17_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao17      ', N'Ao17_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao18      ', N'Ao18_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao18      ', N'Ao18_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao18      ', N'Ao18_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao18      ', N'Ao18_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao18      ', N'Ao18_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao19      ', N'Ao19_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao19      ', N'Ao19_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao19      ', N'Ao19_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao19      ', N'Ao19_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao19      ', N'Ao19_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao20      ', N'Ao20_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao20      ', N'Ao20_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao20      ', N'Ao20_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao20      ', N'Ao20_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao20      ', N'Ao20_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao21      ', N'Ao21_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao21      ', N'Ao21_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao21      ', N'Ao21_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao21      ', N'Ao21_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao21      ', N'Ao21_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao22      ', N'Ao22_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao22      ', N'Ao22_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao22      ', N'Ao22_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao22      ', N'Ao22_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao22      ', N'Ao22_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao23      ', N'Ao23_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao23      ', N'Ao23_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao23      ', N'Ao23_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao23      ', N'Ao23_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao23      ', N'Ao23_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao24      ', N'Ao24_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao24      ', N'Ao24_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao24      ', N'Ao24_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao24      ', N'Ao24_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao24      ', N'Ao24_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao25      ', N'Ao25_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao25      ', N'Ao25_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao25      ', N'Ao25_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao25      ', N'Ao25_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao25      ', N'Ao25_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao26      ', N'Ao26_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao26      ', N'Ao26_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao26      ', N'Ao26_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao26      ', N'Ao26_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao26      ', N'Ao26_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao27      ', N'Ao27_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao27      ', N'Ao27_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao27      ', N'Ao27_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao27      ', N'Ao27_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao27      ', N'Ao27_5.jpg')
GO
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao27      ', N'Ao27_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao27      ', N'Ao27_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao27      ', N'Ao27_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao27      ', N'Ao27_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao27      ', N'Ao27_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao28      ', N'Ao28_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao28      ', N'Ao28_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao28      ', N'Ao28_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao28      ', N'Ao28_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao28      ', N'Ao28_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao29      ', N'Ao29_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao29      ', N'Ao29_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao29      ', N'Ao29_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao29      ', N'Ao29_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao29      ', N'Ao29_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao30      ', N'Ao30_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao30      ', N'Ao30_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao30      ', N'Ao30_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao30      ', N'Ao30_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao30      ', N'Ao30_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao31      ', N'Ao31_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao31      ', N'Ao31_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao31      ', N'Ao31_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao31      ', N'Ao31_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao31      ', N'Ao31_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao32      ', N'Ao32_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao32      ', N'Ao32_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao32      ', N'Ao32_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao32      ', N'Ao32_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao32      ', N'Ao32_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao33      ', N'Ao33_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao33      ', N'Ao33_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao35      ', N'Ao35_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao36      ', N'Ao36_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao36      ', N'Ao36_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao36      ', N'Ao36_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao36      ', N'Ao36_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao36      ', N'Ao36_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao37      ', N'Ao37_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao37      ', N'Ao37_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao37      ', N'Ao37_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao37      ', N'Ao37_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao37      ', N'Ao37_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao38      ', N'Ao38_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao38      ', N'Ao38_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao38      ', N'Ao38_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao38      ', N'Ao38_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao38      ', N'Ao38_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao39      ', N'Ao39_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao39      ', N'Ao39_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao39      ', N'Ao39_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao39      ', N'Ao39_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao39      ', N'Ao39_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao40      ', N'Ao40_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao40      ', N'Ao40_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao40      ', N'Ao40_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao40      ', N'Ao40_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao40      ', N'Ao40_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao41      ', N'Ao41_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao41      ', N'Ao41_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao41      ', N'Ao41_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao41      ', N'Ao41_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Ao41      ', N'Ao41_5.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep5      ', N'Dep5_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep5      ', N'Dep5_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep5      ', N'Dep5_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep5      ', N'Dep5_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep6      ', N'Dep6_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep6      ', N'Dep6_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep6      ', N'Dep6_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep6      ', N'Dep6_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep7      ', N'Dep7_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep7      ', N'Dep7_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep7      ', N'Dep7_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep7      ', N'Dep7_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep8      ', N'Dep8_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep8      ', N'Dep8_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep8      ', N'Dep8_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep8      ', N'Dep8_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep9      ', N'Dep9_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep9      ', N'Dep9_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep9      ', N'Dep9_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep10     ', N'Dep10_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep10     ', N'Dep10_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep10     ', N'Dep10_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep10     ', N'Dep10_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep11     ', N'Dep11_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep11     ', N'Dep11_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep11     ', N'Dep11_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep12     ', N'Dep12_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep12     ', N'Dep12_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep12     ', N'Dep12_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep13     ', N'Dep13_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep13     ', N'Dep13_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep13     ', N'Dep13_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep13     ', N'Dep13_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep14     ', N'Dep14_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep14     ', N'Dep14_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep14     ', N'Dep14_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep14     ', N'Dep14_4.jpg')
GO
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep15     ', N'Dep15_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep15     ', N'Dep15_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep15     ', N'Dep15_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep15     ', N'Dep15_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep16     ', N'Dep16_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep16     ', N'Dep16_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep16     ', N'Dep16_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep16     ', N'Dep16_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep17     ', N'Dep17_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep17     ', N'Dep17_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep17     ', N'Dep17_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep17     ', N'Dep17_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep18     ', N'Dep18_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep18     ', N'Dep18_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep18     ', N'Dep18_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep18     ', N'Dep18_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep19     ', N'Dep19_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep19     ', N'Dep19_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep19     ', N'Dep19_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep19     ', N'Dep19_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep20     ', N'Dep20_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep20     ', N'Dep20_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep20     ', N'Dep20_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep20     ', N'Dep20_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep21     ', N'Dep21_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep21     ', N'Dep21_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep21     ', N'Dep21_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep21     ', N'Dep21_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep22     ', N'Dep22_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep22     ', N'Dep22_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep22     ', N'Dep22_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep22     ', N'Dep22_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep23     ', N'Dep23_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep23     ', N'Dep23_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep23     ', N'Dep23_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep23     ', N'Dep23_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep24     ', N'Dep24_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep24     ', N'Dep24_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep24     ', N'Dep24_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep24     ', N'Dep24_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep25     ', N'Dep25_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep25     ', N'Dep25_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep25     ', N'Dep25_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep25     ', N'Dep25_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep26     ', N'Dep26_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep26     ', N'Dep26_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep26     ', N'Dep26_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep26     ', N'Dep26_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep27     ', N'Dep27_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep27     ', N'Dep27_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep27     ', N'Dep27_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep27     ', N'Dep27_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep28     ', N'Dep28_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep28     ', N'Dep28_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep28     ', N'Dep28_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Dep28     ', N'Dep28_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay4     ', N'Giay4_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay4     ', N'Giay4_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay4     ', N'Giay4_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay4     ', N'Giay4_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non8      ', N'Non8_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non9      ', N'Non9_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non9      ', N'Non9_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non9      ', N'Non9_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non10     ', N'Non10_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non10     ', N'Non10_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non11     ', N'Non11_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non11     ', N'Non11_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non11     ', N'Non11_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non12     ', N'Non12_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non12     ', N'Non12_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non12     ', N'Non12_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non13     ', N'Non13_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non13     ', N'Non13_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay5     ', N'Giay5_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay5     ', N'Giay5_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay5     ', N'Giay5_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay5     ', N'Giay5_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay6     ', N'Giay6_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay6     ', N'Giay6_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay6     ', N'Giay6_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay6     ', N'Giay6_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay7     ', N'Giay7_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay7     ', N'Giay7_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay7     ', N'Giay7_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay7     ', N'Giay7_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay8     ', N'Giay8_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay8     ', N'Giay8_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay8     ', N'Giay8_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay8     ', N'Giay8_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay9     ', N'Giay9_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay9     ', N'Giay9_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay9     ', N'Giay9_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay9     ', N'Giay9_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay10    ', N'Giay10_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay10    ', N'Giay10_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay10    ', N'Giay10_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay10    ', N'Giay10_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay11    ', N'Giay11_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay11    ', N'Giay11_2.jpg')
GO
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay11    ', N'Giay11_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay11    ', N'Giay11_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay12    ', N'Giay12_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay12    ', N'Giay12_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay12    ', N'Giay12_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay12    ', N'Giay12_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay13    ', N'Giay13_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay13    ', N'Giay13_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay13    ', N'Giay13_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay13    ', N'Giay13_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay14    ', N'Giay14_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay14    ', N'Giay14_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay14    ', N'Giay14_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay14    ', N'Giay14_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay15    ', N'Giay15_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay15    ', N'Giay15_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay15    ', N'Giay15_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay15    ', N'Giay15_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay16    ', N'Giay16_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay16    ', N'Giay16_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay16    ', N'Giay16_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay16    ', N'Giay16_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay17    ', N'Giay17_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay17    ', N'Giay17_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay17    ', N'Giay17_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay17    ', N'Giay17_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay18    ', N'Giay18_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay18    ', N'Giay18_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay18    ', N'Giay18_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay18    ', N'Giay18_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay19    ', N'Giay19_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay19    ', N'Giay19_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay19    ', N'Giay19_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay19    ', N'Giay19_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay20    ', N'Giay20_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay20    ', N'Giay20_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay20    ', N'Giay20_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay20    ', N'Giay20_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay21    ', N'Giay21_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay21    ', N'Giay21_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay21    ', N'Giay21_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay21    ', N'Giay21_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay22    ', N'Giay22_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay22    ', N'Giay22_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay22    ', N'Giay22_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay22    ', N'Giay22_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay23    ', N'Giay23_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay23    ', N'Giay23_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay23    ', N'Giay23_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay23    ', N'Giay23_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay24    ', N'Giay24_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay24    ', N'Giay24_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay24    ', N'Giay24_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay24    ', N'Giay24_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay25    ', N'Giay25_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay25    ', N'Giay25_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay25    ', N'Giay25_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay25    ', N'Giay25_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay26    ', N'Giay26_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay26    ', N'Giay26_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay26    ', N'Giay26_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay26    ', N'Giay26_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay27    ', N'Giay27_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay27    ', N'Giay27_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay27    ', N'Giay27_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay27    ', N'Giay27_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay28    ', N'Giay28_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay28    ', N'Giay28_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay28    ', N'Giay28_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay28    ', N'Giay28_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay29    ', N'Giay29_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay29    ', N'Giay29_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay29    ', N'Giay29_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay29    ', N'Giay29_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay30    ', N'Giay30_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay30    ', N'Giay30_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay30    ', N'Giay30_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay30    ', N'Giay30_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay31    ', N'Giay31_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay31    ', N'Giay31_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay31    ', N'Giay31_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay31    ', N'Giay31_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay32    ', N'Giay32_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay32    ', N'Giay32_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay32    ', N'Giay32_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay32    ', N'Giay32_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay33    ', N'Giay33_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay33    ', N'Giay33_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay33    ', N'Giay33_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay33    ', N'Giay33_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay34    ', N'Giay34_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay34    ', N'Giay34_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay34    ', N'Giay34_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Giay34    ', N'Giay34_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non4      ', N'Non4_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non4      ', N'Non4_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non4      ', N'Non4_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non4      ', N'Non4_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non5      ', N'Non5_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non5      ', N'Non5_2.jpg')
GO
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non5      ', N'Non5_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non5      ', N'Non5_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non6      ', N'Non6_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non6      ', N'Non6_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non6      ', N'Non6_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non6      ', N'Non6_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non7      ', N'Non7_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non7      ', N'Non7_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non7      ', N'Non7_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non8      ', N'Non8_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non8      ', N'Non8_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non13     ', N'Non13_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non14     ', N'Non14_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non14     ', N'Non14_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non14     ', N'Non14_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non14     ', N'Non14_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non15     ', N'Non15_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non15     ', N'Non15_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non15     ', N'Non15_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non15     ', N'Non15_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non16     ', N'Non16_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non16     ', N'Non16_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non16     ', N'Non16_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non16     ', N'Non16_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non17     ', N'Non17_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non17     ', N'Non17_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non17     ', N'Non17_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non17     ', N'Non17_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non18     ', N'Non18_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non18     ', N'Non18_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non18     ', N'Non18_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non18     ', N'Non18_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non19     ', N'Non19_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non19     ', N'Non19_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non19     ', N'Non19_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non20     ', N'Non20_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non20     ', N'Non20_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non20     ', N'Non20_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Non20     ', N'Non20_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan4     ', N'Quan4_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan4     ', N'Quan4_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan4     ', N'Quan4_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan4     ', N'Quan4_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan5     ', N'Quan5_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan5     ', N'Quan5_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan5     ', N'Quan5_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan5     ', N'Quan5_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan6     ', N'Quan6_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan6     ', N'Quan6_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan6     ', N'Quan6_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan6     ', N'Quan6_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan7     ', N'Quan7_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan7     ', N'Quan7_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan7     ', N'Quan7_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan7     ', N'Quan7_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan8     ', N'Quan8_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan8     ', N'Quan8_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan8     ', N'Quan8_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan8     ', N'Quan8_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan9     ', N'Quan9_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan9     ', N'Quan9_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan9     ', N'Quan9_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan9     ', N'Quan9_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan10    ', N'Quan10_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan10    ', N'Quan10_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan10    ', N'Quan10_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan10    ', N'Quan10_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan11    ', N'Quan11_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan11    ', N'Quan11_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan11    ', N'Quan11_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan11    ', N'Quan11_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan12    ', N'Quan12_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan12    ', N'Quan12_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan12    ', N'Quan12_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan12    ', N'Quan12_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan13    ', N'Quan13_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan13    ', N'Quan13_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan13    ', N'Quan13_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan13    ', N'Quan13_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan14    ', N'Quan14_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan14    ', N'Quan14_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan14    ', N'Quan14_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan14    ', N'Quan14_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan15    ', N'Quan15_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan15    ', N'Quan15_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan15    ', N'Quan15_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan15    ', N'Quan15_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan16    ', N'Quan16_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan16    ', N'Quan16_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan16    ', N'Quan16_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan16    ', N'Quan16_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan17    ', N'Quan17_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan17    ', N'Quan17_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan17    ', N'Quan17_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan17    ', N'Quan17_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan18    ', N'Quan18_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan18    ', N'Quan18_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan18    ', N'Quan18_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan18    ', N'Quan18_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan19    ', N'Quan19_1.jpg')
GO
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan19    ', N'Quan19_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan19    ', N'Quan19_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan19    ', N'Quan19_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan20    ', N'Quan20_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan20    ', N'Quan20_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan20    ', N'Quan20_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan20    ', N'Quan20_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan21    ', N'Quan21_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan21    ', N'Quan21_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan21    ', N'Quan21_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan21    ', N'Quan21_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan22    ', N'Quan22_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan22    ', N'Quan22_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan22    ', N'Quan22_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan22    ', N'Quan22_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan23    ', N'Quan23_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan23    ', N'Quan23_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan23    ', N'Quan23_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan23    ', N'Quan23_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan24    ', N'Quan24_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan24    ', N'Quan24_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan24    ', N'Quan24_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan24    ', N'Quan24_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan25    ', N'Quan25_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan25    ', N'Quan25_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan25    ', N'Quan25_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan25    ', N'Quan25_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan26    ', N'Quan26_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan26    ', N'Quan26_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan26    ', N'Quan26_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan26    ', N'Quan26_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan27    ', N'Quan27_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan27    ', N'Quan27_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan27    ', N'Quan27_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan27    ', N'Quan27_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan28    ', N'Quan28_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan28    ', N'Quan28_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan28    ', N'Quan28_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan28    ', N'Quan28_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan29    ', N'Quan29_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan29    ', N'Quan29_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan29    ', N'Quan29_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan29    ', N'Quan29_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan30    ', N'Quan30_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan30    ', N'Quan30_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan30    ', N'Quan30_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan30    ', N'Quan30_4.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan31    ', N'Quan31_1.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan31    ', N'Quan31_2.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan31    ', N'Quan31_3.jpg')
INSERT [dbo].[HinhAnhBoSung] ([SanPhamID], [HinhAnhBoSung]) VALUES (N'Quan31    ', N'Quan31_4.jpg')
INSERT [dbo].[HinhAnhSuKien] ([HinhAnhSuKien]) VALUES (N'sukien1.jpg')
INSERT [dbo].[HinhAnhSuKien] ([HinhAnhSuKien]) VALUES (N'sukien2.jpg')
INSERT [dbo].[HinhAnhSuKien] ([HinhAnhSuKien]) VALUES (N'sukien3.jpg')
INSERT [dbo].[HinhAnhSuKien] ([HinhAnhSuKien]) VALUES (N'sukien4.jpg')
INSERT [dbo].[HinhAnhSuKien] ([HinhAnhSuKien]) VALUES (N'sukien5.jpg')
INSERT [dbo].[HoaDon] ([HoaDonID], [SanPhamID], [SoLuong]) VALUES (N'23/06/2015 15:16:57.981', N'Ao10      ', 1)
INSERT [dbo].[HoaDon] ([HoaDonID], [SanPhamID], [SoLuong]) VALUES (N'23/06/2015 15:16:57.981', N'Ao11      ', 2)
INSERT [dbo].[HoaDon] ([HoaDonID], [SanPhamID], [SoLuong]) VALUES (N'23/06/2015 15:16:57.981', N'Ao12      ', 1)
INSERT [dbo].[HoaDon] ([HoaDonID], [SanPhamID], [SoLuong]) VALUES (N'23/06/2015 16:47:42.911', N'Ao11      ', 1)
INSERT [dbo].[HoaDon] ([HoaDonID], [SanPhamID], [SoLuong]) VALUES (N'23/06/2015 16:47:42.911', N'Ao37      ', 1)
INSERT [dbo].[HoaDon] ([HoaDonID], [SanPhamID], [SoLuong]) VALUES (N'23/06/2015 16:47:42.911', N'Ao38      ', 1)
INSERT [dbo].[HoaDon] ([HoaDonID], [SanPhamID], [SoLuong]) VALUES (N'23/06/2015 22:32:15.733', N'Ao10      ', 2)
INSERT [dbo].[HoaDon] ([HoaDonID], [SanPhamID], [SoLuong]) VALUES (N'24/06/2015 14:57:53.164', N'Ao22      ', 1)
INSERT [dbo].[HoaDon] ([HoaDonID], [SanPhamID], [SoLuong]) VALUES (N'24/06/2015 14:57:53.164', N'Ao23      ', 1)
INSERT [dbo].[HoaDon] ([HoaDonID], [SanPhamID], [SoLuong]) VALUES (N'28/06/2015 09:18:24.215', N'Ao1       ', 2)
INSERT [dbo].[HoaDon] ([HoaDonID], [SanPhamID], [SoLuong]) VALUES (N'28/06/2015 09:18:24.215', N'Ao10      ', 5)
INSERT [dbo].[HoaDon] ([HoaDonID], [SanPhamID], [SoLuong]) VALUES (N'28/06/2015 09:18:24.215', N'Ao12      ', 2)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao1       ', N'Áo Ma Bư', N'Với chất liệu thun nỉ da cá co dãn và thấm hút tốt, không xù lông.', N'ao1.jpg', 200, 150)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao10      ', N'Áo tây ảo', N'Chất liệu vải thun co giãn cùng đường may chắn', N'Ao10.jpg', 200, 80)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao11      ', N'Áo Ca rô xanh', N'Có thể mặc như váy hay kết hợp với quần legging', N'Ao11.jpg', 200, 900)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao12      ', N'Áo Công sở', N'Chất liệu thun co giãn, tạo cảm giác mát mẻ ', N'Ao12.jpg', 200, 180)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao13      ', N'Áo Traza bin', N'Có thể mặc như váy hay kết hợp với quần legging', N'Ao13.jpg', 210, 100)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao14      ', N'Áo Khoác Style', N'phong cách công sở chuyên nghiệp, đẳng cấp', N'Ao14.jpg', 230, 100)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao15      ', N'Áo Thun 3 lỗ', N'Có thể mặc như váy hay kết hợp với quần legging', N'Ao15.jpg', 240, 100)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao16      ', N'Áo Ba lỗ', N'Chất liệu vải thun co giãn cùng đường may chắn', N'Ao16.jpg', 200, 300)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao17      ', N'Áo Thun hè', N'Chất liệu thun co giãn, tạo cảm giác mát mẻ ', N'Ao17.jpg', 200, 150)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao18      ', N'Áo thun Ma bư', N'Phong cách công sở chuyên nghiệp, đẳng cấp', N'Ao18.jpg', 200, 180)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao19      ', N'Áo Vải len', N'Chất liệu thun co giãn, tạo cảm giác mát mẻ ', N'Ao19.jpg', 200, 170)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao2       ', N'Áo Vét Tông', N'Mùa hè rực rỡ sắp đến cùng với những kì nghỉ dài ngày thật hấp dẫn', N'ao2.jpg', 300, 250)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao20      ', N'Áo Hidachi', N'Chất liệu vải thun co giãn cùng đường may chắn', N'Ao20.jpg', 220, 100)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao21      ', N'Áo HidaChi', N'không bao giờ lỗi mốt, trẻ trung, lịch lãm và hiện đại', N'Ao21.jpg', 340, 230)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao22      ', N'Áo Sơ Mi', N'Thiết kế tinh tế trong từng đường nét, cảm giác tự tin', N'Ao22.jpg', 310, 120)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao23      ', N'Áo Sơ Mi', N'không bao giờ lỗi mốt, trẻ trung, lịch lãm và hiện đại', N'Ao23.jpg', 200, 340)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao24      ', N'Áo Sơ Mi', N'không bao giờ lỗi mốt, trẻ trung, lịch lãm và hiện đại', N'Ao24.jpg', 300, 230)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao25      ', N'Áo hiHihaha', N'không bao giờ lỗi mốt, trẻ trung, lịch lãm và hiện đại', N'Ao25.jpg', 420, 120)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao26      ', N'Áo Vegeta', N'Gam màu xanh bích luôn gợi lên sự rắn rỏi, mạnh mẽ ', N'Ao26.jpg', 430, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao27      ', N'Áo Kiểu hàn', N'Thiết kế tinh tế trong từng đường nét, cảm giác tự tin', N'Ao27.jpg', 120, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao28      ', N'Áo Thái Lan', N' Gam màu xanh bích luôn gợi lên sự rắn rỏi, mạnh mẽ ', N'Ao28.jpg', 420, 440)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao29      ', N'Áo Sơ Mi', N' Gam màu xanh bích luôn gợi lên sự rắn rỏi, mạnh mẽ ', N'Ao29.jpg', 320, 550)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao3       ', N'Áo Khoác No Style', N'Khóa kéo kín và cao kết hợp nón sau áo rộng vô đối, bảo vệ toàn vùng cổ.', N'ao3.jpg', 150, 120)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao30      ', N'Áo Sơ Mi', N' Gam màu xanh bích luôn gợi lên sự rắn rỏi, mạnh mẽ ', N'Ao30.jpg', 120, 230)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao31      ', N'Áo Sơ Mi', N'thời trang 4MEN với nhiều màu sắc tươi trẻ, cá tính ', N'Ao31.jpg', 330, 120)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao32      ', N'Áo công Sở', N'thời trang 4MEN với nhiều màu sắc tươi trẻ, cá tính ', N'Ao32.jpg', 540, 330)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao33      ', N'Áo Giám Đốc', N'thời trang 4MEN với nhiều màu sắc tươi trẻ, cá tính ', N'Ao33.jpg', 350, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao34      ', N'Áo Quản Lý', N'thời trang 4MEN với nhiều màu sắc tươi trẻ, cá tính ', N'Ao34.jpg', 340, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao35      ', N'Áo Sơ Mi', N'thời trang 4MEN với nhiều màu sắc tươi trẻ, cá tính ', N'Ao35.jpg', 300, 400)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao36      ', N'Áo Sơ Mi', N'thời trang 4MEN với nhiều màu sắc tươi trẻ, cá tính ', N'Ao36.jpg', 300, 400)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao37      ', N'Áo kỹ sư', N'Thiết kế tinh tế trong từng đường nét, cảm giác tự tin', N'Ao37.jpg', 300, 500)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao38      ', N'Áo kỹ sư', N'Chất liệu vải trơn cao cấp, mềm mịn, thoáng mát', N'Ao38.jpg', 320, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao39      ', N'Áo Quản Lý', N'Chất liệu vải trơn cao cấp, mềm mịn, thoáng mát', N'Ao39.jpg', 230, 300)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao4       ', N'Áo Sơ Mi', N'Phong cách công sở chuyên nghiệp, hiện đại.', N'Ao4.jpg', 200, 100)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao40      ', N'Áo Giám Đốc', N'Chất liệu vải trơn cao cấp, mềm mịn, thoáng mát', N'Ao40.jpg', 440, 400)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao41      ', N'Áo Giám Đốc', N'Thiết kế tinh tế trong từng đường nét, cảm giác tự tin', N'Ao41.jpg', 550, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao5       ', N'Áo Ca rô', N'Áo cá tính đến từng chi tiết, phong cách mới lạ', N'Ao5.jpg', 230, 100)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao6       ', N'Áo Sọc màu', N'Kiểu dáng thời trang với áo cổ tròn kết hạt lạ mắt', N'Ao6.jpg', 200, 120)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao7       ', N'Áo Cổ cứng', N'phong cách trẻ trung, duyên dáng cho bạn gái', N'Ao7.jpg', 500, 410)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao8       ', N'Áo Sơ Mi trắng', N'Kiểu dáng cổ ngắn tự tin trong mọi hoạt động', N'Ao8.jpg', 80, 60)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Ao9       ', N'Áo Tông da', N'Dễ dàng kết hợp với quần jeans, quần short ', N'Ao9.jpg', 250, 100)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep1      ', N'Dép Quai hậu phong cách', N'Tạo vẻ thanh lịch thoải mái cho đôi chân của bạn khi bước đi trên đường', N'dep1.jpg', 300, 250)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep10     ', N'Dép Quai Hậu', N'đảm bảo độ bền và sự êm ái cho bàn chân', N'Dep10.jpg', 100, 80)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep11     ', N'Dép quai hậu', N'đảm bảo độ bền và sự êm ái cho bàn chân', N'Dep11.jpg', 100, 80)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep12     ', N'Dép quai sau', N'đảm bảo độ bền và sự êm ái cho bàn chân', N'Dep12.jpg', 140, 80)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep13     ', N'Dép MA bư', N'kết hợp với nhiều loại trang phục công sở, party', N'Dep13.jpg', 140, 90)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep14     ', N'Dép lào sonic', N'kết hợp với nhiều loại trang phục công sở, party', N'Dep14.jpg', 110, 90)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep15     ', N'Dép giám đốc', N'kết hợp với nhiều loại trang phục công sở, party', N'Dep15.jpg', 110, 90)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep16     ', N'Dép Scandal Helo', N'kết hợp với nhiều loại trang phục công sở, party', N'Dep16.jpg', 120, 90)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep17     ', N'Dép Cuteeee', N'kết hợp với nhiều loại trang phục công sở, party', N'Dep17.jpg', 100, 80)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep18     ', N'Dép Sỏ Ngón', N'chất liệu mềm, không để lại vết hằn trên da', N'Dep18.jpg', 100, 80)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep19     ', N'Dép Xỏ Ngón', N'chất liệu mềm, không để lại vết hằn trên da', N'Dep19.jpg', 110, 70)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep2      ', N'Dép Ma Bư', N'Vừa cute lại vừa mang phong cách hoạt hình vui nhộn, lạ mắt', N'dep2.jpg', 200, 130)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep20     ', N'Dép Sỏ Ngón', N'chất liệu mềm, không để lại vết hằn trên da', N'Dep20.jpg', 120, 100)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep21     ', N'Dép Xỏ Ngón', N'chất liệu mềm, không để lại vết hằn trên da', N'Dep21.jpg', 130, 110)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep22     ', N'Dép Xỏ Ngón', N'chất liệu mềm, không để lại vết hằn trên da', N'Dep22.jpg', 110, 80)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep23     ', N'Dép Búp Bê', N'Dép Jianbulai có rất nhiều màu trẻ trung và nữ tính', N'Dep23.jpg', 120, 90)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep24     ', N'Dép Quai Nơ', N'Dép Jianbulai có rất nhiều màu trẻ trung và nữ tính', N'Dep24.jpg', 220, 110)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep25     ', N'Dép Quai Nơ', N'Dép Jianbulai có rất nhiều màu trẻ trung và nữ tính', N'Dep25.jpg', 120, 120)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep26     ', N'Dép lào hehe', N'giúp đôi chân của bạn thoải mái và nhẹ nhàng', N'Dep26.jpg', 140, 130)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep27     ', N'Dép Quai Nơ', N'Dép Jianbulai có rất nhiều màu trẻ trung và nữ tính', N'Dep27.jpg', 150, 120)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep28     ', N'Dép gót sau', N'giúp đôi chân của bạn thoải mái và nhẹ nhàng', N'Dep28.jpg', 110, 90)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep3      ', N'Dép D123', N'Tạo vẻ bí ẩn, không thấm nước, đi nhẹ nhàng trên mọi địa hình', N'dep3.jpg', 120, 90)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep4      ', N'Dép Kiod 90', N'Phong cách trẻ trung, nhưng vẫn lịch sự tao nhã và đầy màu sắc', N'dep4.jpg', 90, 80)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep5      ', N'Dép Scandal Helo', N'Ứng dụng công nghệ vật liệu không cắt may, nhẹ', N'Dep5.jpg', 100, 80)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep6      ', N'Dép Scandal Helo', N'Ứng dụng công nghệ vật liệu không cắt may, nhẹ', N'Dep6.jpg', 110, 70)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep7      ', N'Dép Lào Helo', N'Ứng dụng công nghệ vật liệu không cắt may, nhẹ', N'Dep7.jpg', 110, 70)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep8      ', N'Dép Lào Helo', N'đảm bảo độ bền và sự êm ái cho bàn chân', N'Dep8.jpg', 120, 70)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Dep9      ', N'Dép Lào Helo', N'đảm bảo độ bền và sự êm ái cho bàn chân', N'Dep9.jpg', 130, 70)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay1     ', N'Giày Da Kiod', N' Những gam màu mạnh sẽ nổi bần bật trên nền chất liệu hoàn hảo này', N'giay1.jpg', 170, 150)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay10    ', N'Giày Bốt', N' Những gam màu mạnh sẽ nổi bần bật trên nền chất liệu này', N'Giay10.jpg', 130, 110)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay11    ', N'Giày Búp Bê', N'chất liệu mềm, không để lại vết hằn trên da', N'Giay11.jpg', 110, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay12    ', N'Giày Búp Bê', N'đảm bảo độ bền và sự êm ái cho bàn chân', N'Giay12.jpg', 130, 300)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay13    ', N'Giày Cao Gót', N' Những gam màu mạnh sẽ nổi bần bật trên nền chất liệunày', N'Giay13.jpg', 100, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay14    ', N'Giày cao gót', N'chất liệu mềm, không để lại vết hằn trên da', N'Giay14.jpg', 190, 120)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay15    ', N'Giày cao gót', N'chất liệu mềm, không để lại vết hằn trên da', N'Giay15.jpg', 250, 400)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay16    ', N'Giày Cao Gót', N' Những gam màu mạnh sẽ nổi bần bật trên nền chất liệu này', N'Giay16.jpg', 220, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay17    ', N'Giày Búp Bê', N'đảm bảo độ bền và sự êm ái cho bàn chân', N'Giay17.jpg', 250, 400)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay18    ', N'Giày Bốt', N'đảm bảo độ bền và sự êm ái cho bàn chân', N'Giay18.jpg', 110, 300)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay19    ', N'Giày Da Tây', N'Không những đẹp mà còn tăng thêm độ bền cho Kaito Kid X', N'Giay19.jpg', 300, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay2     ', N'Giày Thể thao sắc màu', N'Chưa hết, mũi giày cứng giảm áp lực khi va đập cho “chính chủ”', N'giay2.jpg', 150, 120)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay20    ', N'Giày Da Tây', N'Không những đẹp mà còn tăng thêm độ bền cho Kaito Kid X', N'Giay20.jpg', 300, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay21    ', N'Giày Da Tây', N'Không những đẹp mà còn tăng thêm độ bền cho Kaito Kid X', N'Giay21.jpg', 300, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay22    ', N'Giày Da Tây', N'Không những đẹp mà còn tăng thêm độ bền cho Kaito Kid X', N'Giay22.jpg', 300, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay23    ', N'Giày Da Tây', N'Không những đẹp mà còn tăng thêm độ bền cho Kaito Kid X', N'Giay23.jpg', 300, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay24    ', N'Giày Da Tây', N'Không những đẹp mà còn tăng thêm độ bền cho Kaito Kid X', N'Giay24.jpg', 300, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay25    ', N'Giày Da Tây', N'Không những đẹp mà còn tăng thêm độ bền cho Kaito Kid X', N'Giay25.jpg', 300, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay26    ', N'Giày Da Tây', N'Không những đẹp mà còn tăng thêm độ bền cho Kaito Kid X', N'Giay26.jpg', 300, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay27    ', N'Giày Thể Thao', N'đảm bảo độ bền và sự êm ái cho bàn chân', N'Giay27.jpg', 300, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay28    ', N'Giày Thể Thao', N'đảm bảo độ bền và sự êm ái cho bàn chân', N'Giay28.jpg', 300, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay29    ', N'Giày Thể Thao', N'đảm bảo độ bền và sự êm ái cho bàn chân', N'Giay29.jpg', 300, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay3     ', N'Giày Kitod', N'Không những đẹp mà còn tăng thêm độ bền cho Kaito Kid X', N'giay3.jpg', 140, 100)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay30    ', N'Giày Thể Thao', N'đảm bảo độ bền và sự êm ái cho bàn chân', N'Giay30.jpg', 300, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay31    ', N'Giày Thể Thao', N'đảm bảo độ bền và sự êm ái cho bàn chân', N'Giay31.jpg', 300, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay32    ', N'Giày Thể Thao', N'đảm bảo độ bền và sự êm ái cho bàn chân', N'Giay32.jpg', 300, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay33    ', N'Giày Thể Thao', N'đảm bảo độ bền và sự êm ái cho bàn chân', N'Giay33.jpg', 300, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay34    ', N'Giày Thể Thao', N'đảm bảo độ bền và sự êm ái cho bàn chân', N'Giay34.jpg', 300, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay4     ', N'Giày Búp Bê', N' Những gam màu mạnh sẽ nổi bần bật trên nền chất liệu này', N'Giay4.jpg', 150, 130)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay5     ', N'Giày Búp Bê', N'đảm bảo độ bền và sự êm ái cho bàn chân', N'Giay5.jpg', 160, 140)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay6     ', N'Giày Búp Bê', N' Những gam màu mạnh sẽ nổi bần bật trên nền chất liệu này', N'Giay6.jpg', 170, 110)
GO
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay7     ', N'Giày Bốt', N'chất liệu mềm, không để lại vết hằn trên da', N'Giay7.jpg', 150, 120)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay8     ', N'Giày Bốt Gót Cao', N'đảm bảo độ bền và sự êm ái cho bàn chân', N'Giay8.jpg', 150, 140)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Giay9     ', N'Giày Búp Bê', N'chất liệu mềm, không để lại vết hằn trên da', N'Giay9.jpg', 120, 150)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non1      ', N'Nón Thể thao', N'Phù hợp với mọi phong cách, nhấn mạnh cá tính, nghệ thuật nổi bật', N'non1.jpg', 60, 50)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non10     ', N'Nón Chống Nắng', N'Chất liệu vải tốt với vân ca rô chìm rất đẹp, nhẹ nhàng', N'Non10.jpg', 50, 60)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non11     ', N'Nón Chống Nắng', N'Chất liệu vải tốt với vân ca rô chìm rất đẹp, nhẹ nhàng', N'Non11.jpg', 30, 40)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non12     ', N'Nón Chống Nắng', N'Chất liệu vải tốt với vân ca rô chìm rất đẹp, nhẹ nhàng', N'Non12.jpg', 60, 50)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non13     ', N'Nón Hàn Quốc', N'Chất liệu vải tốt với vân ca rô chìm rất đẹp, nhẹ nhàng', N'Non13.jpg', 90, 50)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non14     ', N'Nón Hàn Quốc', N'Chất liệu vải tốt với vân ca rô chìm rất đẹp, nhẹ nhàng', N'Non14.jpg', 100, 120)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non15     ', N'Nón Chai-en', N'Nón Adidas M106 được thiết kế thanh lịch, tinh tế', N'Non15.jpg', 100, 50)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non16     ', N'Nón Chai-En', N'Nón Adidas M106 được thiết kế thanh lịch, tinh tế', N'Non16.jpg', 100, 90)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non17     ', N'Nón Chai-en', N'Nón Adidas M106 được thiết kế thanh lịch, tinh tế', N'Non17.jpg', 230, 210)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non18     ', N'Nón Vũng tàu', N'Nón Adidas M106 được thiết kế thanh lịch, tinh tế', N'Non18.jpg', 100, 80)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non19     ', N'Nón Nha Trang', N'Nón Adidas M106 được thiết kế thanh lịch, tinh tế', N'Non19.jpg', 110, 70)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non2      ', N'Nón mùa hè', N'tránh nắng trong mọi trường hợp, Chất liệu da phối màu mạnh mẽ', N'non2.jpg', 70, 50)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non20     ', N'Nón Vegeta', N'Nón Adidas M106 được thiết kế thanh lịch, tinh tế', N'Non20.jpg', 100, 60)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non3      ', N'Nón lá keo sơn', N'Đậm đà bản sắc dân tộc qua chiếc nón, thoải mái nắng mưa trên đường', N'non3.jpg', 80, 60)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non4      ', N'Nón Vegeta', N'Form nón đẹp, đội ôm đầu phù hợp cho cả nam và nữ', N'Non4.jpg', 100, 90)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non5      ', N'Nón Vegeta', N'Form nón đẹp, đội ôm đầu phù hợp cho cả nam và nữ', N'Non5.jpg', 60, 50)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non6      ', N'Nón Thể Thao', N'Form nón đẹp, đội ôm đầu phù hợp cho cả nam và nữ', N'Non6.jpg', 70, 50)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non7      ', N'Nón Thể Thao', N'Form nón đẹp, đội ôm đầu phù hợp cho cả nam và nữ', N'Non7.jpg', 80, 70)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non8      ', N'Nón Thể Thao', N'Form nón đẹp, đội ôm đầu phù hợp cho cả nam và nữ', N'Non8.jpg', 120, 100)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Non9      ', N'Nón Vegeta', N'Chất liệu vải tốt với vân ca rô chìm rất đẹp, nhẹ nhàng', N'Non9.jpg', 140, 100)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan1     ', N'Quần Tây Đen', N'Đã xinh mà còn mát mẻ, thỏa sức tung tăng hè, cùng bạn bè đi khắp nơi.', N'quan1.jpg', 120, 100)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan10    ', N'Quần jean sport', N'Dễ dàng phối cùng áo thun, áo form dài, áo sơ mi', N'Quan10.jpg', 212, 176)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan11    ', N'Quần jean shrort', N'Dễ dàng phối cùng áo thun, áo form dài, áo sơ mi', N'Quan11.jpg', 212, 176)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan12    ', N'Quần jean short', N'Dễ dàng phối cùng áo thun, áo form dài, áo sơ mi', N'Quan12.jpg', 212, 176)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan13    ', N'Quần thun ngắn', N'Dễ dàng phối cùng áo thun, áo form dài, áo sơ mi', N'Quan13.jpg', 212, 176)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan14    ', N'Quần thun ngắn', N'Dễ dàng phối cùng áo thun, áo form dài, áo sơ mi', N'Quan14.jpg', 212, 176)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan15    ', N'Quần thun ngắn', N'Quần short thun lưng cao giúp bạn gái che khuyến điểm', N'Quan15.jpg', 212, 176)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan16    ', N'Quần legging', N'Quần short thun lưng cao giúp bạn gái che khuyến điểm', N'Quan16.jpg', 212, 176)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan17    ', N'Quần legging', N'Quần short thun lưng cao giúp bạn gái che khuyến điểm', N'Quan17.jpg', 212, 176)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan18    ', N'Quần legging', N'Quần short thun lưng cao giúp bạn gái che khuyến điểm', N'Quan18.jpg', 212, 176)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan19    ', N'Quần jean Pi', N'Quần short thun lưng cao giúp bạn gái che khuyến điểm', N'Quan19.jpg', 212, 176)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan2     ', N'Quần Thể Thao', N'Các sản phẩm dành cho cặp đôi từ áo quần đến giày dép và phụ kiện', N'quan2.jpg', 200, 180)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan20    ', N'Quần Tây Đen', N'Quần jean nam hàng hiệu tạo cho các chàng phong cách trẻ trung', N'Quan20.jpg', 323, 300)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan21    ', N'Quần Tây Đen', N'Quần jean nam hàng hiệu tạo cho các chàng phong cách trẻ trung', N'Quan21.jpg', 323, 300)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan22    ', N'Quần Tây Đen', N'Quần jean nam hàng hiệu tạo cho các chàng phong cách trẻ trung', N'Quan22.jpg', 323, 300)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan23    ', N'Quần Công Sở', N'Quần jean nam hàng hiệu tạo cho các chàng phong cách trẻ trung', N'Quan23.jpg', 323, 250)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan24    ', N'Quần Công Sở', N'trang phục thường xuyên của các bạn nam thích hợp đi làm', N'Quan24.jpg', 323, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan25    ', N'Quần Tây Đen', N'trang phục thường xuyên của các bạn nam thích hợp đi làm', N'Quan25.jpg', 323, 300)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan26    ', N'Quần Tây Đen', N'trang phục thường xuyên của các bạn nam thích hợp đi làm', N'Quan26.jpg', 233, 300)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan27    ', N'Quần Short pi', N'trang phục thường xuyên của các bạn nam thích hợp đi làm', N'Quan27.jpg', 323, 300)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan28    ', N'Quần thun dãn', N'quần jean vừa vặn mang đến cảm giác thoái mái và tự tin', N'Quan28.jpg', 323, 300)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan29    ', N'Quần thể thao', N'quần jean vừa vặn mang đến cảm giác thoái mái và tự tin', N'Quan29.jpg', 123, 300)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan3     ', N'Quần Short Ngắn', N'Nmặc quần ngắn có thể tung tăng cho mấy chàng ngắm sướng mắt', N'quan3.jpg', 100, 80)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan30    ', N'Quần Thể thao', N'quần jean vừa vặn mang đến cảm giác thoái mái và tự tin', N'Quan30.jpg', 323, 300)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan31    ', N'Quần Thể Thao', N'quần jean vừa vặn mang đến cảm giác thoái mái và tự tin', N'Quan31.jpg', 300, 350)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan4     ', N'Quần jean Pi', N'bên túi đính nút tạo điểm nhấn độc đáo, ấn tượng', N'Quan4.jpg', 212, 176)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan5     ', N'Quần jean Pi', N'bên túi đính nút tạo điểm nhấn độc đáo, ấn tượng', N'Quan5.jpg', 212, 176)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan6     ', N'Quần jean Pi', N'bên túi đính nút tạo điểm nhấn độc đáo, ấn tượng', N'Quan6.jpg', 212, 176)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan7     ', N'Quần jean Sport', N'Quần được may từ chất liệu thun gucci cao cấp, dày dặn', N'Quan7.jpg', 212, 176)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan8     ', N'Quần jean short', N'Quần được may từ chất liệu thun gucci cao cấp, dày dặn', N'Quan8.jpg', 212, 176)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Quan9     ', N'Quần jean sport', N'Quần được may từ chất liệu thun gucci cao cấp, dày dặn', N'Quan9.jpg', 212, 176)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay1      ', N'Váy Ca Rô', N'váy đầm cho các bạn nữ tránh nóng, đầy đủ sắc màu, rực rỡ khắp nơi', N'vay1.jpg', 130, 100)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay10     ', N'Váy dạ tiệc lung linh', N'VÁY DỰ TIỆC NGẮN XOÈ VỚI CHẤT LIỆU REN TRẺ TRUNG', N'vay10.jpg', 800, 1000)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay11     ', N'Váy REN xinh xắn', N'ĐẦM DỰ TIỆC ÔM CÁCH ĐIỆU VỚI REN KIM CƯƠNG XINH XẮN ', N'vay11.jpg', 1000, 900)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay12     ', N'Váy học sinh thanh lịch', N'GỢI CẢM VỚI VÁY DẠ HỘI TRẮNG CẮT KHOÉT ĐÍNH REN CÁCH ĐIỆU', N'vay12.jpg', 700, 800)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay13     ', N'Váy đuôi cá', N'VÁY DẠ HỘI CÚP NGỰC ĐUÔI CÁ PEPLUM CÁCH ĐIỆU', N'vay13.jpg', 500, 400)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay14     ', N'Váy hoa gạo', N'ĐẦM DẠ HỘI ĐUÔI CÁ HỞ LƯNG KẾT HẠT TẠO HOA TIẾT CAO CẤP', N'vay14.jpg', 800, 600)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay15     ', N'Váy đính ren dạ hội', N'SEXY VỚI ĐẦM DẠ HỘI VÀNG NHẠT CỔ V ĐÍNH REN THÂN ÁO', N'vay15.jpg', 700, 650)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay16     ', N'Váy dạ hội truyền thống', N'ĐẦM DẠ HỘI CỔ THUYỀN KẾT HOẠ TIẾT SANG TRỌNG', N'vay16.jpg', 800, 700)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay17     ', N'Váy Ren đơn giản tay ngắn', N'ĐƠN GIẢN VỚI VÁY DẠ HỘI REN TAY NGẮN TÙNG NHÚN', N'vay17.jpg', 700, 600)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay18     ', N'Váy không giây', N'ÁO CƯỚI DẠ HỘI CÚP NGỰC DẬP LY ĐÍNH REN ẤN TƯỢNG', N'vay18.jpg', 800, 900)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay19     ', N'Váy lưng trần xinh xắn', N'VÁY DẠ HỘI CƯỚI ĐẮP REN TAY DÀI LƯNG TRẦN, SEXY', N'vay19.jpg', 1000, 900)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay2      ', N'Váy Xinh Cột', N'Nóng như thế này thì làm sao phải mặc, trang trí lộng lẫy duyên dáng', N'vay2.jpg', 150, 140)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay20     ', N'Váy kiểu hàn quốc', N'VÁY DẠ HỘI CÁCH ĐIỆU TINH TẾ VÀ CAO CẤP, PHONG CÁCH LẠ', N'vay20.jpg', 800, 780)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay21     ', N'Váy Đầm Nỉ', N'Với dáng váy này bạn vẫn dễ dàng diện đi làm hay đi chơi.', N'vay21.jpg', 100, 80)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay22     ', N'Váy Đầm Nỉ', N'Với dáng váy này bạn vẫn dễ dàng diện đi làm hay đi chơi.', N'vay22.jpg', 100, 80)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay23     ', N'Váy Đầm Ren', N'Váy xòe cho bạn gái nét nữ tính, trẻ trung hơn, đẹp hơn', N'vay23.jpg', 200, 210)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay24     ', N'Váy Ren Tông', N'Mạnh mẽ, cá tính  nhìn mới lạ, bắt mắt không kém phần quyến rũ', N'vay24.jpg', 230, 320)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay25     ', N'Váy xinh Xắn', N'Như một dạo khúc mở đầu cho bản tình ca mùa hạ, mùa xuân', N'vay25.jpg', 500, 300)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay26     ', N'Váy Cute 909', N'Thiết kế như dòng suối chảy quanh những viên đá cẩm thạch thực sự ', N'vay26.jpg', 400, 300)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay27     ', N'Váy xì teen 2', N'Cho người mặc cảm giác được đắm chìm trong thiên nhiên, suối', N'vay27.jpg', 200, 120)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay28     ', N'Váy Đầm học sinh', N'Thoải mái thảnh thơi trong mọi tình huống vui chơi', N'vay28.jpg', 120, 110)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay29     ', N'Váy Đa phong cách', N'Thật phong cách, thật xì teen, với nhiều kiểu dáng đẹp', N'vay29.jpg', 340, 300)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay3      ', N'Váy Công Sở', N'Cá tính, độc đáo cho công sở , tạo vẻ chuyên nghiệp và đầy nữ tính', N'vay3.jpg', 140, 130)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay30     ', N'Váy Đầm nỉ ren', N'Say đắm với mọi góc nhìn, nhẵn nhụa và đầy nữ tính', N'vay30.jpg', 120, 100)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay31     ', N'Váy Đầm ca rô', N'từng ô chỉ như những thể hiện cá tính và sắc đẹp', N'vay31.jpg', 760, 500)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay32     ', N'Váy Đầm style', N'đầm xinh xắn cho mọi ngày ở với người yêu, xinh lunh linh', N'vay32.jpg', 120, 120)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay33     ', N'Váy dạ nổi', N'tạo một hình thái mới trong một bữa tiệc lộng lẫy, kiêu sa', N'vay33.jpg', 180, 340)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay34     ', N'Váy dạ quang', N'nổi bật giữa mọi người với phong các đầy ánh sáng lòe', N'vay34.jpg', 190, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay35     ', N'Váy cu trẻ con', N'Đẹp như cô tấm trong truyện cổ tích thiếu nhi ngày nào', N'vay35.jpg', 200, 190)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay36     ', N'Váy hihihaa', N'nhãn hiệu thời trang hoàn toàn mới nhưng đầy cá tính', N'vay36.jpg', 210, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay37     ', N'Váy Chichi jan', N'Bá đạo với phong cách người yêu chiến binh huyền thoại', N'vay37.jpg', 220, 200)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay38     ', N'Váy Bơi xành điệu', N'tự tính khoe dáng bên hồ bơi với váy hiện đại, sexy', N'vay38.jpg', 230, 300)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay39     ', N'Váy Ren 3 tông', N'kiểu dáng hoàn toàn mới cho phong cách ăn chơi toàn diện', N'vay39.jpg', 230, 250)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay4      ', N'Váy Dạ Hội', N'Đẹp Lung Linh huyền ảo, Nơi mua sắm đặc biệt dành cho couple', N'vay4.jpg', 400, 380)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay40     ', N'Váy màu xám 2', N'quẩy tưng bar với dáng điệu công chúa đanh đá, khó ưa', N'vay40.jpg', 440, 400)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay41     ', N'Váy đặc tù 4', N'tên gọi với nhiều ý nghĩa và đầy sức mạnh của váy đầm đảm đang', N'vay41.jpg', 330, 300)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay42     ', N'Váy đại gia gó', N'thể hiện phong cách đại gia ăn chơi két tiếng qua chiếc váy', N'vay42.jpg', 430, 400)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay43     ', N'Váy tơ đầm re', N'phong cách ngây thơ những vẫn lung linh huyền diệu lạ kỳ', N'vay43.jpg', 120, 100)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay44     ', N'Váy đủ màu sắc', N'nổi bật đường phố với đầy đủ sắc màu như tắc kè bông hoa', N'vay44.jpg', 720, 600)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay5      ', N'Váy Maxi Duyên dáng', N'Tạo vẻ đẹp huyền bí với chất liệu mềm mại, đầy duyên dáng', N'vay5.jpg', 300, 250)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay6      ', N'Váy Đám cưới xuyên thấu', N'Sexy và đầy khuyến rũ cho phái đẹp, thu hút mọi ánh nhìn quanh', N'vay6.jpg', 500, 600)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay7      ', N'Váy Đen Huyền', N'THANH LỊCH VÀ HIỆN ĐẠI VỚI VÁY DỰ TIỆC NGẮN XUYÊN THẤU', N'vay7.jpg', 400, 450)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay8      ', N'Váy dạ hội teen', N'ĐẦM DỰ TIỆC NGẮN NHÉ NHÀNG CỔ THUYỀN XẾP NHÚN HUYỀN', N'vay8.jpg', 300, 280)
INSERT [dbo].[SanPham] ([SanPhamID], [TenSanPham], [MoTa], [HinhAnh], [GiaCu], [GiaMoi]) VALUES (N'Vay9      ', N'Váy Teen trẻ hồng', N'SEXY VỚI VÁY DỰ TIỆC NGẮN CÚP NGỰC KẾT CƯỜM TRÊN TOÀN THÂN', N'vay9.jpg', 700, 500)
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao1       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao10      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao11      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao12      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao13      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao14      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao15      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao16      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao17      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao18      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao19      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao2       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao20      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao21      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao22      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao23      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao24      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao25      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao26      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao27      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao28      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao29      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao3       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao30      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao31      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao32      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao33      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao34      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao35      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao36      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao37      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao38      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao39      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao4       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao40      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao41      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao5       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao6       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao7       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao8       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Ao        ', N'Ao9       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep1      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep10     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep11     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep12     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep13     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep14     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep15     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep16     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep17     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep18     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep19     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep2      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep20     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep21     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep22     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep23     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep24     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep25     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep26     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep27     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep28     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep3      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep4      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep5      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep6      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep7      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep8      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Dep       ', N'Dep9      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay1     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay10    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay11    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay12    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay13    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay14    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay15    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay16    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay17    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay18    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay19    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay2     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay20    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay21    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay22    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay23    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay24    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay25    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay26    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay27    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay28    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay29    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay3     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay30    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay31    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay32    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay33    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay34    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay4     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay5     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay6     ')
GO
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay7     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay8     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Giay      ', N'Giay9     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Ao1       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Ao10      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Ao11      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Ao12      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Ao2       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Ao26      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Ao27      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Ao28      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Ao29      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Ao30      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Ao8       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Ao9       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Dep10     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Dep11     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Dep18     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Dep19     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Dep20     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Dep8      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Dep9      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Giay10    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Giay11    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Giay19    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Giay20    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Giay21    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Giay8     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Giay9     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Non10     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Non11     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Non12     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Quan10    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Quan11    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Quan2     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Quan23    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Quan24    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Quan25    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Quan3     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Quan8     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Quan9     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Vay1      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Vay25     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Vay26     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Vay27     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Vay28     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Vay29     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Vay3      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Vay30     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'KhuyenMai ', N'Vay42     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Ao2       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Ao37      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Ao38      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Ao39      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Ao4       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Ao40      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Ao41      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Ao5       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Ao6       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Ao7       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Dep23     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Dep24     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Dep25     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Dep5      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Dep6      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Dep7      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Giay1     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Giay22    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Giay23    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Giay24    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Giay25    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Giay26    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Giay4     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Giay5     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Giay6     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Giay7     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Non1      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Non15     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Non16     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Non2      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Non4      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Non5      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Non6      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Quan1     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Quan20    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Quan21    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Quan22    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Quan4     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Quan5     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Quan6     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Quan7     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Vay36     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Vay37     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Vay38     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Vay39     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Vay40     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Vay41     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'MoiNhat   ', N'Vay44     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao21      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao22      ')
GO
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao23      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao24      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao25      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao26      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao27      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao28      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao29      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao30      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao31      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao32      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao33      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao34      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao35      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao36      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao37      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao38      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao39      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao40      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Ao41      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Dep10     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Dep11     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Dep12     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Dep13     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Dep14     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Dep15     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Dep16     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Dep17     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Dep5      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Dep6      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Dep7      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Dep8      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Dep9      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Giay1     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Giay19    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Giay2     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Giay20    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Giay21    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Giay22    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Giay23    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Giay24    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Giay25    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Giay26    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Giay27    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Giay28    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Giay29    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Giay3     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Giay30    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Giay31    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Giay32    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Giay33    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Giay34    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non1      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non10     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non11     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non12     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non13     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non14     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non15     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non16     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non17     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non18     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non19     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non2      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non20     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non3      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non4      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non5      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non6      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non7      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non8      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Non9      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Quan20    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Quan21    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Quan22    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Quan23    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Quan24    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Quan25    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Quan26    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Quan27    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Quan28    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Quan29    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Quan30    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nam       ', N'Quan31    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non1      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non10     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non11     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non12     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non13     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non14     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non15     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non16     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non17     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non18     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non19     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non2      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non20     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non3      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non4      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non5      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non6      ')
GO
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non7      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non8      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Non       ', N'Non9      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Ao1       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Ao17      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Ao18      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Ao19      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Ao20      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Ao3       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Ao31      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Ao32      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Ao33      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Ao34      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Ao35      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Ao36      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Dep15     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Dep16     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Dep17     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Dep21     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Dep22     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Giay1     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Giay12    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Giay13    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Giay14    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Giay15    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Giay2     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Giay27    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Giay28    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Giay29    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Non17     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Non18     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Non19     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Non20     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Quan16    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Quan17    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Quan18    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Quan19    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Quan29    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Quan3     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Quan30    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Quan31    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Vay21     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Vay22     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Vay23     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Vay24     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'NoStyle   ', N'Vay43     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao1       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao10      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao11      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao12      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao13      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao14      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao15      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao16      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao17      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao18      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao19      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao2       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao20      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao3       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao4       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao5       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao6       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao7       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao8       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Ao9       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Dep18     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Dep19     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Dep20     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Dep21     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Dep22     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Dep23     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Dep24     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Dep25     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Dep26     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Dep27     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Dep28     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Giay10    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Giay11    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Giay12    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Giay13    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Giay14    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Giay15    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Giay16    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Giay17    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Giay18    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Giay4     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Giay5     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Giay6     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Giay7     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Giay8     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Giay9     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Non10     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Non11     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Non12     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Non13     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Non14     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Non15     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Non16     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Non17     ')
GO
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Non18     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Non19     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Non20     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Quan1     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Quan10    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Quan11    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Quan12    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Quan13    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Quan14    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Quan15    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Quan16    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Quan17    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Quan18    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Quan19    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Quan2     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Quan3     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Quan4     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Quan5     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Quan6     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Quan7     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Quan8     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Quan9     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay1      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay10     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay11     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay12     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay13     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay14     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay15     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay16     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay17     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay18     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay19     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay2      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay20     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay21     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay22     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay23     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay24     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay25     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay26     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay27     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay28     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay29     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay3      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay30     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay31     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay32     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay33     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay34     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay35     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay36     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay37     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay38     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay39     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay4      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay40     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay41     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay42     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay43     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay44     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay5      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay6      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay7      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay8      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Nu        ', N'Vay9      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Ao1       ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Ao13      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Ao14      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Ao15      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Ao16      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Ao21      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Ao22      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Ao23      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Ao24      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Ao25      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Dep12     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Dep13     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Dep14     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Dep26     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Dep27     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Dep28     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Giay16    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Giay17    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Giay18    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Giay30    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Giay31    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Giay32    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Giay33    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Giay34    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Non13     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Non14     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Non7      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Non8      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Non9      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Quan1     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Quan12    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Quan13    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Quan14    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Quan15    ')
GO
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Quan2     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Quan26    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Quan27    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Quan28    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Vay2      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Vay31     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Vay32     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Vay33     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Vay34     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'OutLet    ', N'Vay35     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan1     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan10    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan11    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan12    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan13    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan14    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan15    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan16    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan17    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan18    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan19    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan2     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan20    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan21    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan22    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan23    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan24    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan25    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan26    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan27    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan28    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan29    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan3     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan30    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan31    ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan4     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan5     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan6     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan7     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan8     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Quan      ', N'Quan9     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay1      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay10     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay11     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay12     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay13     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay14     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay15     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay16     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay17     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay18     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay19     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay2      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay20     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay21     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay22     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay23     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay24     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay25     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay26     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay27     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay28     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay29     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay3      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay30     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay31     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay32     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay33     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay34     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay35     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay36     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay37     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay38     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay39     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay4      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay40     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay41     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay42     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay43     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay44     ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay5      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay6      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay7      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay8      ')
INSERT [dbo].[SanPhamCatalog] ([CatalogID], [SanPhamID]) VALUES (N'Vay       ', N'Vay9      ')
INSERT [dbo].[TaiKhoan] ([TaiKhoan], [MatKhau], [Email], [LastName], [FirstName], [Loai]) VALUES (N'', N'', N'', N'', N'', 2)
INSERT [dbo].[TaiKhoan] ([TaiKhoan], [MatKhau], [Email], [LastName], [FirstName], [Loai]) VALUES (N'a', N'a', N'a@gmail.com', N'a', N'a', 2)
INSERT [dbo].[TaiKhoan] ([TaiKhoan], [MatKhau], [Email], [LastName], [FirstName], [Loai]) VALUES (N'admin', N'admin', N'admin@gmail.com', N'admin', N'admin', 1)
INSERT [dbo].[TaiKhoan] ([TaiKhoan], [MatKhau], [Email], [LastName], [FirstName], [Loai]) VALUES (N'buoi', N'buoi', N'buoi@buoi.com', N'buoi', N'buoi', 2)
INSERT [dbo].[TaiKhoan] ([TaiKhoan], [MatKhau], [Email], [LastName], [FirstName], [Loai]) VALUES (N'hvngoc', N'hvngoc', N'hvngoc@ngoc.com', N'ngoc', N'ngoc', 2)
INSERT [dbo].[TaiKhoan] ([TaiKhoan], [MatKhau], [Email], [LastName], [FirstName], [Loai]) VALUES (N'ngoc', N'ngoc', N'ngoc@haha.com', N'ngoc', N'ngoc', 2)
INSERT [dbo].[TaiKhoan] ([TaiKhoan], [MatKhau], [Email], [LastName], [FirstName], [Loai]) VALUES (N'test', N'test2', N'test@test.com', N'test2', N'test2', 2)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao1       ', 4, N'Tích Cực', 341, 1200, N'Dài Tay', 100)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao10      ', 3, N'Cao', 12, 50, N'Thể Thao', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao11      ', 4, N'Đẹp', 130, 411, N'Dài Tay', 12)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao12      ', 3, N'Tiêu Chuẩn', 21, 70, N'Ngắn Tay', 24)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao13      ', 3, N'Tích Cực', 65, 123, N'Ngắn Tay', 40)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao14      ', 2, N'Tích Cực', 63, 443, N'Dài Tay', 65)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao15      ', 2, N'Tích Cực', 111, 787, N'Thể Thao', 51)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao16      ', 4, N'Tiêu Chuẩn', 444, 990, N'Áo Khoác', 18)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao17      ', 4, N'Tiêu Chuẩn', 500, 980, N'Dài Tay', 39)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao18      ', 3, N'Tích Cực', 123, 400, N'Áo Khoác', 98)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao19      ', 4, N'Cao', 57, 440, N'Ba Lỗ', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao2       ', 3, N'Tốt', 200, 1000, N'Ba Lỗ', 40)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao20      ', 4, N'Tiêu Chuẩn', 517, 1110, N'Ba Lỗ', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao21      ', 4, N'Tích Cực', 200, 500, N'So Mi', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao22      ', 4, N'Tích Cực', 200, 500, N'Dài Tay', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao23      ', 4, N'Tích Cực', 240, 200, N'Ng?n tay', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao24      ', 4, N'Tiêu Chuẩn', 230, 400, N'So Mi', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao25      ', 4, N'Tích Cực', 200, 300, N'Dài Tay', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao26      ', 4, N'Tiêu Chuẩn', 40, 100, N'Dài Tay', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao27      ', 4, N'Cao', 212, 1230, N'Dài Tay', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao28      ', 4, N'Cao', 123, 500, N'So Mi', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao29      ', 4, N'Đẹp', 444, 500, N'So Mi', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao3       ', 4, N'ĐẸp', 400, 2000, N'Áo Khoác', 50)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao30      ', 4, N'Đẹp', 220, 500, N'Ng?n tay', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao31      ', 4, N'Cao', 330, 500, N'Ng?n tay', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao32      ', 4, N'Tích Cực', 200, 500, N'Ng?n tay', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao33      ', 4, N'Tiêu Chuẩn', 200, 500, N'So Mi', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao34      ', 4, N'Tiêu Chuẩn', 210, 400, N'So Mi', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao35      ', 4, N'Cao', 200, 420, N'Ng?n tay', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao36      ', 4, N'Cao', 200, 230, N'So Mi', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao37      ', 4, N'Đẹp', 200, 500, N'So Mi', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao38      ', 4, N'Tích Cực', 200, 500, N'Ng?n tay', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao39      ', 4, N'Tiêu Chuẩn', 200, 540, N'Th? Thao', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao4       ', 4, N'Tích Cực', 200, 400, N'Dài Tay', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao40      ', 4, N'Cao', 200, 500, N'Th? Thao', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao41      ', 4, N'Cao', 200, 340, N'Th? Thao', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao5       ', 4, N'Tiêu Chuẩn', 20, 40, N'Dài Tay', 40)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao6       ', 3, N'Cao', 200, 200, N'Dài Tay', 43)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao7       ', 2, N'Tích Cực', 100, 300, N'Phong cách', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao8       ', 3, N'Tích Cực', 223, 440, N'Sành Điệu', 25)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Ao9       ', 4, N'Đẹp', 89, 411, N'Dài Tay', 60)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep1      ', 3, N'Tích Cực', 78, 123, N'Phong cách', 89)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep10     ', 3, N'Tích Cực', 140, 240, N'Dép Vi?t', 40)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep11     ', 3, N'Tích Cực', 120, 210, N'Dép Thái', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep12     ', 3, N'Tích Cực', 110, 230, N'Dép M?', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep13     ', 3, N'Tích Cực', 100, 240, N'Dép Nga', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep14     ', 3, N'Tích Cực', 100, 202, N'Dép Lào', 24)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep15     ', 3, N'Tích Cực', 120, 203, N'Dép Lào', 25)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep16     ', 3, N'Tích Cực', 130, 220, N'Dép Ki?u', 26)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep17     ', 3, N'Tích Cực', 100, 201, N'Dép Lào', 28)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep18     ', 3, N'Cao', 30, 40, N'Dép Lào', 12)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep19     ', 4, N'Cao', 30, 41, N'Dép Nữ', 12)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep2      ', 4, N'Tốt', 89, 12312, N'Sành Điệu', 67)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep20     ', 4, N'Tiêu Chuẩn', 20, 50, N'Dép Xỏ Ngón', 12)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep21     ', 2, N'Tốt', 30, 40, N'Dép Lào', 12)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep22     ', 3, N'Cao', 30, 45, N'Dép Xỏ ngón', 12)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep23     ', 3, N'Cao', 32, 40, N'Dép Lào', 12)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep24     ', 3, N'Tốt', 31, 42, N'Dép Nữ', 12)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep25     ', 2, N'Tích Cực', 30, 40, N'Dép Quai', 12)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep26     ', 2, N'Cao', 20, 41, N'Dép Lào', 12)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep27     ', 3, N'Tốt', 32, 40, N'Dép Việt', 12)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep28     ', 4, N'Cao', 10, 43, N'Dép Lào', 12)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep3      ', 2, N'Đẹp', 87, 234, N'Vui Nhộn', 6)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep4      ', 4, N'Tiêu Chuẩn', 78, 234, N'Thể Thao', 34)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep5      ', 3, N'Tích Cực', 100, 230, N'Dép Lào', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep6      ', 3, N'Tích Cực', 130, 210, N'Dép Lào', 22)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep7      ', 3, N'Tích Cực', 120, 20, N'Dép Ki?u', 21)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep8      ', 3, N'Tích Cực', 112, 202, N'Dép Ki?u', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Dep9      ', 3, N'Tích Cực', 100, 204, N'Dép Lào', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay1     ', 2, N'Cao', 150, 800, N'Sành Điệu', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay10    ', 4, N'Tích Cực', 200, 300, N'Giày Gót nh?n', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay11    ', 4, N'Tích Cực', 200, 300, N'Giày Búp Bê', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay12    ', 4, N'Tích Cực', 200, 300, N'Giày Búp Bê', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay13    ', 4, N'Tích Cực', 200, 300, N'Giày B?t', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay14    ', 4, N'Tích Cực', 200, 300, N'Giày B?t', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay15    ', 4, N'Tích Cực', 200, 300, N'Giày Búp Bê', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay16    ', 4, N'Tích Cực', 200, 300, N'Giày Gót Nh?n', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay17    ', 4, N'Tích Cực', 200, 300, N'Giày Búp Bê', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay18    ', 4, N'Tích Cực', 200, 300, N'Giày Cao Gót', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay19    ', 3, N'Tích Cực', 400, 600, N'Giày Tây', 50)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay2     ', 3, N'Tốt', 300, 1000, N'Vui Nhộn', 90)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay20    ', 3, N'Tích Cực', 400, 600, N'Giày Tây', 50)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay21    ', 3, N'Tích Cực', 400, 600, N'Giày Tây', 50)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay22    ', 3, N'Tích Cực', 400, 600, N'Giày Tây', 50)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay23    ', 3, N'Tích Cực', 400, 600, N'Giày Tây', 50)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay24    ', 3, N'Tích Cực', 400, 600, N'Giày Tây', 50)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay25    ', 3, N'Tích Cực', 400, 600, N'Giày Tây', 50)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay26    ', 3, N'Tích Cực', 400, 600, N'Giày Tây', 50)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay27    ', 4, N'Tiêu Chuẩn', 432, 754, N'Giày Thể Thao', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay28    ', 4, N'Tiêu Chuẩn', 432, 754, N'Giày Thể Thao', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay29    ', 4, N'Tiêu Chuẩn', 432, 754, N'Giày Thể Thao', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay3     ', 4, N'Tích Cực', 400, 2000, N'Phong Cách', 70)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay30    ', 4, N'Tiêu Chuẩn', 432, 754, N'Giày Thể Thao', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay31    ', 4, N'Tiêu Chuẩn', 432, 754, N'Giày Thể Thao', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay32    ', 4, N'Tiêu Chuẩn', 432, 754, N'Giày Thể Thao', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay33    ', 4, N'Tiêu Chuẩn', 432, 754, N'Giày Thể Thao', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay34    ', 4, N'Tiêu Chuẩn', 432, 754, N'Giày Thể Thao', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay4     ', 4, N'Tích Cực', 200, 300, N'Giày Búp Bê', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay5     ', 4, N'Tích Cực', 200, 300, N'Giày Cao Gót', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay6     ', 4, N'Tích Cực', 200, 300, N'Giày Búp Bê', 20)
GO
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay7     ', 4, N'Tích Cực', 200, 300, N'Giày Búp Bê', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay8     ', 4, N'Tích Cực', 200, 300, N'Giày B?t', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Giay9     ', 4, N'Tích Cực', 200, 300, N'Giày Cao Gót', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non1      ', 3, N'Tốt', 100, 600, N'Xì Teen', 60)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non10     ', 3, N'Tiêu Chuẩn', 100, 200, N'Thể Thao', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non11     ', 3, N'Tiêu Chuẩn', 100, 200, N'Thể Thao', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non12     ', 3, N'Tiêu Chuẩn', 100, 200, N'Thể Thao', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non13     ', 3, N'Tiêu Chuẩn', 100, 200, N'Thể Thao', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non14     ', 3, N'Tiêu Chuẩn', 100, 200, N'Thể Thao', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non15     ', 3, N'Tiêu Chuẩn', 100, 200, N'Thể Thao', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non16     ', 3, N'Tiêu Chuẩn', 100, 200, N'Thể Thao', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non17     ', 3, N'Tiêu Chuẩn', 100, 200, N'Thể Thao', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non18     ', 3, N'Tiêu Chuẩn', 100, 200, N'Thể Thao', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non19     ', 3, N'Tiêu Chuẩn', 100, 200, N'Thể Thao', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non2      ', 4, N'Tích Cực', 120, 230, N'Cá Tính', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non20     ', 3, N'Tiêu Chuẩn', 100, 200, N'Thể Thao', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non3      ', 3, N'Tốt', 150, 1293, N'Đa sắc màu', 40)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non4      ', 3, N'Tiêu Chuẩn', 100, 200, N'Thể Thao', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non5      ', 3, N'Tiêu Chuẩn', 100, 200, N'Thể Thao', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non6      ', 3, N'Tiêu Chuẩn', 100, 200, N'Thể Thao', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non7      ', 3, N'Tiêu Chuẩn', 100, 200, N'Thể Thao', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non8      ', 3, N'Tiêu Chuẩn', 100, 200, N'Thể Thao', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Non9      ', 3, N'Tiêu Chuẩn', 100, 200, N'Thể Thao', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan1     ', 4, N'Tích Cực', 400, 1234, N'Đen Nhung', 50)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan10    ', 4, N'Tích Cực', 432, 672, N'Quần Thun', 23)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan11    ', 4, N'Tích Cực', 432, 672, N'Quần Jean', 23)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan12    ', 4, N'Tích Cực', 432, 672, N'Quần Jean', 23)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan13    ', 4, N'Tích Cực', 432, 672, N'Quần Short', 23)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan14    ', 4, N'Tích Cực', 432, 672, N'Quần Ngáo', 23)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan15    ', 4, N'Tích Cực', 432, 672, N'Quần Thun', 23)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan16    ', 4, N'Tích Cực', 432, 672, N'Quần Ngáo', 23)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan17    ', 4, N'Tích Cực', 432, 672, N'Quần Jean', 23)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan18    ', 4, N'Tích Cực', 432, 672, N'Quần Jean', 23)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan19    ', 4, N'Tích Cực', 432, 672, N'Quần Jean', 23)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan2     ', 3, N'Tốt', 40, 456, N'Sành Điệu', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan20    ', 4, N'Tích Cực', 23, 486, N'Quần Tây', 43)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan21    ', 4, N'Tích Cực', 233, 466, N'Quần Tây', 43)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan22    ', 3, N'Tích Cực', 23, 461, N'Quần Tây', 43)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan23    ', 4, N'Tích Cực', 413, 436, N'Quần Tây', 43)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan24    ', 3, N'Tích Cực', 123, 436, N'Quần Tây', 43)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan25    ', 4, N'Tích Cực', 233, 346, N'Quần Tây', 43)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan26    ', 4, N'Tích Cực', 23, 486, N'Quần Tây', 43)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan27    ', 3, N'Tích Cực', 223, 746, N'Quần Tây', 43)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan28    ', 2, N'Tích Cực', 253, 746, N'Quần Tây', 43)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan29    ', 2, N'Tích Cực', 123, 946, N'Quần Tây', 43)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan3     ', 4, N'Cao', 123, 543, N'Cá Tính', 54)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan30    ', 3, N'Tích Cực', 237, 546, N'Quần Tây', 43)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan31    ', 4, N'Tích Cực', 123, 466, N'Quần Tây', 43)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan4     ', 4, N'Tích Cực', 432, 672, N'Quần Jean', 23)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan5     ', 4, N'Tích Cực', 432, 672, N'Quần Jean', 23)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan6     ', 4, N'Tích Cực', 432, 672, N'Quần Short', 23)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan7     ', 4, N'Tích Cực', 432, 672, N'Quần Short', 23)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan8     ', 4, N'Tích Cực', 432, 672, N'Quần Thun', 23)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Quan9     ', 4, N'Tích Cực', 432, 672, N'Quần Thun', 23)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay1      ', 2, N'Tốt', 43, 654, N'Ca rô', 53)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay10     ', 4, N'Tích Cực', 234, 8787, N'Đa sắc Màu', 51)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay11     ', 3, N'Cao', 123, 45435, N'Đen Bóng', 23)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay12     ', 3, N'Tốt', 12, 235, N'Thoáng Mát', 34)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay13     ', 3, N'Tiêu Chuẩn', 43, 312, N'Cá Tính', 232)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay14     ', 3, N'Cao', 34, 768, N'Xì Teen', 78)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay15     ', 4, N'Tích Cực', 78, 566, N'Vui Nhộn', 89)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay16     ', 2, N'Tiêu Cực', 1, 211, N'Thể Thao', 12)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay17     ', 2, N'Cao', 3, 45, N'Thể Thao', 34)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay18     ', 4, N'Tích Cực', 67, 668, N'Thoáng Mát', 45)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay19     ', 3, N'Đẹp', 87, 665, N'Thể Thao', 31)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay2      ', 3, N'Tiêu Chuẩn', 534, 1234, N'Đẹp lộng', 12)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay20     ', 2, N'Cao', 43, 444, N'Xì Teen', 22)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay21     ', 4, N'Tích Cực', 400, 800, N'Váy Ren', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay22     ', 2, N'Tốt', 200, 800, N'Váy Ren', 43)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay23     ', 3, N'Tích Cực', 300, 800, N'Váy Đầm', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay24     ', 3, N'Tiêu Chuẩn', 400, 1100, N'Váy Ren', 12)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay25     ', 4, N'Tích Cực', 20, 80, N'Váy Đầm', 43)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay26     ', 4, N'Tiêu Chuẩn', 40, 800, N'Váy Ren', 32)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay27     ', 3, N'Tích Cực', 400, 800, N'Váy Ren', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay28     ', 4, N'Cao', 230, 830, N'Váy Ren', 10)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay29     ', 2, N'Tích Cực', 90, 810, N'Váy Đầm', 33)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay3      ', 4, N'Tích Cực', 543, 8643, N'Phong cách', 65)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay30     ', 4, N'Đẹp', 600, 700, N'Váy Ren', 20)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay31     ', 4, N'Tích Cực', 400, 400, N'Váy Đầm', 60)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay32     ', 2, N'Đẹp', 200, 400, N'Váy Ren', 23)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay33     ', 3, N'Cao', 400, 800, N'Váy Ren', 32)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay34     ', 4, N'Tích Cực', 400, 800, N'Váy Đầm', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay35     ', 2, N'Tiêu Chuẩn', 100, 540, N'Váy Ren', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay36     ', 3, N'Tích Cực', 40, 90, N'Váy Ren', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay37     ', 4, N'Tiêu Chuẩn', 540, 670, N'Váy Đầm', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay38     ', 3, N'Tích Cực', 400, 800, N'Váy Ren', 12)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay39     ', 2, N'Cao', 23, 80, N'Váy Ren', 19)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay4      ', 4, N'Đẹp', 65, 123, N'Xì Teen', 657)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay40     ', 4, N'Tích Cực', 30, 80, N'Váy Đầm', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay41     ', 2, N'Đẹp', 42, 82, N'Váy Ren', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay42     ', 4, N'Tích Cực', 40, 120, N'Váy Đầm', 40)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay43     ', 4, N'Tiêu Chuẩn', 320, 800, N'Váy Ren', 30)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay44     ', 4, N'Tích Cực', 500, 800, N'Váy Đầm', 54)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay5      ', 3, N'Tiêu Chuẩn', 87, 876, N'Thể Thao', 54)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay6      ', 2, N'Đẹp', 89, 652, N'Ca Rô', 6)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay7      ', 4, N'Tích Cực', 578, 6432, N'Cá tính', 65)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay8      ', 4, N'Tích Cực', 123, 353, N'Dịu Dàng', 34)
INSERT [dbo].[ThongTinBoSung] ([SanPhamID], [SoSao], [DanhGia], [LuotMua], [LuotXem], [KieuDang], [TonKho]) VALUES (N'Vay9      ', 3, N'Tốt', 67, 878, N'Sành Điệu', 23)
ALTER TABLE [dbo].[HinhAnhBoSung]  WITH CHECK ADD  CONSTRAINT [FK_HinhAnhBoSung_SanPham] FOREIGN KEY([SanPhamID])
REFERENCES [dbo].[SanPham] ([SanPhamID])
GO
ALTER TABLE [dbo].[HinhAnhBoSung] CHECK CONSTRAINT [FK_HinhAnhBoSung_SanPham]
GO
ALTER TABLE [dbo].[SanPhamCatalog]  WITH CHECK ADD  CONSTRAINT [FK_SanPhamCatalog_Catalog] FOREIGN KEY([CatalogID])
REFERENCES [dbo].[Catalog] ([CatalogID])
GO
ALTER TABLE [dbo].[SanPhamCatalog] CHECK CONSTRAINT [FK_SanPhamCatalog_Catalog]
GO
ALTER TABLE [dbo].[SanPhamCatalog]  WITH CHECK ADD  CONSTRAINT [FK_SanPhamCatalog_SanPham] FOREIGN KEY([SanPhamID])
REFERENCES [dbo].[SanPham] ([SanPhamID])
GO
ALTER TABLE [dbo].[SanPhamCatalog] CHECK CONSTRAINT [FK_SanPhamCatalog_SanPham]
GO
ALTER TABLE [dbo].[ThongTinBoSung]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinBoSung_SanPham] FOREIGN KEY([SanPhamID])
REFERENCES [dbo].[SanPham] ([SanPhamID])
GO
ALTER TABLE [dbo].[ThongTinBoSung] CHECK CONSTRAINT [FK_ThongTinBoSung_SanPham]
GO
USE [master]
GO
ALTER DATABASE [Shoping] SET  READ_WRITE 
GO
