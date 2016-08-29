using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HeadFoot.Models
{
    public class ProcessStringHelper
    {
        string search_text;
        public ProcessStringHelper(string search_text)
        {
            this.search_text = search_text;
        }

        public string getAnyWordString()
        {
            try
            {
                string[] words = search_text.Split(' ');
                string result = " N'%" + words[0] + "%' ";
                int length = words.Length;
                for (int i = 1; i < length; ++i)
                {
                    result += " or TenSanPham like N'%" + words[i] + "%' ";
                }
                return result;
            }
            catch (Exception ex)
            {
                return " ";
            }
        }
        public string getByWordString()
        {
            try
            {
                string[] words = search_text.Split(' ');
                string result = " N'%" + words[0] + "%' ";
                int length = words.Length;
                for (int i = 1; i < length; ++i)
                {
                    result += " and TenSanPham like N'%" + words[i] + "%' ";
                }
                return result;
            }
            catch (Exception ex)
            {
                return " ";
            }
        }

        public string getAllWordString()
        {
            return " N'%" + this.search_text + "%' ";
        }
    }
}