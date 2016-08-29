using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.DAO
{
    public class DAOHoaDon
    {
        public void insertHoaDon(DTOHoaDon dto)
        {
            List<string> paramName = new List<string>();
            paramName.Add("@hoadon");
            paramName.Add("@sanpham");
            paramName.Add("@soluong");
            List<object> paramValue = new List<object>();
            paramValue.Add(dto.HoaDonID);
            paramValue.Add(dto.SanPhamID);
            paramValue.Add(dto.SoLuong);
            DataTable dt = DataProvider.ExecuteStoreProc("insertHoaDon", paramName, paramValue);
        }
        public int getTongSanPhamDaBan()
        {
            List<string> paramName = new List<string>();
            List<object> paramValue = new List<object>();
            DataTable dt = DataProvider.ExecuteStoreProc("getTongSanPhamDaBan", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                return Int32.Parse(dr["SumSanPham"].ToString());
            }
            return 0;
        }
    }
}