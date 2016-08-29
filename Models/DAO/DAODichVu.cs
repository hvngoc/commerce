using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.DAO
{
    public class DAODichVu
    {
        public List<string> getHinhAnhDichVu(string IdInf)
        {
            List<string> listHinhAnh = new List<string>();
            List<string> paramName = new List<string>();
            paramName.Add("@IdInf");
            List<object> paramValue = new List<object>();
            paramValue.Add(IdInf);
            DataTable dt = DataProvider.ExecuteStoreProc("getDichVuHinhAnh", paramName, paramValue);
            foreach (DataRow dr in dt.Rows)
            {
                listHinhAnh.Add(dr["DichVuHinhAnh"].ToString());
            }
            return listHinhAnh;
        }
        
    }
}