﻿using System;
using System.Collections.Generic;
using Application.Presentation;
using Entities.CCC.Encounter;
using Interface.CCC.Encounter;

namespace IQCare.CCC.UILogic
{
    public class PatientCareEndingManager
    {
        private IPatientCareEnding mgr =
            (IPatientCareEnding)
            ObjectFactory.CreateInstance("BusinessProcess.CCC.BPatientCareEnding, BusinessProcess.CCC");

        public int AddPatientCareEnding(int patientId, int patientMasterVisitId, int patientEnrollmentId, int exitReason, DateTime exitDate, string careEndingNotes)
        {
            PatientCareEnding patientCareEnding = new PatientCareEnding()
            {
                PatientId = patientId,
                PatientMasterVisitId = patientMasterVisitId,
                PatientEnrollmentId = patientEnrollmentId,
                ExitReason = exitReason,
                ExitDate = exitDate,
                CareEndingNotes = careEndingNotes
            };

            return mgr.AddPatientCareEnding(patientCareEnding);
        }

        public List<PatientCareEnding> GetPatientCareEndings(int patientId )
        {
            return mgr.GetPatientCareEndings(patientId);
        }
    }
}
