using SEL_NANO.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace SEL_NANO.Controllers
{
    public class AboutPersonsController : Controller
    {
        DataClass_NanoDataContext p_ctx_db = new DataClass_NanoDataContext();
        string p_Nrp = null;
        string p_Nama = null;
        string iRemarks = string.Empty;

        // GET: AboutPersons
        public ActionResult Index()
        {
            return View();
        }

        private void pv_LoadUser()
        {
            p_Nrp = (string)Session["NRP"];
            p_Nama = (string)Session["Nama"];

        }

        //UPLOAD
        [HttpPost]
        public async Task<JsonResult> uploadPerson()
        {
            pv_LoadUser();
            //DataTable dt = new DataTable();
            var iStrRemark = string.Empty;
            var iPath = "";
            //string sStrsessionUpload = Guid.NewGuid().ToString();

            try
            {
                foreach (string file in Request.Files)
                {
                    var fileContent = Request.Files[file];

                    if (fileContent != null && fileContent.ContentLength > 0)
                    {
                        var namaFile = Path.GetFileNameWithoutExtension(fileContent.FileName);
                        char[] splitChars = new[] { '_' };
                        var splitString = namaFile.Split(splitChars);
                        var periode = splitString.LastOrDefault();
                        var fileExt = fileContent.FileName;// Path.GetFileName(file);
                        fileExt = fileExt.Substring(fileExt.LastIndexOf(".") + 0);
                        //UNTUK IE
                        if (fileExt.LastIndexOf("\\") > 0)
                        {
                            fileExt = fileExt.Substring(fileExt.LastIndexOf(".") + 0);
                        }

                        if (fileExt == ".jpg" || fileExt == ".jpeg" || fileExt == ".png" || fileExt == ".bmp" || fileExt == ".gif")
                        {
                            iPath = Server.MapPath("~/Images/");
                            var path = Path.Combine(iPath, p_Nrp + fileExt);
                            fileContent.SaveAs(path);

                            //save to database
                            var iUrl = System.Configuration.ConfigurationManager.AppSettings["urlAppPath"].ToString();
                            var itbl = p_ctx_db.TBL_M_ABOUT_PERSONs.Where(f => f.NRP.Equals(p_Nrp)).FirstOrDefault();
                            itbl.IMAGES = iUrl + "Images/" + p_Nrp + fileExt;
                            itbl.MODIFIED_DATE = DateTime.Now;
                            itbl.MODIFIED_BY = p_Nrp;
                            p_ctx_db.SubmitChanges();
                            p_ctx_db.Dispose();
                        }
                       
                    }
                }
            }
            catch (Exception e)
            {
                return this.Json(new { status = false, remarks = e.Message.ToString() }, JsonRequestBehavior.AllowGet);
            }

            return this.Json(new { status = true, remarks = iPath }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult savePerson(string sDesc)
        {
            pv_LoadUser();
            try
            {
                var itbl = p_ctx_db.TBL_M_ABOUT_PERSONs.Where(d => d.NRP.Equals(p_Nrp)).FirstOrDefault();
                itbl.DESC = sDesc;
                p_ctx_db.SubmitChanges();
                p_ctx_db.Dispose();
                return Json(new { status = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                iRemarks = "Gagal";
                return Json(new { error = e.ToString(), status = false });
            }
        }

    }
}