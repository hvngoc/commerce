using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.DAO
{
    public class DAOSanPham
    {
        public List<DTOSanPham> getTop4SanPhamTheoCatalogID(string catalogID)
        {
            List<DTOSanPham> listSanPham = new List<DTOSanPham>();
            List<string> paramName = new List<string>();
            paramName.Add("@catalogID");
            List<object> paramValue = new List<object>();
            paramValue.Add(catalogID);
            DataTable dt = DataProvider.ExecuteStoreProc("getTop4SanPhamTheoCatalogID", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                DTOSanPham SanPhamDTO = new DTOSanPham();
                SanPhamDTO.SanPhamID = dr["SanPhamID"].ToString();
                SanPhamDTO.TenSanPham = dr["TenSanPham"].ToString();
                SanPhamDTO.MoTa = dr["MoTa"].ToString();
                SanPhamDTO.HinhAnh = dr["HinhAnh"].ToString();
                SanPhamDTO.GiaCu = Int32.Parse(dr["GiaCu"].ToString());
                SanPhamDTO.GiaMoi = Int32.Parse(dr["GiaMoi"].ToString());
                listSanPham.Add(SanPhamDTO);
            }
            return listSanPham;
        }
        public List<DTOSanPham> getALLSanPhamTheoCatalogID(string catalogID)
        {
            List<DTOSanPham> listSanPham = new List<DTOSanPham>();
            List<string> paramName = new List<string>();
            paramName.Add("@catalogID");
            List<object> paramValue = new List<object>();
            paramValue.Add(catalogID);
            DataTable dt = DataProvider.ExecuteStoreProc("getALLSanPhamTheoCatalogID", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                DTOSanPham SanPhamDTO = new DTOSanPham();
                SanPhamDTO.SanPhamID = dr["SanPhamID"].ToString();
                SanPhamDTO.TenSanPham = dr["TenSanPham"].ToString();
                SanPhamDTO.MoTa = dr["MoTa"].ToString();
                SanPhamDTO.HinhAnh = dr["HinhAnh"].ToString();
                SanPhamDTO.GiaCu = Int32.Parse(dr["GiaCu"].ToString());
                SanPhamDTO.GiaMoi = Int32.Parse(dr["GiaMoi"].ToString());
                listSanPham.Add(SanPhamDTO);
            }
            return listSanPham;
        }
        public List<DTOSanPham> getTop8SanPhamBanChay()
        {
            List<DTOSanPham> listSanPham = new List<DTOSanPham>();
            List<string> paramName = new List<string>();
            List<object> paramValue = new List<object>();
            DataTable dt = DataProvider.ExecuteStoreProc("getTop8SanPhamBanChay", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                DTOSanPham SanPhamDTO = new DTOSanPham();
                SanPhamDTO.SanPhamID = dr["SanPhamID"].ToString();
                SanPhamDTO.TenSanPham = dr["TenSanPham"].ToString();
                SanPhamDTO.HinhAnh = dr["HinhAnh"].ToString();
                listSanPham.Add(SanPhamDTO);
            }
            return listSanPham;
        }

        public List<DTOSanPham> getTop10SanPhamLienQuanTheoSanPhamID(string sanPhamID)
        {
            List<DTOSanPham> listSanPham = new List<DTOSanPham>();
            List<string> paramName = new List<string>();
            paramName.Add("@sanpham");
            List<object> paramValue = new List<object>();
            paramValue.Add(sanPhamID);
            DataTable dt = DataProvider.ExecuteStoreProc("getTop10SanPhamLienQuanTheoSanPhamID", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                DTOSanPham SanPhamDTO = new DTOSanPham();
                SanPhamDTO.SanPhamID = dr["SanPhamID"].ToString();
                SanPhamDTO.TenSanPham = dr["TenSanPham"].ToString();
                SanPhamDTO.HinhAnh = dr["HinhAnh"].ToString();
                SanPhamDTO.GiaMoi = Int32.Parse(dr["GiaMoi"].ToString());
                listSanPham.Add(SanPhamDTO);
            }
            return listSanPham;
        }

        public List<DTOSanPham> getSearchingSanPhamTheoTuKhoa(string param)
        {
            List<DTOSanPham> listSanPham = new List<DTOSanPham>();
            String query = "select * from SanPham where TenSanPham like "+ param;
            DataTable dt = DataProvider.ExecuteQuery(query);
            foreach (DataRow dr in dt.Rows)
            {
                DTOSanPham SanPhamDTO = new DTOSanPham();
                SanPhamDTO.SanPhamID = dr["SanPhamID"].ToString();
                SanPhamDTO.TenSanPham = dr["TenSanPham"].ToString();
                SanPhamDTO.MoTa = dr["MoTa"].ToString();
                SanPhamDTO.HinhAnh = dr["HinhAnh"].ToString();
                SanPhamDTO.GiaCu = Int32.Parse(dr["GiaCu"].ToString());
                SanPhamDTO.GiaMoi = Int32.Parse(dr["GiaMoi"].ToString());
                listSanPham.Add(SanPhamDTO);
            }
            return listSanPham;
        }

        public DTOSanPham getSanPhamTheoID(string sanPhamID)
        {
            List<string> paramName = new List<string>();
            paramName.Add("@sanpham");
            List<object> paramValue = new List<object>();
            paramValue.Add(sanPhamID);
            DataTable dt = DataProvider.ExecuteStoreProc("getSanPhamTheoID", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                DTOSanPham SanPhamDTO = new DTOSanPham();
                SanPhamDTO.SanPhamID = dr["SanPhamID"].ToString();
                SanPhamDTO.TenSanPham = dr["TenSanPham"].ToString();
                SanPhamDTO.MoTa = dr["MoTa"].ToString();
                SanPhamDTO.GiaMoi = Int32.Parse(dr["GiaMoi"].ToString());
                return SanPhamDTO;
            }
            return null;
        }
        public int getGiaMoitheoID(string sanPhamID)
        {
            List<string> paramName = new List<string>();
            paramName.Add("@sanpham");
            List<object> paramValue = new List<object>();
            paramValue.Add(sanPhamID);
            DataTable dt = DataProvider.ExecuteStoreProc("getGiaMoitheoID", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                int value = Int32.Parse(dr["GiaMoi"].ToString());
                return value;
            }
            return 0;
        }
    }
}