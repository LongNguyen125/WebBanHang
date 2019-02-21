using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebDemo.Models
{
    public class GioHang
    {
        BanHangEntities db = new BanHangEntities();
        public int iMaMH { get; set; }
        public string sTenMatHang { get; set; }
        public double dGia { get; set; }
        public int iSoLuong { get; set; }
        public string sHinhAnh { get; set; }
        public double dThanhtien
        { get { return iSoLuong * dGia; } }
        public GioHang(int MaMH)
        {
            iMaMH = MaMH;
            MatHang matHang = db.MatHangs.Single(n => n.MaMH == iMaMH);
            sTenMatHang = matHang.TenMatHang;
            sHinhAnh = matHang.HinhAnh;
            dGia = double.Parse(matHang.Gia.ToString());
            iSoLuong = 1;

            
        }

    }
}