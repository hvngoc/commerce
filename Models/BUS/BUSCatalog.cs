using HeadFoot.Models.DAO;
using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.BUS
{
    public class BUSCatalog
    {
        private DAOCatalog DAOSanPham;

        public BUSCatalog()
        {
            DAOSanPham = new DAOCatalog();
        }

        public List<DTOCatalog> getAllData()
        {
            return DAOSanPham.getAllData();
        }
    }
}