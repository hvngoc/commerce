using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.DAO
{
    public class DAOGopYNguoiDung
    {
        public void insertGopY(DTOGopYNguoiDung dto)
        {
            List<string> paramName = new List<string>();
            paramName.Add("@DateNow"); paramName.Add("@TaiKhoanID"); paramName.Add("@NoiDung");
            List<object> paramValue = new List<object>();
            paramValue.Add(dto.DateNow); paramValue.Add(dto.NguoiDungID); paramValue.Add(dto.NoiDung);
            DataTable dt = DataProvider.ExecuteStoreProc("insertGopY", paramName, paramValue);
        }

        public List<DTOGopYNguoiDung> getTop10YKienDongGop()
        {
            List<DTOGopYNguoiDung> listDTO = new List<DTOGopYNguoiDung>();
            List<string> paramName = new List<string>();
            List<object> paramValue = new List<object>();
            DataTable dt = DataProvider.ExecuteStoreProc("getTop10YKienDongGop", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                DTOGopYNguoiDung dto = new DTOGopYNguoiDung();
                dto.DateNow = dr["DateNow"].ToString();
                dto.NguoiDungID = dr["TaiKhoanID"].ToString();
                dto.NoiDung = dr["NoiDung"].ToString();
                listDTO.Add(dto);
            }
            return listDTO;
        }
    }
}