using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SEL_NANO.Models;
using Kendo.DynamicLinq;
using System.Security.Principal;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.IO;
using System.Net;
using System.Threading.Tasks;

namespace SEL_NANO.Controllers
{
    public class HomeController : Controller
    {
        DataClass_NanoDataContext p_ctx_db = new DataClass_NanoDataContext();
        private AboutPersons_Nano p_Persons = new AboutPersons_Nano();
        string p_Nrp = null;
        string p_Nama = null;
        string iRemarks = string.Empty;
        bool iStatus;

        public ActionResult Index()
        {
            var sss = HttpContext.User.Identity.Name;
            pv_LoadUser();
            if (p_Nama == null)
            {
                ViewBag.NRP = p_Nrp;
                ViewBag.NAMA = null;
                //return RedirectToAction("About", "Home");
            }
            else
            {
                ViewBag.NRP = p_Nrp;
                ViewBag.NAMA = p_Nama;
                //generate Plan
                p_ctx_db.cusp_Generate_Plan(p_Nrp);
            }

            ViewBag.html = p_Persons.PersonsNano(p_Nrp);
            ViewBag.profil = p_Persons.FotoProfil(p_Nrp);
            return View();
        }

        private void pv_LoadUser()
        {
            if (Session["NRP"] == null)
            {
                //string iUserComp = WindowsIdentity.GetCurrent().Name.Split('\\').Last(); ;
                //string iUserComp = System.Environment.UserName;
                //string iUserComp= User.Identity.GetUserId();
                string iUserComp = System.Security.Principal.WindowsIdentity.GetCurrent().Name.Split('\\').Last();

                var iUserName = p_ctx_db.VW_TBL_M_EMPLOYEE_NANOs.Where(s => s.COMP_USER.Equals(iUserComp)).FirstOrDefault();

                if (iUserName == null)
                {
                    p_Nrp = iUserComp;
                    p_Nama = null;
                }
                else
                {
                    p_Nrp = iUserName.NRP;
                    p_Nama = iUserName.NAMA;

                    Session["NRP"] = iUserName.NRP;
                    Session["Nama"] = iUserName.NAMA;
                }
            }
            else
            {
                p_Nrp = (string)Session["NRP"];
                p_Nama = (string)Session["Nama"];
            }

        }

