using HeadFoot.Models.DAO;
using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.BUS
{
    public class BUSGiaoDich
    {
        private DAOGiaoDich DaoGiaoDich;
        public BUSGiaoDich()
        {
            DaoGiaoDich = new DAOGiaoDich();
        }
        public void insertGiaoDich(DTOGiaoDich dto)
        {
            DaoGiaoDich.insertGiaoDich(dto);
        }
        public List<DTOGiaoDich> getListGiaoDichTheoTaiKhoan(string taikhoan)
        {
            return DaoGiaoDich.getListGiaoDichTheoTaiKhoan(taikhoan);
        }
        public int getTongNguoiDaMua()
        {
            return DaoGiaoDich.getTongNguoiDaMua();
        }
        public int getTongHoaDonDaBan()
        {
            return DaoGiaoDich.getTongHoaDonDaBan();
        }
        public int getTongSoLuongDaBan()
        {
            return DaoGiaoDich.getTongSoLuongDaBan();
        }
        public int getTongTienThuDuoc()
        {
            return DaoGiaoDich.getTongTienThuDuoc();
        }
    }
}