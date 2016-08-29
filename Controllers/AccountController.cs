using HeadFoot.Models.BUS;
using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HeadFoot.Controllers
{
    public class AccountController : Controller
    {
        public ActionResult DangNhap(string name, string password)
        {
            BUSTaiKhoan BusTaiKhoan = new BUSTaiKhoan();
            DTOTaiKhoan dto = BusTaiKhoan.isDangNhapThanhCong(name, password);
            if (dto != null)
            {
                Session["TaiKhoan"] = dto.TaiKhoan;
                Session["LoaiTaiKhoan"] = dto.Loai;
                Session["FirstName"] = dto.FirstName;
            }
            return View();
        }
        public ActionResult DangKy(string fname, string lname, string uname, string email, string password)
        {
            BUSTaiKhoan BusTaiKhoan = new BUSTaiKhoan();
            bool isUserNameHopLe = BusTaiKhoan.isTaiKhoanHopLe(uname);
            bool isEmailHopLe = BusTaiKhoan.isEmailHopLe(email);
            if (isUserNameHopLe && isEmailHopLe)
            {
                DTOTaiKhoan dto = new DTOTaiKhoan(uname, password, email, fname, lname);
                BusTaiKhoan.addTaiKhoan(dto);
            }
            ViewBag.isUserNameHopLe = isUserNameHopLe;
            ViewBag.isEmailHopLe = isEmailHopLe;
            return View();
        }

        public ActionResult QuenMatKhau(string name, string email)
        {
            BUSTaiKhoan BusTaiKhoan = new BUSTaiKhoan();
            string matkhau = BusTaiKhoan.getMatKhaufromTKvaEmail(name, email);
            ViewBag.matkhau = matkhau;
            return View();
        }
        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = null;
            Session["LoaiTaiKhoan"] = null;
            Session["FirstName"] = null;
            return View();
        }
    }
}