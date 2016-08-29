using HeadFoot.Models.DAO;
using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.BUS
{
    public class BUSHinhAnhBoSung
    {
        private DAOHinhAnhBoSung DAOHinhAnh;

        public BUSHinhAnhBoSung()
        {
            DAOHinhAnh = new DAOHinhAnhBoSung();
        }

        public List<DTOHinhAnhBoSung> getHinhAnhBoSungTheoSanPhamID(string sanPhamID)
        {
            return DAOHinhAnh.getHinhAnhBoSungTheoSanPhamID(sanPhamID);
        }
    }
}