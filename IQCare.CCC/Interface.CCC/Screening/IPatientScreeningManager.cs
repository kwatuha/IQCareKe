﻿using Entities.CCC.Screening;
using System.Collections.Generic;

namespace Interface.CCC.Screening
{
    public interface IPatientScreeningManager
    {
        int AddPatientScreening(PatientScreening a);
        int UpdatePatientScreening(PatientScreening u);
        int DeletePatientScreening(int Id);
        List<PatientScreening> GetPatientScreening(int patientId);
        int CheckIfPatientScreeningExists(int patientId);
    }
}
