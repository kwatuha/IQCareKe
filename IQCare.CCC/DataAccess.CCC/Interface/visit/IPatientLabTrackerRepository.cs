﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess.Context;
using Entities.CCC.Visit;

namespace DataAccess.CCC.Interface.visit
{
    public interface IPatientLabTrackerRepository : IRepository<PatientLabTracker>
    {
        List<PatientLabTracker> GetVlPendingCount(int facilityId);
        List<PatientLabTracker> GetVlCompleteCount(int facilityId);
        
    }
}
