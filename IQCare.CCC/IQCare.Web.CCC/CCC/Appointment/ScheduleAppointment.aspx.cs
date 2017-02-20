﻿using Application.Presentation;
using Entities.CCC.Lookup;
using Entities.CCC.Visit;
using Interface.CCC.Lookup;
using Interface.CCC.Visit;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;

namespace IQCare.Web.CCC.Appointment
{
    public partial class ScheduleAppointment : System.Web.UI.Page
    {
        
        protected int PatientId
        {
            get { return Convert.ToInt32(Session["patientId"]); } 

        }

        protected int PatientMasterVisitId
        {
            get { return Convert.ToInt32(Session["patientMasterVisitId"]); }
        }

        private IPatientMasterVisitManager _visitManager = (IPatientMasterVisitManager)ObjectFactory.CreateInstance("BusinessProcess.CCC.visit.BPatientmasterVisit, BusinessProcess.CCC");
        public int PatientId;
        public int PatientMasterVisitId;
        private readonly IPatientMasterVisitManager _visitManager = (IPatientMasterVisitManager)ObjectFactory.CreateInstance("BusinessProcess.CCC.visit.BPatientmasterVisit, BusinessProcess.CCC");

        protected void Page_Load(object sender, EventArgs e)
        {
            this.GetSessionDetails();

            ILookupManager mgr = (ILookupManager)ObjectFactory.CreateInstance("BusinessProcess.CCC.BLookupManager, BusinessProcess.CCC");

            List<LookupItemView> statuses = mgr.GetLookItemByGroup("AppointmentStatus");
            if (statuses != null && statuses.Count > 0)
            {
                status.Items.Add(new ListItem("select", "0"));
                foreach (var k in statuses)
                {
                    status.Items.Add(new ListItem(k.ItemDisplayName, k.ItemId.ToString()));
                }
                status.SelectedIndex = 1;
                status.Enabled = false;
            }

            List<LookupItemView> areas = mgr.GetLookItemByGroup("ServiceArea");
            if (areas != null && areas.Count > 0)
            {
                ServiceArea.Items.Add(new ListItem("select", "0"));
                foreach (var k in areas)
                {
                    ServiceArea.Items.Add(new ListItem(k.ItemDisplayName, k.ItemId.ToString()));
                }
            }

            List<LookupItemView> reasons = mgr.GetLookItemByGroup("AppointmentReason");
            if (reasons != null && reasons.Count > 0)
            {
                Reason.Items.Add(new ListItem("select", "0"));
                foreach (var k in reasons)
                {
                    Reason.Items.Add(new ListItem(k.ItemDisplayName, k.ItemId.ToString()));
                }
            }
        }

        private void GetSessionDetails()
        {
           // PatientId = Convert.ToInt32(HttpContext.Current.Session["PatientId"]);
           // PatientMasterVisitId = Convert.ToInt32(HttpContext.Current.Session["patientMasterVisitId"]);
            if (PatientMasterVisitId == 0)
            {
                PatientMasterVisit visit = new PatientMasterVisit()
                {
                    PatientId = PatientId,
                    Start = DateTime.Now,
                    Active = true,
                };
                PatientMasterVisitId = _visitManager.AddPatientmasterVisit(visit);
            }
        }
    }
}