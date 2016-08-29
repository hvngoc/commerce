using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.DAO
{
    public class DAOViewModelSanPham
    {
        public List<DTOViewModelSanPham> getListViewModelSanPham(string catalogID)
        {
            List<DTOViewModelSanPham> listDTO = new List<DTOViewModelSanPham>();
            List<string> paramName = new List<string>();
            paramName.Add("@catalogID");
            List<object> paramValue = new List<object>();
            paramValue.Add(catalogID);
            DataTable dt = DataProvider.ExecuteStoreProc("getListViewModelSanPham", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                DTOViewModelSanPham dto = new DTOViewModelSanPham();
                dto.sanPhamID = dr["SanPhamID"].ToString();
                dto.catalogName = dr["CatalogName"].ToString();
                dto.sanPhamName = dr["TenSanPham"].ToString();
                dto.sanPhamMoTa = dr["MoTa"].ToString();
                dto.GiaMoi = Int32.Parse(dr["GiaMoi"].ToString());
                dto.LuotMua = Int32.Parse(dr["LuotMua"].ToString());
                listDTO.Add(dto);
            }

            return listDTO;
        }

        public void deleteFromSanPhamCatalog(string catalogID, string sanPhamID)
        {
            List<string> paramName = new List<string>();
            paramName.Add("@catalogID");
            paramName.Add("@sanPhamID");
            List<object> paramValue = new List<object>();
            paramValue.Add(catalogID);
            paramValue.Add(sanPhamID);
            DataTable dt = DataProvider.ExecuteStoreProc("deleteFromSanPhamCatalog", paramName, paramValue);
        }
    }
}