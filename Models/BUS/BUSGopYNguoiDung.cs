using HeadFoot.Models.DAO;
using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.BUS
{
    public class BUSGopYNguoiDung
    {
        DAOGopYNguoiDung DaoGopY;
        public BUSGopYNguoiDung()
        {
            DaoGopY = new DAOGopYNguoiDung();
        }

        public void insertGopY(DTOGopYNguoiDung dto)
        {
            DaoGopY.insertGopY(dto);
        }

        public List<DTOGopYNguoiDung> getTop10YKienDongGop()
        {
            return DaoGopY.getTop10YKienDongGop();
        }
    }
}