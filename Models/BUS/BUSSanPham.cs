using HeadFoot.Models.DAO;
using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.BUS
{
    public class BUSSanPham
    {
        private DAOSanPham DaoSanPham;

        public BUSSanPham()
        {
            DaoSanPham = new DAOSanPham();
        }

        public List<DTOSanPham> getTop4SanPhamTheoCatalogID(string catalogID)
        {
            return DaoSanPham.getTop4SanPhamTheoCatalogID(catalogID);
        }

        public List<DTOSanPham> getALLSanPhamTheoCatalogID(string catalogID)
        {
            return DaoSanPham.getALLSanPhamTheoCatalogID(catalogID);
        }

        public List<DTOSanPham> getTop8SanPhamBanChay()
        {
            return DaoSanPham.getTop8SanPhamBanChay();
        }

        public List<DTOSanPham> getTop10SanPhamLienQuanTheoSanPhamID(string sanPhamID)
        {
            return DaoSanPham.getTop10SanPhamLienQuanTheoSanPhamID(sanPhamID);
        }
        public List<DTOSanPham> getSearchingSanPhamTheoTuKhoa(string param)
        {
            return DaoSanPham.getSearchingSanPhamTheoTuKhoa(param);
        }
        public DTOSanPham getSanPhamTheoID(string sanPhamID)
        {
            return DaoSanPham.getSanPhamTheoID(sanPhamID);
        }
        public int getGiaMoitheoSanPhamID(string sanPhamID)
        {
            return DaoSanPham.getGiaMoitheoID(sanPhamID);
        }
    }
}