﻿using Application.Presentation;
using Entities.CCC.Lookup;
using Interface.CCC.Lookup;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;
using Entities.CCC.Enrollment;
using IQCare.CCC.UILogic.Enrollment;

namespace IQCare.Web.CCC.Encounter
{
    public partial class ArtDistributionForm : System.Web.UI.Page
    {
        public int PatientId;
        public int PatientMasterVisitId;
        public string Gender;
        public int IsPatientArtDistributionDone { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ILookupManager mgr = (ILookupManager)ObjectFactory.CreateInstance("BusinessProcess.CCC.BLookupManager, BusinessProcess.CCC");
            GetSessionDetails();
            pregnancySection.Visible = Gender != "Male";
            List<LookupItemView> areas = mgr.GetLookItemByGroup("PregnancyStatus");
            List<LookupItemView> artRefillModels = mgr.GetLookItemByGroup("ARTRefillModel");

            if (areas != null && areas.Count > 0)
            {
                pregnancyStatus.Items.Add(new ListItem("select", "0"));
                foreach (var k in areas)
                {
                    pregnancyStatus.Items.Add(new ListItem(k.ItemDisplayName, k.ItemId.ToString()));
                }
            }

            if (artRefillModels != null && artRefillModels.Count > 0)
            {
                ArtRefill.Items.Add(new ListItem("select", ""));
                foreach (var item in artRefillModels)
                {
                    ArtRefill.Items.Add(new ListItem(item.ItemDisplayName, item.ItemId.ToString()));
                }
            }


            PatientArtDistributionManager artDistributionManager = new PatientArtDistributionManager();
            PatientArtDistribution artDistribution = artDistributionManager.GetPatientArtDistributionByPatientIdAndVisitId(PatientId, PatientMasterVisitId);
            if (artDistribution != null)
            {
                IsPatientArtDistributionDone = 1;
            }
        }
        private void GetSessionDetails()
        {
            PatientId = Convert.ToInt32(HttpContext.Current.Session["PatientPK"]);
            PatientMasterVisitId = Convert.ToInt32(HttpContext.Current.Session["PatientMasterVisitId"]);
            Gender = Convert.ToString(HttpContext.Current.Session["Gender"]);
        }
    }
}