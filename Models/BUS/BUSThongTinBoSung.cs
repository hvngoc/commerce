using HeadFoot.Models.DAO;
using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.BUS
{
    public class BUSThongTinBoSung
    {
        private DAOThongTinBoSung DaoBoSung;

        public BUSThongTinBoSung()
        {
            DaoBoSung = new DAOThongTinBoSung();
        }

        public List<DTOThongTinBoSung> getThongTinBoSungTheoSanPhamID(string sanPhamID)
        {
            return DaoBoSung.getThongTinBoSungTheoSanPhamID(sanPhamID);
        }
        public void setLuotMuaAdd1(string sanphamID)
        {
            DaoBoSung.setLuotMuaAdd1(sanphamID);
        }

        public void setLuotXemAdd1(string sanphamID)
        {
            DaoBoSung.setLuotXemAdd1(sanphamID);
        }
    }
}