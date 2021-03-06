﻿using System.Collections.Generic;
using DataAccess.Context;
using Entities.CCC.Tb;

namespace DataAccess.CCC.Interface.Tb
{
    public interface IPatientIptWorkupRepository : IRepository<PatientIptWorkup>
    {
        List<PatientIptWorkup> GetByPatientId(int patientId);
    }
}