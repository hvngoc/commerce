using HeadFoot.Models.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.BUS
{
    public class BUSDichVu
    {
        private DAODichVu DaoDichVu;
        public BUSDichVu()
        {
            DaoDichVu = new DAODichVu();
        }
        public List<string> getHinhAnhDichVu(string IdInf)
        {
            return DaoDichVu.getHinhAnhDichVu(IdInf);
        }
    }
}