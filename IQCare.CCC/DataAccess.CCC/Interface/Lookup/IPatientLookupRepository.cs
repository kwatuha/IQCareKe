﻿using System;
using System.Collections.Generic;
using DataAccess.Context;
using Entities.CCC.Lookup;

namespace DataAccess.CCC.Interface.Lookup
{
    public interface IPatientLookupRepository : IRepository<PatientLookup>
    {
        PatientLookup GetGenderId(int patientId);
        PatientLookup GetPatientById(int patientId);
    }
}
