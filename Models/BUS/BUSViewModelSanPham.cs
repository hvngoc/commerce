using HeadFoot.Models.DAO;
using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.BUS
{
    public class BUSViewModelSanPham
    {
        private DAOViewModelSanPham DaoViewModel;
        public BUSViewModelSanPham()
        {
            DaoViewModel = new DAOViewModelSanPham();
        }
        public List<DTOViewModelSanPham> getListViewModelSanPham(string catalogID)
        {
            return DaoViewModel.getListViewModelSanPham(catalogID);
        }

        public void deleteFromSanPhamCatalog(string catalogID, string sanPhamID)
        {
            DaoViewModel.deleteFromSanPhamCatalog(catalogID, sanPhamID);
        }
    }
}