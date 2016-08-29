using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.DAO
{
    public class DAOCatalog
    {
        public List<DTOCatalog> getAllData()
        {
            List<DTOCatalog> listSanPham = new List<DTOCatalog>();
            DataTable dt = DataProvider.ExecuteStoreProc("getAllCatalog", new List<string>(), new List<object>());
            foreach (DataRow dr in dt.Rows)
            {
                DTOCatalog SanPhamDTO = new DTOCatalog();
                SanPhamDTO.CatalogID = dr["CatalogID"].ToString();
                SanPhamDTO.CatalogName = dr["CatalogName"].ToString();
                listSanPham.Add(SanPhamDTO);
            }
            return listSanPham;
        }
    }
}