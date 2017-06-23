﻿using IQCare.CCC.UILogic.Screening;
using IQCare.CCC.UILogic.Triage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace IQCare.Web.CCC.WebService
{
    /// <summary>
    /// Summary description for TestWebservice
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 

    [System.Web.Script.Services.ScriptService]
    public class TestWebservice : System.Web.Services.WebService
    {
        private string jsonMessage;
        private int result=0;
        private int patientId;
        private int userId;
        private int patientMasterVisitId;

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod(EnableSession =true)]
        public string AddPatientPregnancyIndicator(int patientId, int patientMasterVisitId,DateTime visitDate, DateTime lmp, DateTime edd, int pregnancyStatusId, int ancProfile, DateTime ancProfileDate, int userId)
        {
            try
            {
                var patientPreganancyIndicator = new PatientPregnancyIndicatorManager();
               // userId= Convert.ToInt32(HttpContext.Current.Session["AppUserId"]);
                patientId = Convert.ToInt32(HttpContext.Current.Session["PatientPK"]);
                patientMasterVisitId = Convert.ToInt32(HttpContext.Current.Session["PatientmasterVisitId"]);

                result = patientPreganancyIndicator.AddPregnancyIndicator(patientId, patientMasterVisitId,visitDate, lmp, edd, pregnancyStatusId, ancProfile, ancProfileDate, Convert.ToInt32(HttpContext.Current.Session["AppUserId"]));
                jsonMessage=(result>0)? "Pregnancy Indicator added successfully" : "";
            }
            catch (Exception e)
            {
                jsonMessage = e.Message;
            }
            return jsonMessage;
        }

        [WebMethod(EnableSession = true)]
        public string AddPatientPregnancy(int patientId, int patientMasterVisitId, DateTime LMP, DateTime EDD, string gravidae, string parity, int outcome, DateTime dateOfOutcome, int userId)
        {
            try
            {
                var patientPregnancy = new PatientPregnancyManager();
                patientId = Convert.ToInt32(HttpContext.Current.Session["PatientPK"]);
                patientMasterVisitId = Convert.ToInt32(HttpContext.Current.Session["PatientmasterVisitId"]);

                result = patientPregnancy.AddPatientPregnancy(patientId, patientMasterVisitId, LMP, EDD, gravidae, parity, outcome, dateOfOutcome, Convert.ToInt32(HttpContext.Current.Session["AppUserId"]));
                jsonMessage = (result > 0) ? "Patient Pregnancy Added successfully!" : "";
            }
            catch (Exception e)
            {
                jsonMessage = e.Message;
            }
            return jsonMessage;
        }

        [WebMethod(EnableSession = true)]

        public string AddPatientFamilyPlanning(int patientId, int patientMasterVisitId, DateTime visitDate, int FamilyPlanningStatusId, int ReasonNoOnFp, int userId)
        {
            try
            {
                patientId = Convert.ToInt32(HttpContext.Current.Session["PatientPK"]);
                patientMasterVisitId = Convert.ToInt32(HttpContext.Current.Session["PatientmasterVisitId"]);

                var familyPlanning = new PatientFamilyPlanningManager();
                result = familyPlanning.AddFamilyPlanningStatus(patientId, patientMasterVisitId,visitDate, FamilyPlanningStatusId, ReasonNoOnFp, Convert.ToInt32(HttpContext.Current.Session["AppUserId"]));
                if(result>0)
                    Session["FamilyPlanningStatus"] = result;
                jsonMessage = (result > 0) ? "Family planning status added successfuly" : "";

            }
            catch (Exception e)
            {
                jsonMessage = e.Message;
            }
            return jsonMessage;
        }

        [WebMethod(EnableSession = true)]
        public string AddPatientFamilyPlanningMethod(int patientId, string PatientFPId, int userId)
        {
            try
            {
                patientId = Convert.ToInt32(HttpContext.Current.Session["PatientPK"]);
                patientMasterVisitId = Convert.ToInt32(HttpContext.Current.Session["PatientmasterVisitId"]);

                var fpMethod = new PatientFamilyPlanningMethodManager();
                int familyPlanningStatus = Convert.ToInt32(Session["FamilyPlanningStatus"].ToString());
                var familyPlanningMethods = JsonConvert.DeserializeObject<IEnumerable<object>>(PatientFPId);

                int count = familyPlanningMethods.Count();
                if (count > 0)
                {
                    foreach (var iteMethod in familyPlanningMethods)
                    {
                        result = fpMethod.AddFamilyPlanningMethod(patientId, familyPlanningStatus, Convert.ToInt32(iteMethod.ToString()), Convert.ToInt32(HttpContext.Current.Session["AppUserId"]));
                        jsonMessage = (result > 0) ? "family planning status addedd successfully" : "";
                    }
                    
                }

                
            }
            catch (Exception e)
            {
                jsonMessage = e.Message;
            }
            return jsonMessage;
        }

        [WebMethod(EnableSession = true)]
        public string AddPatientScreening(int patientId, int patientMasterVisitid, DateTime visitDate, int screeningTypeId, int screeningDone, DateTime screeningDate, int screeningCategoryId, int screeningValueId, string comment, int userId)
        {
            try
            {
                patientId = Convert.ToInt32(HttpContext.Current.Session["PatientPK"]);
                patientMasterVisitId = Convert.ToInt32(HttpContext.Current.Session["PatientmasterVisitId"]);

                var patientScreening = new PatientScreeningManager();
                result = patientScreening.AddPatientScreening(patientId, patientMasterVisitId,visitDate, screeningTypeId, screeningDone, screeningDate, screeningCategoryId, screeningValueId, comment, Convert.ToInt32(HttpContext.Current.Session["AppUserId"]));
                jsonMessage = (result > 0) ? "Patient screening addedd successfully!" : "";
            }
            catch (Exception e)
            {
                jsonMessage = e.Message;
            }
            return jsonMessage;
        }

        [WebMethod(EnableSession = true)]
        public int PregnancyExists(int patientId)
        {
            try
            {
                var patientPregnancy = new PatientPregnancyManager();
                patientId = Convert.ToInt32(HttpContext.Current.Session["PatientPK"]);
                result = patientPregnancy.CheckIfPatientPregnancyExisists(patientId);
            }
            catch (Exception e)
            {
                jsonMessage = e.Message;
            }
            return result;
        }
    }
}
