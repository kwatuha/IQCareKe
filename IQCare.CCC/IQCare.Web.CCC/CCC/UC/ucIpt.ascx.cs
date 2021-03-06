﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Application.Presentation;
using Entities.CCC.Lookup;
using Interface.CCC.Lookup;

namespace IQCare.Web.CCC.UC
{
    public partial class ucIpt : System.Web.UI.UserControl
    {
        public int PatientId;
        public int PatientMasterVisitId;
        protected void Page_Load(object sender, EventArgs e)
        {
            ILookupManager mgr = (ILookupManager)ObjectFactory.CreateInstance("BusinessProcess.CCC.BLookupManager, BusinessProcess.CCC");

            List<LookupItemView> statuses = mgr.GetLookItemByGroup("AdheranceMeasurement");
            if (statuses != null && statuses.Count > 0)
            {
                adheranceMeasurement.Items.Add(new ListItem("select", "0"));
                foreach (var k in statuses)
                {
                    adheranceMeasurement.Items.Add(new ListItem(k.ItemDisplayName, k.ItemId.ToString()));
                }
                adheranceMeasurement.SelectedIndex = 0;
            }
        }
    }
}