        [HttpPost]
        public ActionResult SetNRP(string sStrNrp)
        {
            try
            {
                var iUserName = p_ctx_db.VW_TBL_M_EMPLOYEE_NANOs.Where(s => s.NRP.Equals(sStrNrp)).FirstOrDefault();
                if (iUserName != null)
                {
                    Session["NRP"] = iUserName.NRP;
                    Session["Nama"] = iUserName.NAMA;
                }
                else
                {
                    Session["NRP"] = null;
                    Session["Nama"] = null;
                }

                return Json(new { status = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                iRemarks = "Gagal";
                return Json(new { error = e.ToString(), remarks = iRemarks, status = false });
            }
        }

        //[HttpPost]
        //public JsonResult ReadclickChooseme()
        //{
        //    try
        //    {
        //        var iTbl = p_ctx_db.VW_CHOOSE_MEs.FirstOrDefault();
        //        return Json(new { choose = iTbl.NAMA, nrp = iTbl.NRP, status = true });
        //    }
        //    catch (Exception e)
        //    {
        //        return this.Json(new { remarks = e.ToString(), error = e.ToString() }, JsonRequestBehavior.AllowGet);
        //    }
        //}

        [HttpPost]
        public JsonResult ReadclickChallenge()
        { 
            try
            {
                iStatus = true;
                var iChoose = p_ctx_db.VW_CHOOSE_MEs.FirstOrDefault();
                var iChallenge = p_ctx_db.VW_CHALLENGE_MEs.FirstOrDefault();
                if (iChoose == null)
                {
                    iStatus = false;
                    return Json(new { challenge = "", pid_ch = "", choose = "", nrp = "", status = iStatus });
                }
                else
                {
                    return Json(new { challenge = iChallenge.CHALLENGE, pid_ch = iChallenge.PID_CH, choose = iChoose.NAMA, nrp = iChoose.NRP, status = iStatus });
                }
            }
            catch (Exception e)
            {
                return this.Json(new { remarks = e.ToString(), error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult SaveChallenge(TBL_T_CHALLENGE sDATA)
        {
            pv_LoadUser();
            try
            {
                //var datenow = Convert.ToDateTime("2018-01-02");
                //var datenow2 = Convert.ToDateTime("2018-01-03");
                //var iTblKehadiran = p_ctx_db.TBL_T_KEHADIRAN_MEETINGs.Where(d => d.NRP == sDATA.NRP && d.TGL_ACT == datenow).FirstOrDefault();
                //var iTblChal = p_ctx_db.VW_TBL_T_CHALLENGEs.Where(s => s.TANGGAL == datenow2 && s.NRP == sDATA.NRP).FirstOrDefault();

                var iTblKehadiran = p_ctx_db.TBL_T_KEHADIRAN_MEETINGs.Where(d => d.NRP == sDATA.NRP && d.TGL_ACT == DateTime.Now).FirstOrDefault();
                var iTblChal = p_ctx_db.VW_TBL_T_CHALLENGEs.Where(s => s.TANGGAL == DateTime.Now && s.NRP == sDATA.NRP).FirstOrDefault();
                TBL_T_SCORE_CHALLANGE iTblScore = new TBL_T_SCORE_CHALLANGE();

                if (iTblKehadiran == null)
                {
                    iRemarks = sDATA.NAMA + " Belum Absen.!";
                    iStatus = false;
                }
                else if (iTblChal == null)
                {
                    sDATA.PID_T_CH = Guid.NewGuid().ToString();
                    sDATA.TANGGAL = DateTime.Now;
                    sDATA.CREATE_DATE = DateTime.Now;
                    sDATA.CREATE_BY = p_Nrp;
                    p_ctx_db.TBL_T_CHALLENGEs.InsertOnSubmit(sDATA);
                    p_ctx_db.SubmitChanges();

                    //var iEmp = p_ctx_db.TBL_M_EMPLOYEE_NANOs.Where(s => s.STATUS == true && s.NRP != sDATA.NRP);
                    //var iCountEmp = iEmp.Count();

                    //foreach (var iData in iEmp)
                    //{
                    iTblScore.PID_SCORE = Guid.NewGuid().ToString();
                    iTblScore.PID_T_CH = sDATA.PID_T_CH;
                    iTblScore.CREATE_SCORE = p_Nrp;

                    p_ctx_db.TBL_T_SCORE_CHALLANGEs.InsertOnSubmit(iTblScore);
                    p_ctx_db.SubmitChanges();
                    //}

                    iRemarks = "Success.!";
                    iStatus = true;
                }
                else
                {
                    iRemarks = "Data Sudah Ada.!";
                    iStatus = false;
                }


                return Json(new { iRemarks = iRemarks, iPID_T_CH = sDATA.PID_T_CH, iPID_SCORE = iTblScore.PID_SCORE, status = iStatus });
            }
            catch (Exception e)
            {
                return this.Json(new { remarks = e.ToString(), error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }


        [HttpPost]
        public JsonResult ReadScore(string sPid, int take, int skip, IEnumerable<Kendo.DynamicLinq.Sort> sort, Kendo.DynamicLinq.Filter filter)
        {
            try
            {
                //if (sPid == null)
                //{

                //    IQueryable<VW_SCORE_CHALLENGE> iVW_SCORE_CHALLENGE = p_ctx_db.VW_SCORE_CHALLENGEs.Where(d => d.TANGGAL == DateTime.Now);
                //    return Json(iVW_SCORE_CHALLENGE.OrderBy(s => s.PID_T_CH).ToDataSourceResult(take, skip, sort, filter));
                //}
                //else
                //{
                    IQueryable<VW_SCORE_CHALLENGE> iVW_SCORE_CHALLENGE = p_ctx_db.VW_SCORE_CHALLENGEs;//.Where(d => d.PID_T_CH == sPid);
                    return Json(iVW_SCORE_CHALLENGE.OrderByDescending(s => s.TANGGAL).ThenBy(s=>s.NAMA).ToDataSourceResult(take, skip, sort, filter));
                //}
            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public ActionResult CreateScore(TBL_T_SCORE_CHALLANGE sTBL)
        {
            pv_LoadUser();
            try
            {
                var iTbl = p_ctx_db.TBL_T_SCORE_CHALLANGEs.Where(f => f.PID_SCORE.Equals(sTBL.PID_SCORE)).FirstOrDefault();
                if (iTbl == null)
                {
                    sTBL.PID_SCORE = Guid.NewGuid().ToString();
                    sTBL.CREATE_SCORE = p_Nrp;

                    p_ctx_db.TBL_T_SCORE_CHALLANGEs.InsertOnSubmit(sTBL);
                    p_ctx_db.SubmitChanges();
                }
                else
                {
                    iTbl.SCORE = sTBL.SCORE;
                    p_ctx_db.SubmitChanges();
                }

                
                p_ctx_db.Dispose();
                iRemarks = "Success.!";

                return this.Json(new { status = true, Remarks = iRemarks }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                iRemarks = "Gagal.!";
                return this.Json(new { remarks = iRemarks, error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpPost]
        public ActionResult UpdateAllScore(IEnumerable<VW_SCORE_CHALLENGE> sTBL)
        {
            pv_LoadUser();
            try
            {
                //string iCek;
                foreach (var idata in sTBL)
                {
                    var iTbl = p_ctx_db.TBL_T_SCORE_CHALLANGEs.Where(f => f.PID_SCORE.Equals(idata.PID_SCORE)).FirstOrDefault();

                    iTbl.PID_T_CH = idata.PID_T_CH;
                    iTbl.SCORE = idata.SCORE;
                    iTbl.CREATE_SCORE = idata.NRP;

                    p_ctx_db.SubmitChanges();

                }

                p_ctx_db.Dispose();
                iRemarks = "Success.!";

                return this.Json(new { status = true, Remarks = iRemarks }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                iRemarks = "Gagal.!";
                return this.Json(new { remarks = iRemarks, error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult ReadDD_R_Score()
        {
            try
            {
                var iTbl = p_ctx_db.VW_R_SCOREs;
                return Json(iTbl);
            }
            catch (Exception e)
            {
                return this.Json(new { remarks = e.ToString(), error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }


        [HttpPost]
        public JsonResult ReadDD_R_Kehadiran()
        {
            try
            {
                var iTbl = p_ctx_db.TBL_R_KEHADIRANs;
                return Json(iTbl);
            }
            catch (Exception e)
            {
                return this.Json(new { remarks = e.ToString(), error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult ReadDD_Employee()
        {
            try
            {
                var iTbl = p_ctx_db.VW_TBL_M_EMPLOYEE_NANOs.OrderBy(s => s.NAMA);
                return Json(iTbl);
            }
            catch (Exception e)
            {
                return this.Json(new { remarks = e.ToString(), error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult ReadPersentaseKehadiran()
        {
            try
            {
                var iTbl = p_ctx_db.VW_KEHADIRAN_MEETINGs.OrderByDescending(s => s.TGL_PLAN).FirstOrDefault();
                return Json(new { persen = iTbl.PERSEN_NOW, tgl = iTbl.TGL_PLAN, status = true });
            }
            catch (Exception e)
            {
                return this.Json(new { remarks = e.ToString(), error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult ReadKehadiran(string sTgl, int take, int skip, IEnumerable<Kendo.DynamicLinq.Sort> sort, Kendo.DynamicLinq.Filter filter)
        {
            try
            {
                if (sTgl == null)
                {
                    IQueryable<VW_KEHADIRAN_MEETING> iVW_KEHADIRAN_MEETING = p_ctx_db.VW_KEHADIRAN_MEETINGs;
                    return Json(iVW_KEHADIRAN_MEETING.OrderByDescending(s => s.PERSENTASE).OrderByDescending(s => s.TGL_PLAN).ToDataSourceResult(take, skip, sort, filter));
                }
                else
                {
                    IQueryable<VW_KEHADIRAN_MEETING> iVW_KEHADIRAN_MEETING = p_ctx_db.VW_KEHADIRAN_MEETINGs.Where(d => d.TGL_PLAN.Equals(sTgl));
                    return Json(iVW_KEHADIRAN_MEETING.OrderByDescending(s => s.PERSENTASE).OrderByDescending(s => s.TGL_PLAN).ToDataSourceResult(take, skip, sort, filter));
                }
            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult UpdateKehadiran(TBL_T_KEHADIRAN_MEETING sTBL_T_KEHADIRAN_MEETING)
        {
            try
            {
                iRemarks = "Anda Tidak Memiliki Akses.!";
                pv_LoadUser();
                if (p_Nama != null)
                {
                    var iTbl = p_ctx_db.TBL_T_KEHADIRAN_MEETINGs.Where(s => s.PID_KEHADIRAN.Equals(sTBL_T_KEHADIRAN_MEETING.PID_KEHADIRAN)).FirstOrDefault();
                    if (iTbl == null)
                    {
                        sTBL_T_KEHADIRAN_MEETING.PID_KEHADIRAN = Guid.NewGuid().ToString();
                        sTBL_T_KEHADIRAN_MEETING.CREATE_DATE = DateTime.Now;
                        sTBL_T_KEHADIRAN_MEETING.CREATE_BY = p_Nrp;
                        sTBL_T_KEHADIRAN_MEETING.MODIFIED_DATE = DateTime.Now;
                        sTBL_T_KEHADIRAN_MEETING.MODIFIED_BY = p_Nrp;

                        if (sTBL_T_KEHADIRAN_MEETING.TGL_ACT == null)
                        {
                            sTBL_T_KEHADIRAN_MEETING.TGL_ACT = DateTime.Now;
                        }
                        p_ctx_db.TBL_T_KEHADIRAN_MEETINGs.InsertOnSubmit(sTBL_T_KEHADIRAN_MEETING);
                        p_ctx_db.SubmitChanges();
                        iRemarks = "Success.!";
                    }
                    else
                    {
                        if (sTBL_T_KEHADIRAN_MEETING.TGL_ACT == null)
                        {
                            sTBL_T_KEHADIRAN_MEETING.TGL_ACT = DateTime.Now;
                        }
                        iTbl.TGL_ACT = sTBL_T_KEHADIRAN_MEETING.TGL_ACT;
                        iTbl.NRP = sTBL_T_KEHADIRAN_MEETING.NRP;
                        iTbl.NAMA = sTBL_T_KEHADIRAN_MEETING.NAMA;
                        iTbl.KEHADIRAN = sTBL_T_KEHADIRAN_MEETING.KEHADIRAN;
                        iTbl.KEHADIRAN_DESC = sTBL_T_KEHADIRAN_MEETING.KEHADIRAN_DESC;
                        iTbl.KET = sTBL_T_KEHADIRAN_MEETING.KET;

                        iTbl.MODIFIED_DATE = DateTime.Now;
                        iTbl.MODIFIED_BY = p_Nrp;

                        p_ctx_db.SubmitChanges();
                        iRemarks = "Success.!";
                    }
                }

                return Json(new { status = true, Remarks = iRemarks });

            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString(), status = false }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult DeleteKehadiran(TBL_T_KEHADIRAN_MEETING sTBL)
        {
            try
            {
                iRemarks = "Anda Tidak Memiliki Akses.!";
                pv_LoadUser();
                if (p_Nama != null)
                {
                    if (sTBL.PID_KEHADIRAN != null)
                    {
                        var iTbl = p_ctx_db.TBL_T_KEHADIRAN_MEETINGs.Where(d => d.PID_KEHADIRAN.Equals(sTBL.PID_KEHADIRAN)).FirstOrDefault();
                        p_ctx_db.TBL_T_KEHADIRAN_MEETINGs.DeleteOnSubmit(iTbl);
                        p_ctx_db.SubmitChanges();
                        iRemarks = "Delete Success.!";

                    }
                }
                return Json(new { status = true, Remarks = iRemarks });
            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString(), status = false }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public ActionResult UpdateAllKehadiran(IEnumerable<TBL_T_KEHADIRAN_MEETING> sTBL)
        {
            pv_LoadUser();
            try
            {
                //string iCek;
                foreach (var idata in sTBL)
                {
                    TBL_T_KEHADIRAN_MEETING iTbl = p_ctx_db.TBL_T_KEHADIRAN_MEETINGs.Where(f => f.PID_KEHADIRAN.Equals(idata.PID_KEHADIRAN)).FirstOrDefault();

                    if (iTbl == null)
                    {
                        //TBL_T_KEHADIRAN_MEETING iTBL = new TBL_T_KEHADIRAN_MEETING();
                        idata.PID_KEHADIRAN = Guid.NewGuid().ToString();
                        idata.CREATE_DATE = DateTime.Now;
                        idata.CREATE_BY = p_Nrp;
                        idata.MODIFIED_DATE = DateTime.Now;
                        idata.MODIFIED_BY = p_Nrp;

                        if (idata.TGL_ACT == null)
                        {
                            idata.TGL_ACT = DateTime.Now;
                        }


                        p_ctx_db.TBL_T_KEHADIRAN_MEETINGs.InsertOnSubmit(idata);
                        p_ctx_db.SubmitChanges();

                    }
                    else
                    {
                        if (idata.TGL_ACT == null)
                        {
                            idata.TGL_ACT = DateTime.Now;
                        }
                        iTbl.TGL_ACT = idata.TGL_ACT;
                        iTbl.NRP = idata.NRP;
                        iTbl.NAMA = idata.NAMA;
                        iTbl.KEHADIRAN = idata.KEHADIRAN;
                        iTbl.KEHADIRAN_DESC = idata.KEHADIRAN_DESC;
                        iTbl.KET = idata.KET;

                        iTbl.MODIFIED_DATE = DateTime.Now;
                        iTbl.MODIFIED_BY = p_Nrp;
                        p_ctx_db.SubmitChanges();

                    }
                }

                p_ctx_db.Dispose();
                iRemarks = "Success.!";

                return this.Json(new { status = true, Remarks = iRemarks }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                iRemarks = "Gagal.!";
                return this.Json(new { remarks = iRemarks, error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }



        [HttpPost]
        public JsonResult ReadKegiatanMeeting(string sTgl, int take, int skip, IEnumerable<Kendo.DynamicLinq.Sort> sort, Kendo.DynamicLinq.Filter filter)
        {
            try
            {
                if (sTgl == null)
                {
                    IQueryable<VW_KEGIATAN_MEETING> iVW_KEGIATAN_MEETING = p_ctx_db.VW_KEGIATAN_MEETINGs;
                    return Json(iVW_KEGIATAN_MEETING.OrderByDescending(s => s.TGL_PLAN).ToDataSourceResult(take, skip, sort, filter));
                }
                else
                {
                    IQueryable<VW_KEGIATAN_MEETING> iVW_KEGIATAN_MEETING = p_ctx_db.VW_KEGIATAN_MEETINGs.Where(s => s.TGL_PLAN.Equals(sTgl));
                    return Json(iVW_KEGIATAN_MEETING.OrderByDescending(s => s.TGL_PLAN).ToDataSourceResult(take, skip, sort, filter));
                }
            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }


        [HttpPost]
        public JsonResult UpdateKegiatanMeeting(TBL_T_KEGIATAN_MEETING sTBL)
        {
            try
            {
                iRemarks = "Anda Tidak Memiliki Akses.!";
                pv_LoadUser();
                if (p_Nama != null)
                {
                    var iTbl = p_ctx_db.TBL_T_KEGIATAN_MEETINGs.Where(s => s.PID_K_MEETING.Equals(sTBL.PID_K_MEETING)).FirstOrDefault();
                    if (iTbl == null)
                    {
                        sTBL.PID_K_MEETING = Guid.NewGuid().ToString();
                        sTBL.NOTULEN_ACT = p_Nrp;
                        sTBL.CREATE_DATE = DateTime.Now;
                        sTBL.CREATE_BY = p_Nrp;
                        sTBL.MODIFIED_DATE = DateTime.Now;
                        sTBL.MODIFIED_BY = p_Nrp;
                        if (sTBL.TGL_ACT == null)
                        {
                            sTBL.TGL_ACT = DateTime.Now;
                        }

                        p_ctx_db.TBL_T_KEGIATAN_MEETINGs.InsertOnSubmit(sTBL);
                        p_ctx_db.SubmitChanges();
                        iRemarks = "Success.!";
                    }
                    else
                    {
                        if (sTBL.TGL_ACT == null)
                        {
                            sTBL.TGL_ACT = DateTime.Now;
                        }
                        iTbl.TGL_ACT = sTBL.TGL_ACT;
                        iTbl.SHEARING_ACT = sTBL.SHEARING_ACT;
                        iTbl.SHEARING_TOPIC = sTBL.SHEARING_TOPIC;
                        iTbl.NOTULEN_ACT = p_Nrp;
                        iTbl.KET = sTBL.KET;

                        iTbl.MODIFIED_DATE = DateTime.Now;
                        iTbl.MODIFIED_BY = p_Nrp;

                        p_ctx_db.SubmitChanges();
                        iRemarks = "Success.!";
                    }
                }

                return Json(new { status = true, Remarks = iRemarks });

            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString(), status = false }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult DeleteKegiatanMeeting(TBL_T_KEGIATAN_MEETING sTBL)
        {
            try
            {
                iRemarks = "Anda Tidak Memiliki Akses.!";
                pv_LoadUser();
                if (p_Nama != null)
                {
                    if (sTBL.PID_K_MEETING != null)
                    {
                        var iTbl = p_ctx_db.TBL_T_KEGIATAN_MEETINGs.Where(d => d.PID_K_MEETING.Equals(sTBL.PID_K_MEETING)).FirstOrDefault();
                        p_ctx_db.TBL_T_KEGIATAN_MEETINGs.DeleteOnSubmit(iTbl);
                        p_ctx_db.SubmitChanges();
                        iRemarks = "Delete Success.!";

                    }
                }
                return Json(new { status = true, Remarks = iRemarks });
            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString(), status = false }, JsonRequestBehavior.AllowGet);
            }
        }




        [HttpPost]
        public JsonResult ReadNotulen(string sTgl, int take, int skip, IEnumerable<Kendo.DynamicLinq.Sort> sort, Kendo.DynamicLinq.Filter filter)
        {
            try
            {
                if (sTgl == null)
                {
                    IQueryable<VW_NOTULEN> iVW_NOTULEN = p_ctx_db.VW_NOTULENs;
                    return Json(iVW_NOTULEN.OrderByDescending(s => s.TGL_PLAN).ToDataSourceResult(take, skip, sort, filter));
                }
                else
                {
                    IQueryable<VW_NOTULEN> iVW_NOTULEN = p_ctx_db.VW_NOTULENs.Where(s => s.TGL_PLAN.Equals(sTgl));
                    return Json(iVW_NOTULEN.OrderByDescending(s => s.TGL_PLAN).ToDataSourceResult(take, skip, sort, filter));
                }
            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult UpdateNotulen(TBL_T_NOTULEN sTBL)
        {
            try
            {
                iRemarks = "Anda Tidak Memiliki Akses.!";
                pv_LoadUser();
                if (p_Nama != null)
                {
                    var iTbl = p_ctx_db.TBL_T_NOTULENs.Where(s => s.PID_NOTULEN.Equals(sTBL.PID_NOTULEN)).FirstOrDefault();
                    if (iTbl == null)
                    {
                        sTBL.PID_NOTULEN = Guid.NewGuid().ToString();
                        sTBL.CREATE_DATE = DateTime.Now;
                        sTBL.CREATE_BY = p_Nrp;
                        sTBL.MODIFIED_DATE = DateTime.Now;
                        sTBL.MODIFIED_BY = p_Nrp;
                        if (sTBL.TGL_ACT == null)
                        {
                            sTBL.TGL_ACT = DateTime.Now;
                        }

                        p_ctx_db.TBL_T_NOTULENs.InsertOnSubmit(sTBL);
                        p_ctx_db.SubmitChanges();
                        iRemarks = "Success.!";
                    }
                    else
                    {
                        if (sTBL.TGL_ACT == null)
                        {
                            sTBL.TGL_ACT = DateTime.Now;
                        }
                        iTbl.TGL_ACT = sTBL.TGL_ACT;
                        iTbl.URAIAN = sTBL.URAIAN;
                        iTbl.KET = sTBL.KET;

                        iTbl.MODIFIED_DATE = DateTime.Now;
                        iTbl.MODIFIED_BY = p_Nrp;

                        p_ctx_db.SubmitChanges();
                        iRemarks = "Success.!";
                    }
                }

                return Json(new { status = true, Remarks = iRemarks });

            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString(), status = false }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult DeleteNotulen(TBL_T_NOTULEN sTBL)
        {
            try
            {
                iRemarks = "Anda Tidak Memiliki Akses.!";
                pv_LoadUser();
                if (p_Nama != null)
                {
                    if (sTBL.PID_NOTULEN != null)
                    {
                        var iTbl = p_ctx_db.TBL_T_NOTULENs.Where(d => d.PID_NOTULEN.Equals(sTBL.PID_NOTULEN)).FirstOrDefault();
                        p_ctx_db.TBL_T_NOTULENs.DeleteOnSubmit(iTbl);
                        p_ctx_db.SubmitChanges();
                        iRemarks = "Delete Success.!";

                    }
                }
                return Json(new { status = true, Remarks = iRemarks });
            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString(), status = false }, JsonRequestBehavior.AllowGet);
            }
        }




        [HttpPost]
        public JsonResult ReadPelaporVIP(string sTgl, int take, int skip, IEnumerable<Kendo.DynamicLinq.Sort> sort, Kendo.DynamicLinq.Filter filter)
        {
            try
            {
                if (sTgl == null)
                {
                    IQueryable<VW_PELAPOR_VIP> iVW_PELAPOR_VIP = p_ctx_db.VW_PELAPOR_VIPs;
                    return Json(iVW_PELAPOR_VIP.OrderByDescending(s => s.TANGGAL).ToDataSourceResult(take, skip, sort, filter));
                }
                else
                {
                    IQueryable<VW_PELAPOR_VIP> iVW_PELAPOR_VIP = p_ctx_db.VW_PELAPOR_VIPs.Where(s => s.TANGGAL.Equals(sTgl));
                    return Json(iVW_PELAPOR_VIP.OrderByDescending(s => s.TANGGAL).ToDataSourceResult(take, skip, sort, filter));
                }
            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult ReadDetailVIP(int take, int skip, IEnumerable<Kendo.DynamicLinq.Sort> sort, Kendo.DynamicLinq.Filter filter)
        {
            try
            {
                IQueryable<VW_DETAIL_VIP> iVW_DETAIL_VIP = p_ctx_db.VW_DETAIL_VIPs;
                return Json(iVW_DETAIL_VIP.ToDataSourceResult(take, skip, sort, filter));
            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult UpdatePelaporVIP(TBL_T_PELAPOR_VIP sTBL)
        {
            try
            {
                iRemarks = "Anda Tidak Memiliki Akses.!";
                pv_LoadUser();
                if (p_Nama != null)
                {
                    var iTbl = p_ctx_db.TBL_T_PELAPOR_VIPs.Where(s => s.PID_PELAPOR_VIP.Equals(sTBL.PID_PELAPOR_VIP)).FirstOrDefault();
                    if (iTbl == null)
                    {
                        sTBL.PID_PELAPOR_VIP = Guid.NewGuid().ToString();
                        sTBL.CREATE_DATE = DateTime.Now;
                        sTBL.CREATE_BY = p_Nrp;
                        sTBL.MODIFIED_DATE = DateTime.Now;
                        sTBL.MODIFIED_BY = p_Nrp;

                        p_ctx_db.TBL_T_PELAPOR_VIPs.InsertOnSubmit(sTBL);
                        p_ctx_db.SubmitChanges();
                        iRemarks = "Success.!";
                    }
                    else
                    {
                        iTbl.ACTUAL = sTBL.ACTUAL;
                        iTbl.KET = sTBL.KET;

                        iTbl.MODIFIED_DATE = DateTime.Now;
                        iTbl.MODIFIED_BY = p_Nrp;

                        p_ctx_db.SubmitChanges();
                        iRemarks = "Success.!";
                    }
                }

                return Json(new { status = true, Remarks = iRemarks });

            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString(), status = false }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult DeletePelaporVIP(TBL_T_PELAPOR_VIP sTBL)
        {
            try
            {
                iRemarks = "Anda Tidak Memiliki Akses.!";
                pv_LoadUser();
                if (p_Nama != null)
                {
                    if (sTBL.PID_PELAPOR_VIP != null)
                    {
                        var iTbl = p_ctx_db.TBL_T_PELAPOR_VIPs.Where(d => d.PID_PELAPOR_VIP.Equals(sTBL.PID_PELAPOR_VIP)).FirstOrDefault();
                        p_ctx_db.TBL_T_PELAPOR_VIPs.DeleteOnSubmit(iTbl);
                        p_ctx_db.SubmitChanges();
                        iRemarks = "Delete Success.!";

                    }
                }
                return Json(new { status = true, Remarks = iRemarks });
            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString(), status = false }, JsonRequestBehavior.AllowGet);
            }
        }




        [HttpPost]
        public JsonResult ReadMicroShearing(int take, int skip, IEnumerable<Kendo.DynamicLinq.Sort> sort, Kendo.DynamicLinq.Filter filter)
        {
            try
            {
                IQueryable<VW_MICRO_SHEARING> iVW_MICRO_SHEARING = p_ctx_db.VW_MICRO_SHEARINGs;
                return Json(iVW_MICRO_SHEARING.OrderByDescending(s => s.TANGGAL).ToDataSourceResult(take, skip, sort, filter));
            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult InsertMicroShearing(TBL_M_MICRO_SHEARING sTBL)
        {
            try
            {
                iRemarks = "Anda Tidak Memiliki Akses.!";
                pv_LoadUser();
                if (p_Nama != null)
                {
                    sTBL.PID_MICRO_SHEARING = Guid.NewGuid().ToString();
                    //sTBL.CREATE_DATE = DateTime.Now;
                    //sTBL.CREATE_BY = p_Nrp;
                    //sTBL.MODIFIED_DATE = DateTime.Now;
                    //sTBL.MODIFIED_BY = p_Nrp;

                    p_ctx_db.TBL_M_MICRO_SHEARINGs.InsertOnSubmit(sTBL);
                    p_ctx_db.SubmitChanges();
                    iRemarks = "Insert Success.!";
                }

                return Json(new { status = true, Remarks = iRemarks });

            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString(), status = false }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult UpdateMicroShearing(TBL_M_MICRO_SHEARING sTBL)
        {
            try
            {
                iRemarks = "Anda Tidak Memiliki Akses.!";
                pv_LoadUser();
                if (p_Nama != null)
                {
                    var iTbl = p_ctx_db.TBL_M_MICRO_SHEARINGs.Where(d => d.PID_MICRO_SHEARING.Equals(sTBL.PID_MICRO_SHEARING)).FirstOrDefault();
                    iTbl.TANGGAL = sTBL.TANGGAL;
                    iTbl.PENULIS = sTBL.PENULIS;
                    iTbl.TEMA = sTBL.TEMA;
                    iTbl.ISI = sTBL.ISI;

                    p_ctx_db.SubmitChanges();
                    iRemarks = "Update Success.!";
                }

                return Json(new { status = true, Remarks = iRemarks });

            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString(), status = false }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult DeleteMicroShearing(TBL_M_MICRO_SHEARING sTBL)
        {
            try
            {
                iRemarks = "Anda Tidak Memiliki Akses.!";
                pv_LoadUser();
                if (p_Nama != null)
                {
                    var iTbl = p_ctx_db.TBL_M_MICRO_SHEARINGs.Where(d => d.PID_MICRO_SHEARING.Equals(sTBL.PID_MICRO_SHEARING)).FirstOrDefault();
                    p_ctx_db.TBL_M_MICRO_SHEARINGs.DeleteOnSubmit(iTbl);
                    p_ctx_db.SubmitChanges();
                    iRemarks = "Delete Success.!";
                }
                return Json(new { status = true, Remarks = iRemarks });
            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString(), status = false }, JsonRequestBehavior.AllowGet);
            }
        }

        //UPLOAD
        [HttpPost]
        public async Task<JsonResult> UploadCSVMicroShearing()
        {
            DataTable dt = new DataTable();
            var iStrRemark = string.Empty;
            var istatus = false;
            string sStrsessionUpload = Guid.NewGuid().ToString();

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
                        //var fileName = DateTime.Now.ToBinary().ToString() + fileContent.FileName;// Path.GetFileName(file);
                        var fileName = fileContent.FileName;
                        //UNTUK IE
                        if (fileName.LastIndexOf("\\") > 0)
                        {
                            //fileName = DateTime.Now.ToBinary().ToString() + fileName.Substring(fileName.LastIndexOf("\\") + 1);
                            fileName = fileName.Substring(fileName.LastIndexOf("\\") + 1);
                        }
                        var iPath = Server.MapPath("~/UploadFile/Template/");
                        var path = Path.Combine(iPath, fileName);
                        var iExt = path.Substring(path.LastIndexOf(".") + 0);
                        if (iExt == ".csv")
                        {
                            DeleteFile(iPath);
                            fileContent.SaveAs(path);
                            dt = ProcessCSVMicroShearing(path, sStrsessionUpload, p_Nrp);
                            iStrRemark = ProcessBulkCopyMicroShearing(dt);
                            p_ctx_db.cusp_RemarksToMicroShearingTemp(sStrsessionUpload);
                            p_ctx_db.Dispose();

                            iStrRemark = "Upload Berhasil";
                            istatus = true;
                        }
                        else
                        {
                            iStrRemark = "File harus '.csv'";
                        }
                    }
                }
            }
            catch (Exception e)
            {
                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return this.Json(new { status = istatus, remarks = e.Message.ToString() }, JsonRequestBehavior.AllowGet);
            }
            return this.Json(new { status = true, remarks = iStrRemark, iStrSesUpload = sStrsessionUpload }, JsonRequestBehavior.AllowGet);
        }
        private static DataTable ProcessCSVMicroShearing(string fileName, string sSessUpload, string sNrp)
        {
            //Set up our variables
            string Feedback = string.Empty;
            string line = string.Empty;
            string[] strArray;
            List<string> strList;

            DataTable dt = new DataTable();
            DataRow row;
            // work out where we should split on comma, but not in a sentence
            Regex r = new Regex(";");
            //Set the filename in to our stream
            StreamReader sr = new StreamReader(fileName);

            //Read the first line and split the string at , with our regular expression in to an array
            line = sr.ReadLine();
            strList = r.Split(line).ToList();
            //strList.Insert(0, "LINE");

            strList.Insert(0, "SESSION_UPLOAD");
            //strList.Insert(0, "UPLOAD_DATE");
            //strList.Insert(0, "UPLOAD_BY");
            strList.Insert(0, "PID_MICRO_SHEARING");
            //strList.Insert(0, "DSTRCT_CODE");
            //strList.Add("TYPE");

            //strArray = r.Split(line);
            strArray = strList.ToArray();

            //For each item in the new split array, dynamically builds our Data columns. Save us having to worry about it.
            Array.ForEach(strArray, s => dt.Columns.Add(new DataColumn()));

            //Read each line in the CVS file until it’s empty
            while ((line = sr.ReadLine()) != null)
            {
                row = dt.NewRow();

                //add our current value to our data row
                line = string.Format("{0};{1};{2}", sSessUpload, Guid.NewGuid().ToString(), line);
                row.ItemArray = r.Split(line);
                dt.Rows.Add(row);
            }

            //Tidy Streameader up
            sr.Dispose();

            //return a the new DataTable
            return dt;
        }
        private static String ProcessBulkCopyMicroShearing(DataTable dt)
        {
            string Feedback = string.Empty;
            string connString = ConfigurationManager.ConnectionStrings["DB_NANOConnectionString"].ConnectionString;

            //make our connection and dispose at the end
            using (SqlConnection conn = new SqlConnection(connString))
            {
                //make our command and dispose at the end
                using (var copy = new SqlBulkCopy(conn))
                {
                    //Open our connection
                    conn.Open();
                    ///Set target table and tell the number of rows
                    copy.DestinationTableName = "NANO.TBL_M_MICRO_SHEARING_TEMP";
                    copy.BatchSize = dt.Rows.Count;
                    try
                    {
                        //Send it to the server
                        copy.WriteToServer(dt);
                        Feedback = "Upload complete";
                    }
                    catch (Exception ex)
                    {
                        Feedback = ex.Message;
                    }
                }
            }
            return Feedback;
        }
        private static String DeleteFile(string sPath)
        {
            System.IO.DirectoryInfo di = new DirectoryInfo(sPath);
            foreach (FileInfo file in di.GetFiles("*.csv"))
            {
                var idateNow = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString();
                var icsvfile = file.CreationTime.Year.ToString() + file.CreationTime.Month.ToString() + file.CreationTime.Day.ToString();
                if (Convert.ToInt32(icsvfile) < Convert.ToInt32(idateNow))
                {
                    file.Delete();
                }
            }
            return sPath;
        }

        [HttpPost]
        public JsonResult ReadUploadMicroShearing(string sStrSesUpload, int take, int skip, IEnumerable<Kendo.DynamicLinq.Sort> sort, Kendo.DynamicLinq.Filter filter)
        {
            try
            {
                IQueryable<TBL_M_MICRO_SHEARING_TEMP> iTBL_M_MICRO_SHEARING_TEMP = p_ctx_db.TBL_M_MICRO_SHEARING_TEMPs.Where(d => d.SESSION_UPLOAD.Equals(sStrSesUpload));
                return Json(iTBL_M_MICRO_SHEARING_TEMP.OrderByDescending(s => s.TANGGAL).ToDataSourceResult(take, skip, sort, filter));
            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public ActionResult saveUploadMicroShearing(string sStrSession)
        {
            pv_LoadUser();
            try
            {
                p_ctx_db.cusp_saveUploadMicroShearing(sStrSession, p_Nrp);
                iRemarks = "Save Success.";
                return Json(new { status = true, remarks = iRemarks, error = iRemarks }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                iRemarks = "Gagal";
                return Json(new { error = e.ToString(), remarks = iRemarks, status = false });
            }
        }



        [HttpPost]
        public JsonResult ReadDetailPIC(int take, int skip, IEnumerable<Kendo.DynamicLinq.Sort> sort, Kendo.DynamicLinq.Filter filter)
        {
            try
            {
                IQueryable<VW_DETAIL_PIC> iVW_DETAIL_PIC = p_ctx_db.VW_DETAIL_PICs;
                return Json(iVW_DETAIL_PIC.OrderByDescending(o => o.JML_PIC).ToDataSourceResult(take, skip, sort, filter));
            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult ReadGaleryFoto()
        {
            try
            {
                IQueryable<VW_TBL_T_GALERY> itemFoto = p_ctx_db.VW_TBL_T_GALERies.OrderByDescending(s=>s.CREATE_DATE);
                return Json(itemFoto);
                //var iPath = Server.MapPath("~/Images/Galery/");
                //System.IO.DirectoryInfo iFoto = new DirectoryInfo(iPath);
                //List<string> iList = new List<string>();
                //List<ItemFoto> iItemFoto = new List<ItemFoto>();

                //foreach (FileInfo file in iFoto.GetFiles())
                //{
                //    ItemFoto iNewItemFoto = new ItemFoto();
                //    iNewItemFoto.name = file.Name;

                //    iItemFoto.Add(iNewItemFoto);

                //}
                //IQueryable<ItemFoto> itemFoto = iItemFoto.AsQueryable();
            }
            catch (Exception e)
            {
                return this.Json(new { remarks = e.ToString(), error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public async Task<JsonResult> uploadFoto(string sDescFoto)
        {
            var iStrRemark = string.Empty;
            var istatus = false;
            //string sStrsessionUpload = Guid.NewGuid().ToString();
            pv_LoadUser();
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
                        var fileName = "NANO_" + DateTime.Now.ToString().Replace("/", "").Replace(":", ".").Replace(" ", "_") + "." + DateTime.Now.Millisecond;// +fileContent.FileName;// Path.GetFileName(file);
                        var fileName2 = fileContent.FileName;
                        //UNTUK IE
                        if (fileName.LastIndexOf("\\") > 0)
                        {
                            fileName = "NANO_" + DateTime.Now.ToString().Replace("/", "").Replace(":", ".").Replace(" ", "_") + "." + DateTime.Now.Millisecond;// +fileName.Substring(fileName.LastIndexOf("\\") + 1);
                            fileName2 = fileName2.Substring(fileName2.LastIndexOf("\\") + 1);
                        }
                        var iPath = Server.MapPath("~/Images/Galery/");
                        var iExt = fileName2.Substring(fileName2.LastIndexOf(".") + 0);

                        var path = Path.Combine(iPath, fileName + iExt);

                        fileContent.SaveAs(path);

                        //insert in database
                        //var path_File = System.Configuration.ConfigurationManager.AppSettings["urlAppPath"].ToString() + "Images/Galery/" + fileName + iExt;
                        //var path_File =  fileName + iExt;
                        TBL_T_GALERY iGalery = new TBL_T_GALERY();
                        iGalery.PID_GALERY = Guid.NewGuid().ToString();
                        iGalery.FILE_PATH = fileName + iExt;
                        iGalery.FILE_DESC = sDescFoto;

                        iGalery.CREATE_BY = p_Nrp;
                        iGalery.CREATE_DATE = DateTime.Now;
                        iGalery.MODIFIED_BY = p_Nrp;
                        iGalery.MODIFIED_DATE = DateTime.Now;

                        p_ctx_db.TBL_T_GALERies.InsertOnSubmit(iGalery);
                        p_ctx_db.SubmitChanges();

                    }
                }
                iStrRemark = "Upload Berhasil";
                istatus = true;
            }
            catch (Exception e)
            {
                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return this.Json(new { status = istatus, remarks = e.Message.ToString() }, JsonRequestBehavior.AllowGet);
            }
            return this.Json(new { status = true, remarks = iStrRemark }, JsonRequestBehavior.AllowGet);
        }



        [HttpPost]
        public JsonResult ReadEmployee(int take, int skip, IEnumerable<Kendo.DynamicLinq.Sort> sort, Kendo.DynamicLinq.Filter filter)
        {
            try
            {
                IQueryable<VW_ANGGOTA> iVW_ANGGOTA = p_ctx_db.VW_ANGGOTAs;
                return Json(iVW_ANGGOTA.OrderBy(o => o.NAMA).ToDataSourceResult(take, skip, sort, filter));
            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpPost]
        public JsonResult InsertEmployee(VW_ANGGOTA sTBL)
        {
            try
            {
                iRemarks = "Anda Tidak Memiliki Akses.!";
                pv_LoadUser();
                if (p_Nama != null)
                {
                    //TBL_M_EMPLOYEE_NANO
                    var iPID = Guid.NewGuid().ToString();
                    var iTBL_M_EMPLOYEE_NANO = new TBL_M_EMPLOYEE_NANO();
                    iTBL_M_EMPLOYEE_NANO.PID_EMPLOYEE = iPID;
                    iTBL_M_EMPLOYEE_NANO.NRP = sTBL.NRP;
                    iTBL_M_EMPLOYEE_NANO.NAMA = sTBL.NAMA;
                    iTBL_M_EMPLOYEE_NANO.COMP_USER = sTBL.COMP_USER;
                    iTBL_M_EMPLOYEE_NANO.STATUS = sTBL.STATUS;
                    iTBL_M_EMPLOYEE_NANO.KET = sTBL.KET;
                    iTBL_M_EMPLOYEE_NANO.TGL_JOIN = sTBL.TGL_JOIN;
                    iTBL_M_EMPLOYEE_NANO.CREATE_DATE = DateTime.Now;
                    iTBL_M_EMPLOYEE_NANO.CREATE_BY = p_Nrp;
                    iTBL_M_EMPLOYEE_NANO.MODIFIED_DATE = DateTime.Now;
                    iTBL_M_EMPLOYEE_NANO.MODIFIED_BY = p_Nrp;
                    p_ctx_db.TBL_M_EMPLOYEE_NANOs.InsertOnSubmit(iTBL_M_EMPLOYEE_NANO);

                    //TBL_M_ABOUT_PERSON
                    var iTBL_M_ABOUT_PERSON = new TBL_M_ABOUT_PERSON();
                    iTBL_M_ABOUT_PERSON.PID_PERSON = iPID;
                    iTBL_M_ABOUT_PERSON.NRP = sTBL.NRP;
                    iTBL_M_ABOUT_PERSON.JABATAN = sTBL.JABATAN;
                    iTBL_M_ABOUT_PERSON.SORT = sTBL.SORT;
                    iTBL_M_ABOUT_PERSON.MODIFIED_BY = p_Nrp;
                    iTBL_M_ABOUT_PERSON.MODIFIED_DATE = DateTime.Now;
                    p_ctx_db.TBL_M_ABOUT_PERSONs.InsertOnSubmit(iTBL_M_ABOUT_PERSON);

                    ////TBL_R_PELAPOR_VIP
                    //var iTBL_R_PELAPOR_VIP = new TBL_R_PELAPOR_VIP();
                    //iTBL_R_PELAPOR_VIP.PID_PELAPOR = sTBL.PID_EMPLOYEE;
                    //iTBL_R_PELAPOR_VIP.UTAMA = sTBL.NRP;
                    //iTBL_R_PELAPOR_VIP.URUTAN = p_ctx_db.TBL_R_PELAPOR_VIPs.Max(d => d.URUTAN) + 1;
                    //iTBL_R_PELAPOR_VIP.CREATE_DATE = DateTime.Now;
                    //iTBL_R_PELAPOR_VIP.CREATE_BY = p_Nrp;
                    //iTBL_R_PELAPOR_VIP.MODIFIED_DATE = DateTime.Now;
                    //iTBL_R_PELAPOR_VIP.MODIFIED_BY = p_Nrp;
                    //p_ctx_db.TBL_R_PELAPOR_VIPs.InsertOnSubmit(iTBL_R_PELAPOR_VIP);

                    p_ctx_db.SubmitChanges();
                    iRemarks = "Insert Success.!";
                }

                return Json(new { status = true, Remarks = iRemarks });

            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString(), status = false }, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpPost]
        public JsonResult UpdateEmployee(VW_ANGGOTA sTBL)
        {
            try
            {
                iRemarks = "Anda Tidak Memiliki Akses.!";
                pv_LoadUser();
                if (p_Nama != null)
                {
                    //TBL_M_EMPLOYEE_NANO
                    var iTbl = p_ctx_db.TBL_M_EMPLOYEE_NANOs.Where(d => d.PID_EMPLOYEE.Equals(sTBL.PID_EMPLOYEE)).FirstOrDefault();
                    iTbl.NRP = sTBL.NRP;
                    iTbl.NAMA = sTBL.NAMA;
                    iTbl.COMP_USER = sTBL.COMP_USER;
                    iTbl.TGL_JOIN = sTBL.TGL_JOIN;
                    iTbl.STATUS = sTBL.STATUS;
                    iTbl.KET = sTBL.KET;
                    iTbl.MODIFIED_BY = p_Nrp;
                    iTbl.MODIFIED_DATE = DateTime.Now;

                    //TBL_M_ABOUT_PERSON
                    var iTBL_M_ABOUT_PERSON = p_ctx_db.TBL_M_ABOUT_PERSONs.Where(d => d.PID_PERSON.Equals(sTBL.PID_EMPLOYEE)).FirstOrDefault();
                    iTBL_M_ABOUT_PERSON.NRP = sTBL.NRP;
                    iTBL_M_ABOUT_PERSON.JABATAN = sTBL.JABATAN;
                    iTBL_M_ABOUT_PERSON.SORT = sTBL.SORT;
                    iTBL_M_ABOUT_PERSON.MODIFIED_BY = p_Nrp;
                    iTBL_M_ABOUT_PERSON.MODIFIED_DATE = DateTime.Now;

                    ////TBL_R_PELAPOR_VIP
                    //var iTBL_R_PELAPOR_VIP = p_ctx_db.TBL_R_PELAPOR_VIPs.Where(d => d.PID_PELAPOR.Equals(sTBL.PID_EMPLOYEE)).FirstOrDefault();
                    //iTBL_R_PELAPOR_VIP.UTAMA = sTBL.NRP;
                    ////iTBL_R_PELAPOR_VIP.URUTAN = sTBL.;
                    //iTBL_R_PELAPOR_VIP.CREATE_DATE = DateTime.Now;
                    //iTBL_R_PELAPOR_VIP.CREATE_BY = p_Nrp;
                    //iTBL_R_PELAPOR_VIP.MODIFIED_DATE = DateTime.Now;
                    //iTBL_R_PELAPOR_VIP.MODIFIED_BY = p_Nrp;



                    p_ctx_db.SubmitChanges();
                    iRemarks = "Update Success.!";
                }

                return Json(new { status = true, Remarks = iRemarks });

            }
            catch (Exception e)
            {
                return this.Json(new { error = e.ToString(), status = false }, JsonRequestBehavior.AllowGet);
            }
        }
        //[HttpPost]
        //public JsonResult DeleteEmployee(VW_ANGGOTA sTBL)
        //{
        //    try
        //    {
        //        iRemarks = "Anda Tidak Memiliki Akses.!";
        //        pv_LoadUser();
        //        if (p_Nama != null)
        //        {
        //            var iTbl = p_ctx_db.TBL_M_EMPLOYEE_NANOs.Where(d => d.PID_EMPLOYEE.Equals(sTBL.PID_EMPLOYEE)).FirstOrDefault();
        //            p_ctx_db.TBL_M_EMPLOYEE_NANOs.DeleteOnSubmit(iTbl);
        //            p_ctx_db.SubmitChanges();
        //            iRemarks = "Delete Success.!";
        //        }
        //        return Json(new { status = true, Remarks = iRemarks });
        //    }
        //    catch (Exception e)
        //    {
        //        return this.Json(new { error = e.ToString(), status = false }, JsonRequestBehavior.AllowGet);
        //    }
        //}




    }
}