﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.CCC.Enrollment;
using Entities.CCC.Interoperability;
using IQCare.CCC.UILogic.Enrollment;
using IQCare.DTO;

namespace IQCare.CCC.UILogic.Interoperability
{
    public class ProcessPatient
    {
        public string Update(int patientId, int? ptn_pk, DateTime dateOfBirth, string nationalId, int facilityId, string auditData, PatientEntryPoint entryPoints, int entryPointId, string entryPointAuditData, DateTime enrollmentDate, List<DTOIdentifier> internalPatientIdentifiers)
        {
            try
            {
                var patientManager = new PatientManager();
                var patientEntryPointManager = new PatientEntryPointManager();
                var patientIdentifierManager = new PatientIdentifierManager();
                var patientEnrollmentManager = new PatientEnrollmentManager();

                PatientEntity updatePatient = new PatientEntity();
                updatePatient.ptn_pk = ptn_pk;
                updatePatient.DateOfBirth = dateOfBirth;
                updatePatient.NationalId = nationalId;
                updatePatient.FacilityId = facilityId;
                updatePatient.AuditData = auditData;

                patientManager.UpdatePatient(updatePatient, patientId);

                if (entryPoints == null)
                {
                    patientEntryPointManager.addPatientEntryPoint(patientId, entryPointId, 1);
                }
                else
                {
                    entryPoints.EntryPointId = entryPointId;
                    entryPoints.AuditData = entryPointAuditData;
                    patientEntryPointManager.UpdatePatientEntryPoint(entryPoints);   
                }

                foreach (var item in internalPatientIdentifiers)
                {
                    if (item.IdentifierType == "CCC_NUMBER" && item.AssigningAuthority == "CCC")
                    {
                        var identifiersByPatientId = patientIdentifierManager.GetPatientEntityIdentifiersByPatientId(patientId, 1);

                        if (identifiersByPatientId.Count > 0)
                        {
                            foreach (var entityIdentifier in identifiersByPatientId)
                            {
                                int enrollmentId = entityIdentifier.PatientEnrollmentId;

                                PatientEntityEnrollment entityEnrollment = patientEnrollmentManager.GetPatientEntityEnrollment(enrollmentId);
                                List<PatientEntityEnrollment> listEnrollment = new List<PatientEntityEnrollment>();
                                listEnrollment.Add(entityEnrollment);
                                var enrollmentAuditData = AuditDataUtility.AuditDataUtility.Serializer(listEnrollment);

                                entityEnrollment.EnrollmentDate = enrollmentDate;
                                entityEnrollment.AuditData = enrollmentAuditData;

                                patientEnrollmentManager.updatePatientEnrollment(entityEnrollment);

                                var entityIdentifierAuditData = AuditDataUtility.AuditDataUtility.Serializer(identifiersByPatientId);
                                entityIdentifier.IdentifierValue = item.IdentifierValue;
                                entityIdentifier.AuditData = entityIdentifierAuditData;
                                patientIdentifierManager.UpdatePatientIdentifier(entityIdentifier);
                            }
                        }
                        else
                        {
                            int patientEnrollmentId = patientEnrollmentManager.addPatientEnrollment(patientId, enrollmentDate.ToString(), 1);
                            int patientEntryPointId = patientEntryPointManager.addPatientEntryPoint(patientId, entryPointId, 1);
                            int patientIdentifierId = patientIdentifierManager.addPatientIdentifier(patientId, patientEnrollmentId, 1, item.IdentifierValue);
                        }
                    }
                }

                return "Successfully updated patient";
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public static Registration Get(int patientId)
        {
            PatientMessageManager patientMessageManager = new PatientMessageManager();
            PatientMessage patientMessage = patientMessageManager.GetPatientMessageByEntityId(patientId);
            Registration registration = new Registration();

            if (patientMessage != null)
            {            
                DTOIdentifier identifier = new DTOIdentifier();

                identifier.IdentifierValue = patientMessage.IdentifierValue;
                identifier.IdentifierType = "CCC_NUMBER";
                identifier.AssigningAuthority = "CCC";
                if (registration.InternalPatientIdentifiers == null)
                {
                    registration.InternalPatientIdentifiers = new List<DTOIdentifier>();
                }
                registration.InternalPatientIdentifiers.Add(identifier);
                if (registration.Patient == null)
                {
                    registration.Patient = new DTOPerson();
                }

                registration.Patient.FirstName = !string.IsNullOrWhiteSpace(patientMessage.FIRST_NAME) ? patientMessage.FIRST_NAME: "";
                registration.Patient.MiddleName = !string.IsNullOrWhiteSpace(patientMessage.MIDDLE_NAME) ? patientMessage.MIDDLE_NAME : null;
                registration.Patient.LastName = !string.IsNullOrWhiteSpace(patientMessage.LAST_NAME) ? patientMessage.LAST_NAME : null;
                registration.Patient.DateOfBirth = !string.IsNullOrWhiteSpace(patientMessage.DATE_OF_BIRTH) ? patientMessage.DATE_OF_BIRTH : null;
                //registration.Patient.DobPrecision = patientMessage.
                registration.Patient.Sex = !string.IsNullOrWhiteSpace(patientMessage.SEX) ? patientMessage.SEX : null;
                registration.Patient.MobileNumber = !string.IsNullOrWhiteSpace(patientMessage.MobileNumber) ? patientMessage.MobileNumber : null;
                registration.Patient.PhysicalAddress = !string.IsNullOrWhiteSpace(patientMessage.PhysicalAddress) ? patientMessage.PhysicalAddress : null;
                registration.Patient.NationalId = !string.IsNullOrWhiteSpace(patientMessage.NATIONAL_ID) ? patientMessage.NATIONAL_ID : null;

                //registration.DateOfEnrollment = patientMessage.
                //registration.EntryPoint = patientMessage.
                registration.MotherMaidenName = null;
                registration.Village = !string.IsNullOrWhiteSpace(patientMessage.Village) ? patientMessage.Village : null;
                registration.Ward = !string.IsNullOrWhiteSpace(patientMessage.WardName) ? patientMessage.WardName : null;
                registration.SubCounty = !string.IsNullOrWhiteSpace(patientMessage.Subcountyname) ? patientMessage.Subcountyname : null;
                registration.County = !string.IsNullOrWhiteSpace(patientMessage.CountyName) ? patientMessage.CountyName : null;
                registration.MaritalStatus = !string.IsNullOrWhiteSpace(patientMessage.MARITAL_STATUS) ? patientMessage.MARITAL_STATUS : null;
                //registration.DateOfDeath = patientMessage.d
                //registration.DeathIndicator = null;

                if (registration.NextOfKin == null)
                {
                    registration.NextOfKin = new List<DTONextOfKin>();
                }

                if (!string.IsNullOrWhiteSpace(patientMessage.TFIRST_NAME) &&
                    !string.IsNullOrWhiteSpace(patientMessage.TLAST_NAME))
                {
                    DTONextOfKin treatmentSupporter = new DTONextOfKin();
                    treatmentSupporter.FirstName = !string.IsNullOrWhiteSpace(patientMessage.TFIRST_NAME) ? patientMessage.TFIRST_NAME : null;
                    treatmentSupporter.MiddleName = !string.IsNullOrWhiteSpace(patientMessage.TMIDDLE_NAME) ? patientMessage.TMIDDLE_NAME : null;
                    treatmentSupporter.LastName = !string.IsNullOrWhiteSpace(patientMessage.TLAST_NAME) ? patientMessage.TLAST_NAME : null;
                    treatmentSupporter.DateOfBirth = !string.IsNullOrWhiteSpace(patientMessage.TDATE_OF_BIRTH) ? patientMessage.TDATE_OF_BIRTH : null;
                    ////registration.TreatmentSupporter.DobPrecision = null;
                    treatmentSupporter.MobileNumber = !string.IsNullOrWhiteSpace(patientMessage.TPHONE_NUMBER) ? patientMessage.TPHONE_NUMBER : null;
                    treatmentSupporter.PhysicalAddress = !string.IsNullOrWhiteSpace(patientMessage.TADDRESS) ? patientMessage.TADDRESS : null;
                    treatmentSupporter.PatientType = "T";
                    treatmentSupporter.RelationshipType = String.Empty;
                    //registration.TreatmentSupporter.NationalId = !string.IsNullOrWhiteSpace(patientMessage.

                    registration.NextOfKin.Add(treatmentSupporter);
                }
            }

            return registration;
        }
    }
}
