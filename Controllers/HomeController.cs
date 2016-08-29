using HeadFoot.Models.BUS;
using HeadFoot.Models.DTO;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;
using HeadFoot.Models;

namespace HeadFoot.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            BUSCatalog BusCatalog = new BUSCatalog();
            List<DTOCatalog> listCatalog = BusCatalog.getAllData();

            BUSHinhAnhSuKien BusHinhAnhSuKien = new BUSHinhAnhSuKien();
            List<DTOHinhAnhSuKien> listHinhAnhSuKien = BusHinhAnhSuKien.getAllData();

            BUSSanPham BusSanPham = new BUSSanPham();
            List<DTOSanPham> list4SanPhamKhuyenMai = BusSanPham.getTop4SanPhamTheoCatalogID("KhuyenMai");
            List<DTOSanPham> list4SanPhamMoiNhat = BusSanPham.getTop4SanPhamTheoCatalogID("MoiNhat");
            List<DTOSanPham> list4SanPhamNoStyle = BusSanPham.getTop4SanPhamTheoCatalogID("NoStyle");

            ViewBag.listCatalog = listCatalog;
            ViewBag.listHinhAnhSuKien = listHinhAnhSuKien;
            ViewBag.list4SanPhamKhuyenMai = list4SanPhamKhuyenMai;
            ViewBag.list4SanPhamMoiNhat = list4SanPhamMoiNhat;
            ViewBag.list4SanPhamNoStyle = list4SanPhamNoStyle;

            return View(ViewBag);
        }
        public ActionResult Loading(int? page, string catalogID)
        {
            ViewBag.catalogID = catalogID;

            BUSCatalog BusCatalog = new BUSCatalog();
            List<DTOCatalog> listCatalog = BusCatalog.getAllData();
            ViewBag.listCatalog = listCatalog;

            BUSSanPham BusSanPham = new BUSSanPham();
            var products = BusSanPham.getALLSanPhamTheoCatalogID(catalogID);
            var pageNumber = page ?? 1;
            var onePageOfProducts = products.ToPagedList(pageNumber, 8);
            ViewBag.OnePageOfProducts = onePageOfProducts;

            return View();

        }

        public ActionResult Detail(string sanPhamID)
        {
            ViewBag.sanPhamID = sanPhamID;

            BUSCatalog BusCatalog = new BUSCatalog();
            List<DTOCatalog> listCatalog = BusCatalog.getAllData();
            ViewBag.listCatalog = listCatalog;

            BUSHinhAnhBoSung BusHinhAnhBoSung = new BUSHinhAnhBoSung();
            List<DTOHinhAnhBoSung> listHinhAnhBoSung = BusHinhAnhBoSung.getHinhAnhBoSungTheoSanPhamID(sanPhamID);
            ViewBag.listHinhAnhBoSung = listHinhAnhBoSung;

            BUSThongTinBoSung BusThongTinBoSung = new BUSThongTinBoSung();
            List<DTOThongTinBoSung> listThongTinBoSung = BusThongTinBoSung.getThongTinBoSungTheoSanPhamID(sanPhamID);
            ViewBag.listThongTinBoSung = listThongTinBoSung;

            BUSSanPham BusSanPham = new BUSSanPham();
            List<DTOSanPham> listTop8SanPhamBanChay = BusSanPham.getTop8SanPhamBanChay();
            ViewBag.listTop8SanPhamBanChay = listTop8SanPhamBanChay;

            List<DTOSanPham> listTop10SanPhamLienQuan = BusSanPham.getTop10SanPhamLienQuanTheoSanPhamID(sanPhamID);
            ViewBag.listTop10SanPhamLienQuan = listTop10SanPhamLienQuan;

            if (Session["TaiKhoan"] != null)
            {
                BusThongTinBoSung.setLuotXemAdd1(sanPhamID);
            }

            return View();
        }

        public ActionResult Search(int? page, string search_text, int? type)
        {
            ViewBag.search_text = search_text;
            ViewBag.type = type;

            BUSCatalog BusCatalog = new BUSCatalog();
            List<DTOCatalog> listCatalog = BusCatalog.getAllData();
            ViewBag.listCatalog = listCatalog;

            ProcessStringHelper processString = new ProcessStringHelper(search_text);
            BUSSanPham BusSanPham = new BUSSanPham();
            int choice = type ?? 1;
            List<DTOSanPham> products;
            if (choice == 3)
                products = BusSanPham.getSearchingSanPhamTheoTuKhoa(processString.getByWordString());
            else if (choice == 2)
                products = BusSanPham.getSearchingSanPhamTheoTuKhoa(processString.getAnyWordString());
            else
                products = BusSanPham.getSearchingSanPhamTheoTuKhoa(processString.getAllWordString());

            var pageNumber = page ?? 1;
            var onePageOfProducts = products.ToPagedList(pageNumber, 8);
            ViewBag.OnePageOfProducts = onePageOfProducts;

            return View();
        }

        public ActionResult CheckOut()
        {
            List<DTOSanPham> listSanPhamInCART = new List<DTOSanPham>();
            int countInCART = 0, sumInCART = 0;
            foreach (string item in Global.listInCartIdSanPhamSoLuong.Keys)
            {
                countInCART += Global.listInCartIdSanPhamSoLuong[item];
                BUSSanPham BusSanPham = new BUSSanPham();
                DTOSanPham dto = BusSanPham.getSanPhamTheoID(item);
                if (dto != null)
                {
                    dto.GiaCu = dto.GiaMoi * Global.listInCartIdSanPhamSoLuong[item];
                    listSanPhamInCART.Add(dto);
                    sumInCART += dto.GiaCu;
                }
            }
            ViewBag.countInCART = countInCART;
            ViewBag.sumInCART = sumInCART;
            ViewBag.listSanPhamInCART = listSanPhamInCART;
            return View(ViewBag);
        }

        public ActionResult Infomation(string idInf)
        {
            BUSDichVu BusDichVu = new BUSDichVu();
            List<string> listHinhAnh = BusDichVu.getHinhAnhDichVu(idInf);
            ViewBag.listHinhAnh = listHinhAnh;
            return View();
        }

        public string AddSanPhamIDtoGlobal(string sanPhamID)
        {
            if (sanPhamID != null && Global.listInCartIdSanPhamSoLuong.ContainsKey(sanPhamID))
                Global.listInCartIdSanPhamSoLuong[sanPhamID]++;
            else if (sanPhamID != null)
                Global.listInCartIdSanPhamSoLuong.Add(sanPhamID, 1);
            string result = "<colgroup><col /><col /><col /></colgroup><tr>"
                + "<th class=\"quantity-header\">QTY</th>"
                + "<th class=\"product-header\">Product</th>"
                + "<th class=\"subtotal-header\">Subtotal</th> </tr>";
            foreach(string item in Global.listInCartIdSanPhamSoLuong.Keys)
            {
                BUSSanPham BusSanPham = new BUSSanPham();
                DTOSanPham dto = BusSanPham.getSanPhamTheoID(item);
                if(dto != null)
                {
                    result += "<tr><td>" + Global.listInCartIdSanPhamSoLuong[item].ToString() + "x</td>"
                        + "<td><a href=\"#\">" + dto.TenSanPham + "</a>"
                        + "<div>" + dto.MoTa + "</div></td>"
                        + "<td>$" + dto.GiaMoi + ".000</td></tr>";
                }
            }
            return result;
        }
        public string RemoveIdSanPhamFromList(string sanPhamID)
        {
            Global.listInCartIdSanPhamSoLuong.Remove(sanPhamID);
            string result = "<colgroup><col /><col /><col /></colgroup><tr>"
                + "<th class=\"quantity-header\">QTY</th>"
                + "<th class=\"product-header\">Product</th>"
                + "<th class=\"subtotal-header\">Subtotal</th> </tr>";
            foreach (string item in Global.listInCartIdSanPhamSoLuong.Keys)
            {
                BUSSanPham BusSanPham = new BUSSanPham();
                DTOSanPham dto = BusSanPham.getSanPhamTheoID(item);
                if (dto != null)
                {
                    result += "<tr><td>" + Global.listInCartIdSanPhamSoLuong[item].ToString() + "x</td>"
                        + "<td><a href=\"#\">" + dto.TenSanPham + "</a>"
                        + "<div>" + dto.MoTa + "</div></td>"
                        + "<td>$" + dto.GiaMoi + ".000</td></tr>";
                }
            }
            return result;
        }
    }
}