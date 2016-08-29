using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.DAO
{
    public class DAOThongTinBoSung
    {
        public List<DTOThongTinBoSung> getThongTinBoSungTheoSanPhamID(string sanPhamID)
        {
            List<DTOThongTinBoSung> listThongTin = new List<DTOThongTinBoSung>();
            List<string> paramName = new List<string>();
            paramName.Add("@sanpham");
            List<object> paramValue = new List<object>();
            paramValue.Add(sanPhamID);
            DataTable dt = DataProvider.ExecuteStoreProc("getThongTinBoSungTheoSanPhamID", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                DTOThongTinBoSung ThongTinDTO = new DTOThongTinBoSung();
                ThongTinDTO.TenSanPham = dr["TenSanPham"].ToString();
                ThongTinDTO.MoTa = dr["MoTa"].ToString();
                ThongTinDTO.SoSao = Int32.Parse(dr["SoSao"].ToString());
                ThongTinDTO.DanhGia = dr["DanhGia"].ToString();
                ThongTinDTO.LuotMua = Int32.Parse(dr["LuotMua"].ToString());
                ThongTinDTO.LuotXem = Int32.Parse(dr["LuotXem"].ToString());
                ThongTinDTO.KieuDang = dr["KieuDang"].ToString();
                ThongTinDTO.TonKho = Int32.Parse(dr["TonKho"].ToString());
                ThongTinDTO.GiaMoi = Int32.Parse(dr["GiaMoi"].ToString());
                ThongTinDTO.Rating = ThongTinDTO.SoSao * 100 / 4;
                listThongTin.Add(ThongTinDTO);
            }
            return listThongTin;
        }

        public void setLuotMuaAdd1(string sanphamID)
        {
            List<string> paramName = new List<string>();
            paramName.Add("@sanphamID");
            List<object> paramValue = new List<object>();
            paramValue.Add(sanphamID);
            DataTable dt = DataProvider.ExecuteStoreProc("setLuotMuaAdd1", paramName, paramValue);
        }
        public void setLuotXemAdd1(string sanphamID)
        {
            List<string> paramName = new List<string>();
            paramName.Add("@sanphamID");
            List<object> paramValue = new List<object>();
            paramValue.Add(sanphamID);
            DataTable dt = DataProvider.ExecuteStoreProc("setLuotXemAdd1", paramName, paramValue);
        }
    }
}