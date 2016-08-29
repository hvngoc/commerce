using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.DAO
{
    public class DAOHinhAnhSuKien
    {
        public List<DTOHinhAnhSuKien> getAllData()
        {
            List<DTOHinhAnhSuKien> listHinhAnh = new List<DTOHinhAnhSuKien>();
            DataTable dt = DataProvider.ExecuteStoreProc("getAllHinhAnhSuKien", new List<string>(), new List<object>());
            foreach (DataRow dr in dt.Rows)
            {
                DTOHinhAnhSuKien HinhAnhDTO = new DTOHinhAnhSuKien();
                HinhAnhDTO.strHinhAnh = dr["HinhAnhSuKien"].ToString();
                listHinhAnh.Add(HinhAnhDTO);
            }
            return listHinhAnh;
        }
    }
}