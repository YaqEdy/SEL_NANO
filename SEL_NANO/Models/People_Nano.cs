using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SEL_NANO.Models;

namespace SEL_NANO.Models
{
    public class AboutPersons_Nano
    {
        DataClass_NanoDataContext p_ctx_db = new DataClass_NanoDataContext();
        public string PersonsNano(string s_NRP)
        {
            var ireadonly = "readonly";
            var iClick = "";
            var iHTML_ = "";
            var isaveTA = "";
            var iTbl = p_ctx_db.VW_TBL_M_ABOUT_PERSONs.OrderBy(s => s.SORT);
            iHTML_ += "<ul class='owl-carousel testimonials same-height-row' data-animate='fadeInUp'>";
            foreach (var item in iTbl)
            {
                if (item.NRP == s_NRP)
                {
                    ireadonly = "";
                    iClick = "Click_Img()";
                    isaveTA = "saveTA(this.id)";
                }
                else
                {
                    ireadonly = "readonly";
                    iClick = "";
                    isaveTA = "";
                }

                iHTML_ += "<div class='owl-item' style='width: 278px;'>";

                iHTML_ += "<li class='item'>";
                iHTML_ += "<div class='testimonial same-height-always persons-nano'>";
                iHTML_ += "<div class='text'>";
                iHTML_ += "<p><textarea " + ireadonly + " id='" + item.NRP + "' onkeyup='" + isaveTA + "' style='width:230px;height:265px;border:0px'>" + item.DESC + "</textarea></p>";
                iHTML_ += "</div>";
                iHTML_ += "<div class='bottom'>";
                iHTML_ += "<div class='icon'><i class='fa fa-quote-left'></i></div>";
                iHTML_ += "<div class='name-picture'>";
                iHTML_ += "<img alt='Foto Profil' src='" + item.IMAGES + "' onclick='" + iClick + "'>";
                iHTML_ += "<h5>" + item.NAMA + "</h5>";
                iHTML_ += "<p>" + item.JABATAN + "</p>";
                iHTML_ += "</div>";
                iHTML_ += "</div>";
                iHTML_ += "</div>";
                iHTML_ += "</li>";

                iHTML_ += "</div>";
            }
            iHTML_ += "</ul>";

            return iHTML_;
        }

        public string FotoProfil(string s_NRP)
        {
            var iTbl = p_ctx_db.VW_TBL_M_ABOUT_PERSONs.Where(s => s.NRP.Equals(s_NRP)).FirstOrDefault();
            var iProfil = "";
            if (iTbl != null)
            {
                iProfil += "<img onclick='ClickUser()' src='" + iTbl.IMAGES + "' style='margin-left:-50px;margin-top:-20px;width:60px;height:60px;border-radius:30px' />";
                iProfil += "<p style='margin-top:-40px;margin-left:30px'>Sel Nilai Inti NANOTech</p>";
            }
            else
            {
                iProfil += "<img onclick='ClickUser()' src='//jiepwsdv402/APPS/NANO/Images/NANO.jpg' style='margin-left:-50px;margin-top:-20px;width:60px;height:60px;border-radius:30px' />";
                iProfil += "<p style='margin-top:-40px;margin-left:30px'>Sel Nilai Inti NANOTech</p>";
            }

            return iProfil;
        }


    }
}