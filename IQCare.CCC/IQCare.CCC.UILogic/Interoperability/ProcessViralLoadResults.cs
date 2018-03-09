﻿using IQCare.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using Entities.CCC.Encounter;
using IQCare.CCC.UILogic.Visit;

namespace IQCare.CCC.UILogic.Interoperability
{
    public class ProcessViralLoadResults
    {
        private string Msg { get; set; }
        //int _userId = Convert.ToInt32(HttpContext.Current.Session["AppUserId"]);
        //int _facilityId = Convert.ToInt32(HttpContext.Current.Session["AppLocationId"]);
        public string Save(ViralLoadResultsDto viralLoadResults)
        {
            List<LabOrderEntity> labOrder = null;
            List<LabDetailsEntity> labDetails = null;
            var results = viralLoadResults.ViralLoadResult;
            if (results != null)
            {
                try
                {
                    var patientLookup = new PatientLookupManager();
                    var labOrderManager = new PatientLabOrderManager();
                    var patientCcc = viralLoadResults.PatientIdentification.INTERNAL_PATIENT_ID.FirstOrDefault(n => n.IdentifierType == "CCC_NUMBER").IdentifierValue;
                    var patient = patientLookup.GetPatientByCccNumber(patientCcc);
                    if (patient != null)
                    {
                        
                        //todo brian check
                        labOrder = labOrderManager.GetPatientLabOrdersByDate((int) patient.ptn_pk,results.FirstOrDefault().DateSampleCollected);
                        labDetails = labOrderManager.GetPatientLabDetailsByDate(labOrder.FirstOrDefault().Id, results.FirstOrDefault().DateSampleCollected);
                        
                        if (labOrder.Count == 0)
                        {
                            var patientMasterVisitManager = new PatientMasterVisitManager();
                            var lookupLogic = new LookupLogic();
                            var visitType = lookupLogic.GetItemIdByGroupAndItemName("VisitType", "Enrollment")[0].ItemId;
                            int patientMasterVisitId = patientMasterVisitManager.AddPatientMasterVisit(patient.Id, 1, visitType);
                            var listLabOrder = new List<ListLabOrder>();
                            var order = new ListLabOrder()
                            {
                                FacilityId = Convert.ToInt32(viralLoadResults.MesssageHeader.ReceivingFacility),
                                LabName = results.FirstOrDefault().LabTestedIn,
                                LabNameId = 3,
                                LabNotes = results.FirstOrDefault().Regimen + " " + results.FirstOrDefault().SampleType,
                                LabOrderDate = results.FirstOrDefault().DateSampleCollected,
                                LabOrderId = 0,
                                OrderReason = "",
                                Results = results.FirstOrDefault().VlResult,
                                VisitId = patientMasterVisitId
                            };
                            listLabOrder.Add(order);
                            var jss = new JavaScriptSerializer();
                            string patientLabOrder = jss.Serialize(listLabOrder);
                            //include userid and facility ID
                            labOrderManager.savePatientLabOrder(patient.Id, (int)patient.ptn_pk, 1, 209, 203, patientMasterVisitId, DateTime.Today.ToString(), "IL lab order", patientLabOrder,"completed");
                            labOrder = labOrderManager.GetPatientLabOrdersByDate((int)patient.ptn_pk, DateTime.Today);
                            labDetails = labOrderManager.GetPatientLabDetailsByDate(labOrder.FirstOrDefault().Id, DateTime.Today);
                        }

                        if (labOrder.FirstOrDefault() != null)
                        {
                            foreach (var result in results)
                            {
                                var labOrd = labOrder.FirstOrDefault();
                                if (labOrd != null)
                                {
                                    var labResults = new LabResultsEntity()
                                    {
                                        //todo remove hard coding
                                        LabOrderId = labOrd.Id,
                                        LabOrderTestId = labDetails.FirstOrDefault().Id,
                                        ParameterId = 3,
                                        LabTestId = 0,
                                        ResultValue = Convert.ToDecimal(result.VlResult),
                                        ResultUnit = "copies/ml",
                                        ResultUnitId = 129,
                                    };
                                    labOrderManager.AddPatientLabResults(labResults);
                                }
                            }
                        Msg = "Sucess";
                        }
                        //todo update laborder and lab details entities
                        Msg = "Lab order not found";
                    }
                    else
                    {
                        Msg = "Patient does not exist";
                        return Msg;
                    }
                }
                catch (Exception e)
                {
                    Msg = "error " + e.Message;
                }
            }
            else
            {
                Msg = "Message does not contain results";
            }
            
            return Msg;
        }

        public string Update(ViralLoadResultsDto viralLoadResults)
        {
            try
            {
                Msg = "Sucess";
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                Msg = "error " + e.Message;
            }
            return Msg;
        }
    }
}