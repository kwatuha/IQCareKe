﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities.CCC.Encounter;

namespace Interface.CCC.Encounter
{
    public interface IPatientCareEnding
    {
        int AddPatientCareEnding(PatientCareEnding patientCareEnding);
        List<PatientCareEnding> GetPatientCareEndings(int patientId);
    }
}