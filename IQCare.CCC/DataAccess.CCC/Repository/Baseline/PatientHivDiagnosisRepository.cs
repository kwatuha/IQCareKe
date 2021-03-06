﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess.CCC.Context;
using DataAccess.CCC.Interface.Baseline;
using DataAccess.Context;
using Entities.CCC.Baseline;

namespace DataAccess.CCC.Repository.Baseline
{
    public class PatientHivDiagnosisRepository:BaseRepository<PatientHivDiagnosis>,IPatientHivDiagnosisRepository
    {
        private readonly GreencardContext _context;

        public PatientHivDiagnosisRepository() : this(new GreencardContext())
        {
            
        }

        public PatientHivDiagnosisRepository(GreencardContext context) : base(context)
        {
            _context = context;
        } 
    }
}
