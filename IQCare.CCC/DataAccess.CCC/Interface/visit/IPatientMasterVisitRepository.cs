﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess.Context;
using Entities.CCC.Visit;

namespace DataAccess.CCC.Interface.visit
{
    public interface IPatientMasterVisitRepository:IRepository<PatientMasterVisit>
    {
        List<PatientMasterVisit> GetByDate(DateTime date);
    }
}
