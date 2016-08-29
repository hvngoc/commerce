using HeadFoot.Models.DAO;
using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.BUS
{
    public class BUSHoaDon
    {
        private DAOHoaDon DaoHoaDon;
        public BUSHoaDon()
        {
            DaoHoaDon = new DAOHoaDon();
        }
        public void insertHoaDon(DTOHoaDon dto)
        {
            DaoHoaDon.insertHoaDon(dto);
        }
        public int getTongSanPhamDaBan()
        {
            return DaoHoaDon.getTongSanPhamDaBan();
        }
    }
}