using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HeadFoot.Models.DTO
{
    public class DTOTaiKhoan
    {
        public DTOTaiKhoan(string uname, string matkhau, string email, string fname, string lname)
        {
            TaiKhoan = uname;
            MatKhau = matkhau;
            Email = email;
            FirstName = fname;
            LastName = lname;
            Loai = 2;
        }

        public DTOTaiKhoan()
        {
            
        }

        public string TaiKhoan;
        public string MatKhau;
        public string Email;
        public string FirstName;
        public string LastName;
        public int Loai;
    }
}