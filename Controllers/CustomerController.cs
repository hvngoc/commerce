using HeadFoot.Models;
using HeadFoot.Models.BUS;
using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;

namespace HeadFoot.Controllers
{
    public class CustomerController : Controller
    {
        //Session["TaiKhoan"] 
        //Session["LoaiTaiKhoan"]
        //Session["FirstName"]

        public ActionResult Dashboard(string param, string value, int? pg, string obj)
        {
            if (Session["LoaiTaiKhoan"] == null)
                return RedirectToAction("Error", "Error");
            int LoaiTaiKhoan = (int)Session["LoaiTaiKhoan"];
            ViewBag.LoaiTaiKhoan = LoaiTaiKhoan;
            ViewBag.param = param;
            if (param == "ThanhToan")
            {
                ThanhToanSanPhamInGlobal();
            }
            if (param == "LichSu")
            {
                getLichSuThanhToan();
            }
            if (LoaiTaiKhoan == 1)
            {
                if (param == "ThongKe")
                {
                    getThongKeMuaHang();
                }
                if (param == "GopY")
                {
                    getTop10YKienDongGop();
                }
                if (param == "XemSanPham")
                {
                    getAllCatalogSanPham();
                    if (value != null)
                    {
                        ViewBag.value = value;
                        if (obj != null)
                        {
                            deleteFromSanPhamCatalog(value, obj);
                        }
                        getViewModelSanPham(value, pg);
                    }
                }
            }
            return View();
        }

        private void getTop10YKienDongGop()
        {
            BUSGopYNguoiDung BusGopY = new BUSGopYNguoiDung();
            List<DTOGopYNguoiDung> listTop10YKienDongGop = BusGopY.getTop10YKienDongGop();
            ViewBag.listTop10YKienDongGop = listTop10YKienDongGop;
        }

        private void deleteFromSanPhamCatalog(string catalogID, string sanPhamID)
        {
            BUSViewModelSanPham BusViewModel = new BUSViewModelSanPham();
            BusViewModel.deleteFromSanPhamCatalog(catalogID, sanPhamID);
        }

        private void getViewModelSanPham(string value, int? pg)
        {
            BUSViewModelSanPham BusViewModel = new BUSViewModelSanPham();
            var products = BusViewModel.getListViewModelSanPham(value);
            var pageTable = pg ?? 1;
            var listDTOViewModelSanPham = products.ToPagedList(pageTable, 10);
            ViewBag.listDTOViewModelSanPham = listDTOViewModelSanPham;
        }

        private void getAllCatalogSanPham()
        {
            BUSCatalog BusCatalog = new BUSCatalog();
            List<DTOCatalog> listDTOCatalog = BusCatalog.getAllData();
            ViewBag.listDTOCatalog = listDTOCatalog;
        }

        private void getThongKeMuaHang()
        {
            BUSHoaDon BusHoaDon = new BUSHoaDon();
            int TongSanPhamDaBan = BusHoaDon.getTongSanPhamDaBan();
            ViewBag.TongSanPhamDaBan = TongSanPhamDaBan;

            BUSGiaoDich BusGiaoDich = new BUSGiaoDich();
            int TongSoNguoiDaMua = BusGiaoDich.getTongNguoiDaMua();
            ViewBag.TongSoNguoiDaMua = TongSoNguoiDaMua;
            int TongHoaDonDaBan = BusGiaoDich.getTongHoaDonDaBan();
            ViewBag.TongHoaDonDaBan = TongHoaDonDaBan;
            int TongSoLuongDaBan = BusGiaoDich.getTongSoLuongDaBan();
            ViewBag.TongSoLuongDaBan = TongSoLuongDaBan;
            int TongTienThuDuoc = BusGiaoDich.getTongTienThuDuoc();
            ViewBag.TongTienThuDuoc = TongTienThuDuoc;
        }

        private void getLichSuThanhToan()
        {
            string taikhoan = (string)Session["TaiKhoan"];
            BUSGiaoDich BusGiaoDich = new BUSGiaoDich();
            List<DTOGiaoDich> listDTOGiaoDich = BusGiaoDich.getListGiaoDichTheoTaiKhoan(taikhoan);
            ViewBag.listDTOGiaoDich = listDTOGiaoDich;
        }

