using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.DAO
{
    public class DAOTaiKhoan
    {
        public bool isTaiKhoanHopLe(string taiKhoan)
        {
            List<string> paramName = new List<string>();
            paramName.Add("@taiKhoan");
            List<object> paramValue = new List<object>();
            paramValue.Add(taiKhoan);
            DataTable dt = DataProvider.ExecuteStoreProc("isTaiKhoanHopLe", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                return false;
            }
            return true;
        }
        public bool isEmailHopLe(string email)
        {
            List<string> paramName = new List<string>();
            paramName.Add("@email");
            List<object> paramValue = new List<object>();
            paramValue.Add(email);
            DataTable dt = DataProvider.ExecuteStoreProc("isEmailHopLe", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                return false;
            }
            return true;
        }
        public void addTaiKhoan(DTOTaiKhoan dto)
        {
            List<string> paramName = new List<string>();
            paramName.Add("@TaiKhoan"); paramName.Add("@MatKhau"); paramName.Add("@Email");
            paramName.Add("@LastName"); paramName.Add("@FirstName"); paramName.Add("@Loai");
            List<object> paramValue = new List<object>();
            paramValue.Add(dto.TaiKhoan); paramValue.Add(dto.MatKhau); paramValue.Add(dto.Email);
            paramValue.Add(dto.LastName); paramValue.Add(dto.FirstName); paramValue.Add(dto.Loai);
            DataTable dt = DataProvider.ExecuteStoreProc("addTaiKhoan", paramName, paramValue);
        }
        public DTOTaiKhoan isDangNhapThanhCong(string taikhoan, string matkhau)
        {
            List<string> paramName = new List<string>();
            paramName.Add("@taikhoan"); paramName.Add("@matkhau");
            List<object> paramValue = new List<object>();
            paramValue.Add(taikhoan); paramValue.Add(matkhau);
            DataTable dt = DataProvider.ExecuteStoreProc("isDangNhapThanhCong", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                DTOTaiKhoan dto = new DTOTaiKhoan();
                dto.TaiKhoan = dr["TaiKhoan"].ToString();
                dto.MatKhau = dr["MatKhau"].ToString();
                dto.Email = dr["Email"].ToString();
                dto.FirstName = dr["FirstName"].ToString();
                dto.LastName = dr["LastName"].ToString();
                dto.Loai = Int32.Parse(dr["Loai"].ToString());
                return dto;
            }
            return null;
        }
        public string getMatKhaufromTKvaEmail(string taikhoan, string email)
        {
            List<string> paramName = new List<string>();
            paramName.Add("@taikhoan"); paramName.Add("@email");
            List<object> paramValue = new List<object>();
            paramValue.Add(taikhoan); paramValue.Add(email);
            DataTable dt = DataProvider.ExecuteStoreProc("getMatKhaufromTKvaEmail", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                return dr["MatKhau"].ToString();
            }
            return null;
        }
        public void UpdateTaiKhoan(string taikhoan, string first, string last)
        {
            List<string> paramName = new List<string>();
            paramName.Add("@taikhoan"); paramName.Add("@first"); paramName.Add("@last");
            List<object> paramValue = new List<object>();
            paramValue.Add(taikhoan); paramValue.Add(first); paramValue.Add(last);
            DataTable dt = DataProvider.ExecuteStoreProc("UpdateTaiKhoan", paramName, paramValue);
        }
        public void UpdateMatKhau(string taikhoan, string matkhau)
        {
            List<string> paramName = new List<string>();
            paramName.Add("@taikhoan"); paramName.Add("@matkhau");
            List<object> paramValue = new List<object>();
            paramValue.Add(taikhoan); paramValue.Add(matkhau);
            DataTable dt = DataProvider.ExecuteStoreProc("UpdateMatKhau", paramName, paramValue);
        }
        public DTOTaiKhoan getTaiKhoantuID(string taikhoan)
        {
            List<string> paramName = new List<string>();
            paramName.Add("@taikhoan");
            List<object> paramValue = new List<object>();
            paramValue.Add(taikhoan);
            DataTable dt = DataProvider.ExecuteStoreProc("getTaiKhoantuID", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                DTOTaiKhoan dto = new DTOTaiKhoan();
                dto.TaiKhoan = dr["TaiKhoan"].ToString();
                dto.MatKhau = dr["MatKhau"].ToString();
                dto.Email = dr["Email"].ToString();
                dto.FirstName = dr["FirstName"].ToString();
                dto.LastName = dr["LastName"].ToString();
                dto.Loai = Int32.Parse(dr["Loai"].ToString());
                return dto;
            }
            return null;
        }

        public void XoaTaiKhoan(string taikhoan)
        {
            List<string> paramName = new List<string>();
            paramName.Add("@taikhoan");
            List<object> paramValue = new List<object>();
            paramValue.Add(taikhoan);
            DataTable dt = DataProvider.ExecuteStoreProc("XoaTaiKhoan", paramName, paramValue);
        }
    }
}