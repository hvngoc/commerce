using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.DAO
{
    public class DAOHinhAnhBoSung
    {
        public List<DTOHinhAnhBoSung> getHinhAnhBoSungTheoSanPhamID(string sanPhamID)
        {
            List<DTOHinhAnhBoSung> listHinhAnh = new List<DTOHinhAnhBoSung>();
            List<string> paramName = new List<string>();
            paramName.Add("@sanpham");
            List<object> paramValue = new List<object>();
            paramValue.Add(sanPhamID);
            DataTable dt = DataProvider.ExecuteStoreProc("getHinhAnhBoSungTheoSanPhamID", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                DTOHinhAnhBoSung HinhAnhDTO = new DTOHinhAnhBoSung();
                HinhAnhDTO.strHinhAnh = dr["HinhAnhBoSung"].ToString();
                listHinhAnh.Add(HinhAnhDTO);
            }
            return listHinhAnh;
        }
    }
}