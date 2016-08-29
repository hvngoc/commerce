using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.DAO
{
    public class DAOGiaoDich
    {
        public void insertGiaoDich(DTOGiaoDich dto)
        {
            List<string> paramName = new List<string>();
            paramName.Add("@hoadon");
            paramName.Add("@taikhoan");
            paramName.Add("@soluong");
            paramName.Add("@tongtien");
            List<object> paramValue = new List<object>();
            paramValue.Add(dto.HoaDonID);
            paramValue.Add(dto.TaiKhoanID);
            paramValue.Add(dto.SoLuong);
            paramValue.Add(dto.TongTien);
            DataTable dt = DataProvider.ExecuteStoreProc("insertGiaoDich", paramName, paramValue);
        }
        public List<DTOGiaoDich> getListGiaoDichTheoTaiKhoan(string taikhoan)
        {
            List<string> paramName = new List<string>();
            paramName.Add("@taikhoan");
            List<object> paramValue = new List<object>();
            paramValue.Add(taikhoan);
            DataTable dt = DataProvider.ExecuteStoreProc("getListGiaoDichTheoTaiKhoan", paramName, paramValue);
            List<DTOGiaoDich> listDTO = new List<DTOGiaoDich>();
            foreach (DataRow dr in dt.Rows)
            {
                DTOGiaoDich dto = new DTOGiaoDich();
                dto.HoaDonID = dr["HoaDonID"].ToString();
                dto.SoLuong = Int32.Parse(dr["SoLuong"].ToString());
                dto.TongTien = Int32.Parse(dr["TongTien"].ToString());
                listDTO.Add(dto);
            }
            return listDTO;
        }
        public int getTongNguoiDaMua()
        {
            List<string> paramName = new List<string>();
            List<object> paramValue = new List<object>();
            DataTable dt = DataProvider.ExecuteStoreProc("getTongNguoiDaMua", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                return Int32.Parse(dr["TongTaiKhoanDaMua"].ToString());
            }
            return 0;
        }
        public int getTongHoaDonDaBan()
        {
            List<string> paramName = new List<string>();
            List<object> paramValue = new List<object>();
            DataTable dt = DataProvider.ExecuteStoreProc("getTongHoaDonDaBan", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                return Int32.Parse(dr["TongTaiKhoanDaMua"].ToString());
            }
            return 0;
        }
        public int getTongSoLuongDaBan()
        {
            List<string> paramName = new List<string>();
            List<object> paramValue = new List<object>();
            DataTable dt = DataProvider.ExecuteStoreProc("getTongSoLuongDaBan", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                return Int32.Parse(dr["TongTaiKhoanDaMua"].ToString());
            }
            return 0;
        }
        public int getTongTienThuDuoc()
        {
            List<string> paramName = new List<string>();
            List<object> paramValue = new List<object>();
            DataTable dt = DataProvider.ExecuteStoreProc("getTongTienThuDuoc", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                return Int32.Parse(dr["TongTaiKhoanDaMua"].ToString());
            }
            return 0;
        }
    }
}