using HeadFoot.Models.DAO;
using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.BUS
{
    public class BUSTaiKhoan
    {
        private DAOTaiKhoan DaoTaiKhoan;
        public BUSTaiKhoan()
        {
            DaoTaiKhoan = new DAOTaiKhoan();
        }
        public bool isTaiKhoanHopLe(string taiKhoan)
        {
            return DaoTaiKhoan.isTaiKhoanHopLe(taiKhoan);
        }
        public bool isEmailHopLe(string email)
        {
            return DaoTaiKhoan.isEmailHopLe(email);
        }
        public void addTaiKhoan(DTOTaiKhoan dto)
        {
            DaoTaiKhoan.addTaiKhoan(dto);
        }
        public DTOTaiKhoan isDangNhapThanhCong(string taikhoan, string matkhau)
        {
            return DaoTaiKhoan.isDangNhapThanhCong(taikhoan, matkhau);
        }
        public string getMatKhaufromTKvaEmail(string taikhoan, string email)
        {
            return DaoTaiKhoan.getMatKhaufromTKvaEmail(taikhoan, email);
        }
        public void UpdateTaiKhoan(string taikhoan, string first, string last)
        {
            DaoTaiKhoan.UpdateTaiKhoan(taikhoan, first, last);
        }
        public void UpdateMatKhau(string taikhoan, string matkhau)
        {
            DaoTaiKhoan.UpdateMatKhau(taikhoan, matkhau);
        }
        public DTOTaiKhoan getTaiKhoantuID(string taikhoan)
        {
            return DaoTaiKhoan.getTaiKhoantuID(taikhoan);
        }
        public void XoaTaiKhoan(string taikhoan)
        {
            DaoTaiKhoan.XoaTaiKhoan(taikhoan);
        }
    }
}