        private void ThanhToanSanPhamInGlobal()
        {
            if (Global.listInCartIdSanPhamSoLuong.Count == 0)
            {
                ViewBag.param = null;
                return;
            }
            string dateNOW = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss.fff");
            string TaiKhoan = (string)Session["TaiKhoan"];
            int sumTien = 0, sumCount = 0;
            BUSHoaDon BusHoaDon = new BUSHoaDon();
            foreach (string item in Global.listInCartIdSanPhamSoLuong.Keys)
            {
                DTOHoaDon dto = new DTOHoaDon();
                dto.HoaDonID = dateNOW;
                dto.SanPhamID = item;
                dto.SoLuong = Global.listInCartIdSanPhamSoLuong[item];
                BusHoaDon.insertHoaDon(dto);

                sumCount += Global.listInCartIdSanPhamSoLuong[item];
                BUSSanPham BusSanPham = new BUSSanPham();
                sumTien += BusSanPham.getGiaMoitheoSanPhamID(item) * Global.listInCartIdSanPhamSoLuong[item];

                BUSThongTinBoSung BusBoSung = new BUSThongTinBoSung();
                BusBoSung.setLuotMuaAdd1(item);
            }
            DTOGiaoDich giaoDichDTO = new DTOGiaoDich();
            giaoDichDTO.HoaDonID = dateNOW;
            giaoDichDTO.TaiKhoanID = TaiKhoan;
            giaoDichDTO.SoLuong = sumCount;
            giaoDichDTO.TongTien = sumTien;

            BUSGiaoDich BusGiaoDich = new BUSGiaoDich();
            BusGiaoDich.insertGiaoDich(giaoDichDTO);

            Global.listInCartIdSanPhamSoLuong.Clear();
        }
        public string UpdateThongTin(string firstname, string lastname)
        {
            BUSTaiKhoan BusTaiKhoan = new BUSTaiKhoan();
            string taikhoan = (string)Session["TaiKhoan"];
            BusTaiKhoan.UpdateTaiKhoan(taikhoan, firstname, lastname);
            return "Success";
        }
        public string UpdateMatKhau(string matkhau)
        {
            BUSTaiKhoan BusTaiKhoan = new BUSTaiKhoan();
            string taikhoan = (string)Session["TaiKhoan"];
            BusTaiKhoan.UpdateMatKhau(taikhoan, matkhau);
            return "Success";
        }
        public string KiemTraTaiKhoan(string taikhoan)
        {
            BUSTaiKhoan BusTaiKhoan = new BUSTaiKhoan();
            if (BusTaiKhoan.isTaiKhoanHopLe(taikhoan))
                return "Không tồn tại tài khoản " + taikhoan;
            DTOTaiKhoan dto = BusTaiKhoan.getTaiKhoantuID(taikhoan);
            string result = "Mật Khẩu: " + dto.MatKhau + "\nEmail: " + dto.Email + "\nFist Name: "
                + dto.FirstName + "\nLast Name: " + dto.LastName;
            return result;
        }
        public string ThemTaiKhoanMoi(string fname, string lname, string uname, string email, string password)
        {
            BUSTaiKhoan BusTaiKhoan = new BUSTaiKhoan();
            bool isUserNameHopLe = BusTaiKhoan.isTaiKhoanHopLe(uname);
            if (isUserNameHopLe == false)
                return "Tài khoản đã được sử dụng";
            bool isEmailHopLe = BusTaiKhoan.isEmailHopLe(email);
            if (isEmailHopLe == false)
                return "Email đã được sử dụng";
            DTOTaiKhoan dto = new DTOTaiKhoan(uname, password, email, fname, lname);
            BusTaiKhoan.addTaiKhoan(dto);
            return "success";
        }
        public string XoaTaiKhoan(string taikhoan)
        {
            BUSTaiKhoan BusTaiKhoan = new BUSTaiKhoan();
            bool isUserNameHopLe = BusTaiKhoan.isTaiKhoanHopLe(taikhoan);
            if (isUserNameHopLe)
                return "Tài khoản không tồn tại";
            BusTaiKhoan.XoaTaiKhoan(taikhoan);
            return "success";
        }

        public string DongGopYKien(string noidung)
        {
            string taikhoan = (string)Session["TaiKhoan"];
            string dateNow = DateTime.Now.ToString("dd/MM/yyyy");
            DTOGopYNguoiDung dto = new DTOGopYNguoiDung();
            dto.DateNow = dateNow;
            dto.NguoiDungID = taikhoan;
            dto.NoiDung = noidung;
            BUSGopYNguoiDung BusGopY = new BUSGopYNguoiDung();
            BusGopY.insertGopY(dto);
            return "success";
        }

    }
}