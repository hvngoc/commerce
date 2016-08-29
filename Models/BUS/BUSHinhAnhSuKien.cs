using HeadFoot.Models.DAO;
using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.BUS
{
    public class BUSHinhAnhSuKien
    {
        private DAOHinhAnhSuKien DAOHinhAnh;

        public BUSHinhAnhSuKien()
        {
            DAOHinhAnh = new DAOHinhAnhSuKien();
        }

        public List<DTOHinhAnhSuKien> getAllData()
        {
            return DAOHinhAnh.getAllData();
        }
    }
}