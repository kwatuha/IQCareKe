/****** Object:  StoredProcedure [dbo].[sp_SaveUpdatePharmacyPrescription_GreenCard]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaveUpdatePharmacyPrescription_GreenCard]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_SaveUpdatePharmacyPrescription_GreenCard]
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveUpdatePharmacy_GreenCard]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaveUpdatePharmacy_GreenCard]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_SaveUpdatePharmacy_GreenCard]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientFamilyPlanningMethod]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientFamilyPlanningMethod]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientFamilyPlanningMethod]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterVaccines]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterVaccines]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterVaccines]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterTS]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterTS]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPresentingComplaints]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPresentingComplaints]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterPresentingComplaints]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPhysicalExam]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPhysicalExam]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterPhysicalExam]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPHDP]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPHDP]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterPHDP]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPatientManagement]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPatientManagement]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterPatientManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterGeneralExam]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterGeneralExam]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterGeneralExam]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterDiagnosis]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterDiagnosis]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterDiagnosis]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterComplaints]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterComplaints]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterComplaints]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterChronicIllness]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterChronicIllness]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterChronicIllness]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterAllergies]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterAllergies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterAllergies]
GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterAdverseEvents]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterAdverseEvents]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_savePatientEncounterAdverseEvents]
GO
/****** Object:  StoredProcedure [dbo].[SP_mst_PatientToGreencardRegistration]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_mst_PatientToGreencardRegistration]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_mst_PatientToGreencardRegistration]
GO
/****** Object:  StoredProcedure [dbo].[sp_getZScores]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getZScores]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getZScores]
GO
/****** Object:  StoredProcedure [dbo].[sp_getTreatmentProgram]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getTreatmentProgram]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getTreatmentProgram]
GO
/****** Object:  StoredProcedure [dbo].[sp_getRegimenClassification]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getRegimenClassification]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getRegimenClassification]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyRegimens]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyRegimens]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyRegimens]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyFields]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyFields]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyFields]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugSwitchSubReasons]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyDrugSwitchSubReasons]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyDrugSwitchSubReasons]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugList]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyDrugList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyDrugList]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugFrequency]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyDrugFrequency]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyDrugFrequency]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyBatch]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyBatch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPharmacyBatch]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPendingPrescriptions]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPendingPrescriptions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPendingPrescriptions]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientPharmacyPrescription]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientPharmacyPrescription]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientPharmacyPrescription]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterVaccines]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterVaccines]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterVaccines]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterHistory]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterHistory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterHistory]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterExam]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterExam]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterExam]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterDiagnosis]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterDiagnosis]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterDiagnosis]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterComplaints]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterComplaints]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterComplaints]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterChronicIllness]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterChronicIllness]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterChronicIllness]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterAllergies]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterAllergies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterAllergies]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterAdverseEvents]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterAdverseEvents]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounterAdverseEvents]
GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounter]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounter]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getPatientEncounter]
GO
/****** Object:  StoredProcedure [dbo].[sp_getItemIdByGroupAndItemName]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getItemIdByGroupAndItemName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getItemIdByGroupAndItemName]
GO
/****** Object:  StoredProcedure [dbo].[sp_getFacility]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getFacility]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getFacility]
GO
/****** Object:  StoredProcedure [dbo].[sp_getCurrentRegimen]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getCurrentRegimen]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getCurrentRegimen]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientFamilyPlanningMethod]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientFamilyPlanningMethod]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientFamilyPlanningMethod]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterVaccines]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterVaccines]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterVaccines]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterPresentingComplaints]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterPresentingComplaints]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterPresentingComplaints]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterPhysicalExam]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterPhysicalExam]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterPhysicalExam]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterPHDP]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterPHDP]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterPHDP]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterGeneralExam]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterGeneralExam]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterGeneralExam]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterDiagnosis]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterDiagnosis]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterDiagnosis]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterComplaints]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterComplaints]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterComplaints]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterChronicIllness]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterChronicIllness]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterChronicIllness]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterAllergies]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterAllergies]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterAllergies]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterAdverseEvents]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterAdverseEvents]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_deletePatientEncounterAdverseEvents]
GO
/****** Object:  StoredProcedure [dbo].[SP_Bluecard_ToGreenCard]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bluecard_ToGreenCard]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_Bluecard_ToGreenCard]
GO
/****** Object:  StoredProcedure [dbo].[Pr_SF_GetPatientSearchresults]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_SF_GetPatientSearchresults]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pr_SF_GetPatientSearchresults]
GO
/****** Object:  StoredProcedure [dbo].[pr_selectedListValue_Futures]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_selectedListValue_Futures]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_selectedListValue_Futures]
GO
/****** Object:  StoredProcedure [dbo].[pr_Scheduler_UpdateAppointmentStatus]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Scheduler_UpdateAppointmentStatus]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Scheduler_UpdateAppointmentStatus]
GO
/****** Object:  StoredProcedure [dbo].[Pr_Laboratory_SaveLabOrderTests_Constella]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_Laboratory_SaveLabOrderTests_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pr_Laboratory_SaveLabOrderTests_Constella]
GO
/****** Object:  StoredProcedure [dbo].[Pr_Laboratory_SaveLabOrder_Constella]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_Laboratory_SaveLabOrder_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pr_Laboratory_SaveLabOrder_Constella]
GO
/****** Object:  StoredProcedure [dbo].[pr_Laboratory_GetPatientRecordformStatus_Futures]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Laboratory_GetPatientRecordformStatus_Futures]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Laboratory_GetPatientRecordformStatus_Futures]
GO
/****** Object:  StoredProcedure [dbo].[pr_Laboratory_GetPatientInfo_Constella]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Laboratory_GetPatientInfo_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Laboratory_GetPatientInfo_Constella]
GO
/****** Object:  StoredProcedure [dbo].[pr_Laboratory_GetLabValues_constella]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Laboratory_GetLabValues_constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Laboratory_GetLabValues_constella]
GO
/****** Object:  StoredProcedure [dbo].[Pr_Laboratory_GetLabTestID_Constella]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_Laboratory_GetLabTestID_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pr_Laboratory_GetLabTestID_Constella]
GO
/****** Object:  StoredProcedure [dbo].[Pr_Laboratory_GetLabResults_Constella]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_Laboratory_GetLabResults_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pr_Laboratory_GetLabResults_Constella]
GO
/****** Object:  StoredProcedure [dbo].[pr_Laboratory_GetLabOrderDate_Constella]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Laboratory_GetLabOrderDate_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Laboratory_GetLabOrderDate_Constella]
GO
/****** Object:  StoredProcedure [dbo].[pr_Lab_UpdateResults_Constella]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Lab_UpdateResults_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Lab_UpdateResults_Constella]
GO
/****** Object:  StoredProcedure [dbo].[pr_Lab_AddResults_Constella]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Lab_AddResults_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Lab_AddResults_Constella]
GO
/****** Object:  StoredProcedure [dbo].[pr_GetBMI]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_GetBMI]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_GetBMI]
GO
/****** Object:  StoredProcedure [dbo].[PersonContact_Update]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonContact_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PersonContact_Update]
GO
/****** Object:  StoredProcedure [dbo].[PersonContact_Insert]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonContact_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PersonContact_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Person_Update]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Person_Update]
GO
/****** Object:  StoredProcedure [dbo].[Person_Insert]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Person_Insert]
GO
/****** Object:  StoredProcedure [dbo].[PatientTreatmentSupporter_Insert]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientTreatmentSupporter_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[PatientTreatmentSupporter_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Patient_Update]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patient_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Patient_Update]
GO
/****** Object:  StoredProcedure [dbo].[Patient_Insert]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patient_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Patient_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Ord_Visit_Insert]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ord_Visit_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Ord_Visit_Insert]
GO
/****** Object:  StoredProcedure [dbo].[mstPatient_Insert]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mstPatient_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[mstPatient_Insert]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_SaveTestResult]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveTestResult]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_SaveTestResult]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_SaveTestParameter]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveTestParameter]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_SaveTestParameter]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_SaveLabTest]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveLabTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_SaveLabTest]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_SaveLabOrder]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveLabOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_SaveLabOrder]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_MigrateData]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_MigrateData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_MigrateData]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GroupRemoveTest]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GroupRemoveTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GroupRemoveTest]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GroupGetLabTest]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GroupGetLabTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GroupGetLabTest]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GroupAddTest]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GroupAddTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GroupAddTest]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetTestParameterResult]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetTestParameterResult]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetTestParameterResult]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetTestDepartment]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetTestDepartment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetTestDepartment]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetResultUnit]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetResultUnit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetResultUnit]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetParameterResultOption]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetParameterResultOption]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetParameterResultOption]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetParameterResultConfig]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetParameterResultConfig]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetParameterResultConfig]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabTestParameters]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabTestParameters]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetLabTestParameters]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabTest]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetLabTest]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabOrderTests]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabOrderTests]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetLabOrderTests]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabOrder]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetLabOrder]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_FindTestByName]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_FindTestByName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_FindTestByName]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_DeleteTestParameter]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_DeleteTestParameter]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_DeleteTestParameter]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_DeleteLabTest]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_DeleteLabTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_DeleteLabTest]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_DeleteLabOrder]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_DeleteLabOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_DeleteLabOrder]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_ActivateLabTest]    Script Date: 5/9/2017 3:16:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_ActivateLabTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_ActivateLabTest]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_ActivateLabTest]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_ActivateLabTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_ActivateLabTest] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160223
-- Description:	Inactivite/Activate Lab Test
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_ActivateLabTest]
	-- Add the parameters for the stored procedure here
	@LabTestId int , 	
	@Active bit,
	@UserId int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update mst_LabTestMaster Set Active = @Active Where Id=@LabTestId;
END


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_DeleteLabOrder]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_DeleteLabOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_DeleteLabOrder] AS' 
END
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_DeleteLabTest]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_DeleteLabTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_DeleteLabTest] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160223
-- Description:	Delete Lab Test
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_DeleteLabTest] 
	-- Add the parameters for the stored procedure here
	@LabTestId int , 	
	@UserId int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update mst_LabTestMaster Set DeleteFlag = 1, DeletedBy=@UserId, DeleteDate=getdate() Where Id=@LabTestId;
END


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_DeleteTestParameter]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_DeleteTestParameter]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_DeleteTestParameter] AS' 
END
GO

-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160223
-- Description:	Delete Lab Test Parameter
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_DeleteTestParameter] 
	-- Add the parameters for the stored procedure here
	@ParameterId int , 
	@LabTestId int , 
	@UserId int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Mst_LabTestParameter Set DeleteFlag= 1,UserId=@UserId, UpdateDate=getdate()  Where Id = @ParameterId;
END



GO
/****** Object:  StoredProcedure [dbo].[Laboratory_FindTestByName]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_FindTestByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_FindTestByName] AS' 
END
GO


 
ALTER PROCEDURE [dbo].[Laboratory_FindTestByName] 
      -- Add the parameters for the stored procedure here
      @SearchText varchar(15),
	  @ExcludeGroup bit= 0
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;
      If ltrim(rtrim(@SearchText)) <> ''
      Begin
            Select @SearchText = '%'+@SearchText+'%';
            
            Select @SearchText = Case When nullif(@SearchText,'') Is Null Then Null Else '%'+@SearchText+'%' End
		-- Insert statements for procedure here
			Select	Id,
					ReferenceId,
					Name,
					IsGroup,
					DepartmentId,
					Department = (select D.LabDepartmentName From mst_LabDepartment D Where D.LabDepartmentID = M.DepartmentId),
					ParameterCount,
					DeleteFlag
			From mst_LabTestMaster As M
			Where (DeleteFlag = 0)
			And Active = 1
			And  Name Like @SearchText
			And Case When @ExcludeGroup = 1 And IsGroup = 1 Then 0 Else 1 End = 1
			And (ParameterCount > 0 Or IsGroup = 1);
       
                  
      End
      
    -- Insert statements for procedure here
      
 END



GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabOrder]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetLabOrder] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Get Lab Order details
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetLabOrder] 
	-- Add the parameters for the stored procedure here
	@LabOrderId int = null,
	@PatientId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		Select	O.Id LabOrderId,
			O.OrderNumber ,
			O.Ptn_pk PatientId,
			O.LocationId,
			O.VisitId,
			O.OrderedBy ,
			O.OrderDate OrderDate,
			O.ClinicalOrderNotes ClinicalNotes,
			O.DeleteFlag,
			O.ModuleId ,
			O.PreClinicLabDate,
			O.UserId,
			O.Createdby,
			O.CreateDate,
			O.UpdateDate,
			OrderStatus
	From ord_LabOrder O
	Where (O.Id = @LabOrderId Or @LabOrderId Is Null)
	And	  (O.Ptn_Pk = @PatientId Or @PatientId Is Null);

	
	
END


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabOrderTests]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabOrderTests]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetLabOrderTests] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Get the lab tests in lab order order
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetLabOrderTests] 
	-- Add the parameters for the stored procedure here
	@LabOrderId int ,
	@LabOrderTestId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select 
		P.LabOrderId,
		O.OrderedBy,
		O.ModuleId,
		O.OrderDate,
		O.OrderNumber,
		P.Id TestOrderId,
		P.LabTestId TestId,
		L.Name TestName,
		P.TestNotes,
		P.ResultNotes,
		D.LabDepartmentName Department,
		D.LabDepartmentId DepartmentId,
		L.IsGroup,	
		P.DeleteFlag,		
		P.ParentTestId,
		P.IsParent,		
		L.DeleteFlag TestDeleteFlag,
		L.ReferenceId,	
		P.ResultBy,
		P.ResultDate,
		P.ResultStatus,
		P.UserId,
		P.StatusDate,
		HasResult = Case When (Select Count(HasResult) - Sum(Convert(int,HasResult))
						From dtl_LabOrderTestResult R 
					 Where P.LabOrderId=@LabOrderId 
						And R.LabOrderTestId = P.Id
					) = 0 Then Convert(bit,1) Else Convert(bit,0) End
	From dtl_LabOrderTest P
	Inner Join mst_LabTestMaster L On L.Id = P.LabTestID
	Inner Join ord_LabOrder O On O.Id = P.LabOrderId
	Left Outer join mst_LabDepartment D On D.LabDepartmentID = L.DepartmentId
	Where P.LabOrderID = @LabOrderId  And (P.Id = @LabOrderTestId Or @LabOrderTestId Is Null)
END


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabTest]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetLabTest] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160212
-- Description:	Get Lab Test.
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetLabTest] 
	-- Add the parameters for the stored procedure here
	@LabTestId int = null
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	
-- Insert statements for procedure here
	Select	Id,
			ReferenceId,
			Name,
			IsGroup,
			DepartmentId,
			Department = (select D.LabDepartmentName From mst_LabDepartment D Where D.LabDepartmentID = M.DepartmentId),
			ParameterCount,
			Active,
			DeleteFlag
	From mst_LabTestMaster As M
	Where DeleteFlag = 0  And (Id = isnull(@LabTestId, Id))
End


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabTestParameters]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabTestParameters]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetLabTestParameters] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Get Testparameters for a labtest
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetLabTestParameters] 
	-- Add the parameters for the stored procedure here
	@LabTestId int , 
	@ParameterId int = null
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

-- Insert statements for procedure here
Select	Id,
		ReferenceId,
		ParameterName,
		LabTestId,
		DataType,
		P.OrdRank,
		LoincCode,
		UserId,
		CreateDate,
		UpdateDate,
		DeleteFlag
From Mst_LabTestParameter As P
Where (LabTestId = @LabTestId)
And (Id = isnull(@ParameterId, Id))
And (DeleteFlag = 0)
End



GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetParameterResultConfig]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetParameterResultConfig]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetParameterResultConfig] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160224
-- Description:	Get the lab test parameter result option
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetParameterResultConfig]
	-- Add the parameters for the stored procedure here
	@ParameterId int
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

Select	Id,
		C.ParameterId,
		MinBoundary,
		MaxBoundary,
		MinNormalRange,
		MaxNormalRange,
		Isnull(DefaultUnit,0) DefaultUnit,
		U.UnitName,
		C.UnitId,
		DetectionLimit
From dtl_LabTestParameterConfig C
Inner Join vw_LabTestParameterUnits U On U.UnitId = C.UnitId
Where ParameterId = @ParameterId
And C.DeleteFlag = 0


End


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetParameterResultOption]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetParameterResultOption]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetParameterResultOption] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160224
-- Description:	Get the lab test parameter result option
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetParameterResultOption] 
	-- Add the parameters for the stored procedure here
	@ParameterId int
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

Select	Id,
		Value,
		ParameterId,
		DeleteFlag
From dtl_LabTestParameterResultOption
Where ParameterId = @ParameterId And DeleteFlag = 0 Order by Value
End


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetResultUnit]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetResultUnit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetResultUnit] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160223
-- Description:	Get Test result units
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetResultUnit] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select UnitId UnitID,UnitName Name from vw_LabTestParameterUnits Where DeleteFlag=0 order by Name   
END


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetTestDepartment]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetTestDepartment]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetTestDepartment] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160223
-- Description:	Get Test departments
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetTestDepartment] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select D.LabDepartmentID Id, D.LabDepartmentName Name, D.DeleteFlag from mst_LabDepartment D Where D.DeleteFlag = 0  
END


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetTestParameterResult]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetTestParameterResult]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetTestParameterResult] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Get test parameter result
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetTestParameterResult] 
	-- Add the parameters for the stored procedure here
	@LabTestOrderId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 Select 
		R.Id  Id,
		LabOrderId,
		R.LabTestId,
		LabOrderTestId ,
		R.ParameterId,	
		ResultValue,
		isnull(Undetectable,0)Undetectable,
		DetectionLimit,
		ResultText,
		ResultOption,
		ResultOptionId,
		R.UserId,
		R.DeleteFlag,
		HasResult,
		ResultConfigId,
		ResultUnitId,
		ResultUnit,
		R.CreateDate	,
		P.ParameterName,
		P.ReferenceId,
		P.DataType	,
		P.OrdRank,
		P.DeleteFlag ParamDeleteFlag	,
		R.StatusDate
	From dtl_LabOrderTestResult R Inner Join Mst_LabTestParameter P
	On R.ParameterId = P.Id			 
	Where R.LabOrderTestId = @LabTestOrderId And R.DeleteFlag=0
	Order By P.OrdRank;
END


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GroupAddTest]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GroupAddTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GroupAddTest] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 201602023
-- Description:	Add labTest to group
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GroupAddTest] 
	-- Add the parameters for the stored procedure here
	@MainTestId int , 
	@LabTestId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		Delete From lnk_GroupLabTest Where GroupLabTestId = @MainTestId And LabTestId=@LabTestId;
		Insert Into lnk_GroupLabTest(GroupLabTestId,LabTestId) Values(@MainTestId, @LabTestId);
	END


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GroupGetLabTest]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GroupGetLabTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GroupGetLabTest] AS' 
END
GO

-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 201602023
-- Description:	Get the labtests in a group
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GroupGetLabTest] 
	-- Add the parameters for the stored procedure here
	@MainTestId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select	
		M.Id,
		M.ReferenceId,
		M.Name,
		M.IsGroup,
		M.DepartmentId,
		Department = (select D.LabDepartmentName From mst_LabDepartment D Where D.LabDepartmentID = M.DepartmentId),
		M.ParameterCount,
		M.DeleteFlag,
		M.Active
	From lnk_GroupLabTest As G
	Inner Join mst_LabTestMaster As M On M.Id = G.LabTestId
	Where  M.DeleteFlag = 0 And G.GroupLabTestId = @MainTestId And M.IsGroup = 0
END



GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GroupRemoveTest]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GroupRemoveTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GroupRemoveTest] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Remove lab test from a group
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GroupRemoveTest]
	-- Add the parameters for the stored procedure here
	@MainTestId int , 
	@LabTestId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Delete From lnk_GroupLabTest Where GroupLabTestId = @MainTestId And LabTestId=@LabTestId;
END


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_MigrateData]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_MigrateData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_MigrateData] AS' 
END
GO

-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160320
-- Description:	Migrate lab data to new tables
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_MigrateData]
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
	Set Nocount On;
	If object_id('tempdb..#LabTest') Is Not Null Drop Table #LabTest
	If object_id('tempdb..#New_LabTest') Is Not Null Drop Table #New_LabTest
	If object_id('tempdb..#TestParameter') Is Not Null Drop Table #TestParameter
	If object_id('tempdb..#New_TestParameter') Is Not Null Drop Table #New_TestParameter
	If object_id('tempdb..#ParamConfig') Is Not Null Drop Table #ParamConfig
	If object_id('tempdb..#New_ParamConfig') Is Not Null Drop Table #New_ParamConfig
	If object_id('tempdb..#ResultOption') Is Not Null Drop Table #ResultOption
	If object_id('tempdb..#New_ResultOption') Is Not Null Drop Table #New_ResultOption
	If object_id('tempdb..#Group') Is Not Null Drop Table #Group
	If object_id('tempdb..#New_Group') Is Not Null Drop Table #New_Group
	If object_id('tempdb..#Order') Is Not Null Drop Table #Order
	If object_id('tempdb..#New_Order') Is Not Null Drop Table #New_Order
	If object_id('tempdb..#OrderTest') Is Not Null Drop Table #OrderTest
	If object_id('tempdb..#New_OrderTest') Is Not Null Drop Table #New_OrderTest
	If object_id('tempdb..#TestResult') Is Not Null Drop Table #TestResult
	If object_id('tempdb..#New_TestResult') Is Not Null Drop Table #New_TestResult

	Create Table #LabTest(Id int Primary Key, ReferenceId varchar(36), Name varchar(100), IsGroup bit, DepartmentId int, Active bit, DeleteFlag bit);

	Create Table #New_LabTest(New_Id int, Old_Id int);

	Create Table #TestParameter(Id int Primary Key, ReferenceId varchar(36), ParameterName varchar(100), LabTestId int, DataType varchar(15), OrdRank decimal(4, 2), DeleteFlag bit);

	Create Table #New_TestParameter(New_Id int, Old_Id int, Old_TestId int);

	Create Table #ParamConfig(Id int Primary Key, ParameterId int, MinBoundary decimal(10, 2), MaxBoundary decimal(10, 2), MinNormalRange decimal(10, 2),
	MaxNormalRange decimal(10, 2), UnitId int, DefaultUnit bit, DetectionLimit decimal(10, 2), DeleteFlag bit);

	Create Table #New_ParamConfig(New_Id int, Old_Id int, Old_ParameterId int);

	Create Table #ResultOption(Id int Primary Key, ParameterId int, Value varchar(50), DeleteFlag bit);

	Create Table #New_ResultOption(New_Id int, Old_Id int, Old_ParameterId int);

	Create Table #Group(LabGroupTestId int, LabTestId int);

	Create Table #New_Group(New_Id int, Old_Id int);

	Create Table #Order(Id int Primary Key, Ptn_Pk int, LocationId int, VisitId int, ModuleId int, OrderedBy bigint, OrderDate datetime, PreClinicLabDate datetime,
	ClinicalOrderNotes varchar(400), OrderNumber varchar(50), CreatedBy int, CreateDate datetime, OrderStatus varchar(50), UserId int,
	UpdateDate datetime, DeleteFlag bit);

	Create Table #New_Order(New_Id int, VisitId int);

	Create Table #OrderTest(OrderId int, LabTestId int, IsParent bit, ParentTestId int, DeleteFlag bit, ResultStatus varchar(50),
	ResultBy bigint, ResultDate datetime, UserId int, StatusDate datetime);

	Create Table #New_OrderTest(New_Id int, OrderId int, LabTestId int);

	Create Table #TestResult(OrderId int, LabTestId int, TestName varchar(100), ParameterId int, ParameterName varchar(100), ResultValue decimal(10, 2), ResultText varchar(400),
	ResultOptionId int, ResultOption varchar(50), ResultUnit varchar(50), ResultUnitId int, ResultConfigId int, Undetectable bit, DetectionLimit decimal(10, 2),
	UserId int, DeleteFlag bit, CreateDate datetime, CreatedBy int, StatusDate datetime);

	Create Table #New_TestResult(New_Id int, OrderId int, LabTestId int, ParameterId int);

-- LabTests
	Insert Into #LabTest (Id, ReferenceId, Name, IsGroup, DepartmentId, Active, DeleteFlag)
	Select	LabTestID					Id
			,Case
				When LabName = 'CD4' Then 'CD4'
				When LabName = 'CD4 Percent' Then 'CD4_PERCENT'
				When LabName = 'Viral Load' Then 'VIRAL_LOAD'
				Else dbo.RemoveNonAlphaCharacters(LabName) + 
				Case row_number() Over(Partition by Labname Order by LabTestID) When 1 Then '' Else '-'+Convert(varchar,(row_number() Over(Partition by Labname Order by LabTestID))) End				 
			End							As ReferenceId
			,LabName					Name	
			,IsGroup =					
						Case
							When Exists (
									Select 1
									From Dtl_LabGroupItems G
									Where G.LabGroupTestId = O.LabTestId) Then 1
							Else 0
						End
			,LabDepartmentID			DepartmentId
			,~convert(bit, DeleteFlag)	Active
			,DeleteFlag
	From Mst_LabTest_Old O
	Where LabDepartmentID <> 8
		And Migrated = 0

--matching Parameters only
	Insert Into #TestParameter (Id, ReferenceId, ParameterName, LabTestId, DataType, OrdRank, DeleteFlag)
	Select	SubTestID																Id
			,dbo.RemoveNonAlphaCharacters(SubTestName)+ 
				Case row_number() Over(Partition by SubTestName Order by LabTestID) When 1 Then '' Else '-'+Convert(varchar,(row_number() Over(Partition by SubTestName Order by SubTestID))) End								ReferenceId
			,SubTestName															ParameterName
			,TestID																	LabTestId
			,DataType =																
						Case
							When T.DataType Is Not Null And
								T.DataType <> 'Group' Then T.DataType
							When Exists (
									Select 1
									From lnk_LabValue_Old V
									Where V.SubTestID = P.SubTestID) Then 'NUMERIC'
							When Exists (
									Select 1
									From lnk_parameterresult_Old R
									Where R.ParameterID = P.SubTestID) Then 'SELECTLIST'
							Else 'TEXT'
						End
			,row_number() Over (Partition By T.LabTestID Order By P.SubTestName)	OrdRank
			,P.DeleteFlag
	From lnk_TestParameter_Old P
	Inner Join Mst_LabTest_Old T On P.TestID = T.LabTestID
	Where LabDepartmentID <> 8
		And P.Migrated = 0 --And P.DeleteFlag = 0 And T.DeleteFlag = 0

-- Result Config
Insert Into #ParamConfig (Id, ParameterId, MinBoundary, MaxBoundary, MinNormalRange, MaxNormalRange, UnitId, DefaultUnit, DetectionLimit, DeleteFlag)
	Select	V.Id
			,P.SubTestID		ParameterId
			,V.MinBoundaryValue	MinBoundary
			,V.MaxBoundaryValue	MaxBoundary
			,V.MinNormalRange
			,V.MaxNormalRange
			,V.UnitID			UnitId
			,V.DefaultUnit
			,0.0				DetectionLimit
			,V.DeleteFlag
	From lnk_LabValue_Old V
	Inner Join lnk_TestParameter_Old P On P.SubTestID = V.SubTestID
	Where V.Migrated = 0
--Where V.DeleteFlag = 0 And P.DeleteFlag = 0



--Result Options
Insert Into #ResultOption (Id, ParameterId, Value, DeleteFlag)
	Select	R.ResultID		Id
			,R.ParameterID	ParameterId
			,R.Result		Value
			,0				DeleteFlag
	From lnk_parameterresult_Old R
	Inner Join lnk_TestParameter_Old P On P.SubTestID = R.ParameterID
	Where Result Is Not Null
		And R.Migrated = 0
--And P.DeleteFlag = 0

-- Group Labs[dbo].[lnk_LabValue_Old]
Insert Into #Group (LabGroupTestId, LabTestId)
	Select Distinct	G.LabGroupTestID	LabGroupTestId
					,G.LabTestID		LabTestId
	From Dtl_LabGroupItems G
	Inner Join Mst_LabTest_Old T On T.LabTestID = g.LabGroupTestID
	Inner Join Mst_LabTest_Old T1 On T1.LabTestID = G.LabTestID
	Where G.DeleteFlag = 0
		And T.DeleteFlag = 0


--Orders
Insert Into #Order(Id,Ptn_Pk,LocationId,VisitId,ModuleId,OrderedBy,OrderDate,PreClinicLabDate,ClinicalOrderNotes, OrderNumber,CreatedBy,CreateDate,
OrderStatus,UserId,UpdateDate,DeleteFlag)
select 
	LabId Id,
	Ptn_Pk,
	LocationId,
	VisitId,
	-1 ModuleId,
	OrderedByName OrderedBy,
	OrderedByDate OrderDate,
	PreClinicLabDate,
	Null ClinicalOrderNotes,
	LabNumber OrderNumber,
	UserID CreatedBy,
	CreateDate,
	OrderStatus = Case When ReportedByDate Is Null Then 'Pending' Else 'Complete' End,
	UserId,
	UpdateDate,
	DeleteFlag
 From ord_PatientLabOrder_Old O where  Migrated=0
 And Exists(Select 1 From dtl_PatientLabResults_Old R  inner join #LabTest T On T.Id=R.LabTestID Where R.LabID = O.LabID )

 -- OrderedTest

;With tests As(Select  Distinct	labid,
				labtestid
From dtl_PatientLabResults_Old Where Migrated=0
)
Insert Into #OrderTest(OrderId,LabTestId,IsParent,ParentTestId,DeleteFlag,ResultBy,ResultDate,UserId,ResultStatus,StatusDate)
Select T.LabId OrderId, 
LabTestId,
0 IsParent,
Null ParentTestId,
0 DeleteFlag,
nullif(ReportedByName,0) ResultBy,
ReportedByDate ResultDate,
O.UserId,
ResultStatus =Case When ReportedByDate Is Null Then 'Pending' Else 'Received' End,
O.CreateDate StatusDate
 From tests T Inner Join ord_PatientLabOrder_Old O On T.LabId = O.LabId  Inner JOin #Order LO on LO.Id = O.LabID
 inner  join #LabTest L On L.Id = T.LabTestId


 -- Test Results
		Insert Into #TestResult (
			OrderId,
			LabTestId,
			TestName,
			ParameterId,
			ParameterName,
			ResultValue,
			ResultText,
			ResultOptionId,
			ResultOption,
			ResultUnitId,
			ResultUnit,
			Undetectable,
			DetectionLimit,
			UserId,
			DeleteFlag,
			CreateDate,
			CreatedBy,
			StatusDate)
			Select	d.LabID OrderId,
					LabTestID LabTestId,
					TestName =(	Select	LabName	From Mst_LabTest_Old p		Where P.LabTestID = d.LabTestID),
					ParameterId,
					ParameterName =	(Select	SubTestName	From lnk_TestParameter_Old p Where P.SubTestID = d.ParameterID),
					TestResults As ResultValue,
					nullif(replace(replace(d.TestResults1, char(10), ''), char(13), ''), '') As ResultText,
					TestResultId ResultOptionId,
					ResultOption =(Select Result From lnk_parameterresult_Old lp Where lp.ResultId = TestResultId	And lp.ParameterId = D.ParameterId	),
					Units ResultUnitId,
					ResultUnit =(Select	Name From mst_decode U Where  CodeId = 30 And U.Id = Units	),
	
					0 As Undetectable,
					0.0 As DetectableLimit,
					d.UserID,
					0 As DeleteFlag,
					d.CreateDate,
					d.UserID CreatedBy,
					isnull(o.ReportedbyDate, O.OrderedbyDate) StatusDate
			From [dbo].[dtl_PatientLabResults_Old] d, [ord_PatientLabOrder_Old] o
			Where d.LabID = o.LabID
			And d.Migrated=0
			And d.parameterid <> 107
		And LabTestID In
		(
			Select	LabTestId	From Mst_LabTest_Old T	Where LabDepartmentId != 8
		) 
		Union All
		Select 		d.LabID OrderId,
					 3  LabTestId,	
						TestName = (Select LabName From Mst_LabTest_Old p Where P.LabTestID = d.LabTestID)		,
						d.ParameterId,
						ParameterName = (Select SubTestName From lnk_TestParameter_Old p Where P.SubTestID = 3),
						Null As ResultValue,
						Nullif(replace(replace (d.TestResults1, char(10), ''), char(13), ''),'')As ResultText,		
						TestResultId ResultOptionId,			
						ResultOption = (Select Result From lnk_parameterresult_Old lp Where lp.ResultId = TestResultId And lp.ParameterId = D.ParameterId) ,			
						Units ResultUnitId,
						ResultUnit= (Select	Name From mst_decode U Where  CodeId = 30 And U.Id = Units),				
						1 As Undetectable,
						TestResults As DetectableLimit,
						d.UserID,
						0 As DeleteFlag,
						d.CreateDate,
						d.UserID CreatedBy,
						Isnull(o.ReportedbyDate,o.OrderedbyDate) StatusDate
		From [dbo].[dtl_PatientLabResults_Old] d, [ord_PatientLabOrder_Old] o
		Where d.LabID = o.LabID   and d.parameterid = 107 
		And d.Migrated=0

	

	SET IDENTITY_INSERT [dbo].[mst_LabTestMaster] ON


	Insert Into mst_LabTestMaster (
		Id,
		ReferenceId,
		Name,
		IsGroup,
		DepartmentId,
		CreateDate,
		Active,
		DeleteFlag)
	Output INSERTED.Id,INSERTED.Id Into #New_LabTest(New_Id,Old_Id)
	Select	T.Id,
			T.ReferenceId,
			T.Name,
			T.IsGroup,
			T.DepartmentId,
			getdate(),
			T.Active,
			T.DeleteFlag
	From #LabTest T;

Print Convert(varchar(10),@@ROWCOUNT) + ' Lab Tests Migrated'

SET IDENTITY_INSERT [dbo].[mst_LabTestMaster] Off


Update O Set Migrated = 1 From Mst_LabTest_Old  O Inner Join #New_LabTest N On N.New_Id=O.LabTestID;

-- parameters



SET IDENTITY_INSERT [dbo].[Mst_LabTestParameter] ON


Insert Into Mst_LabTestParameter (
	Id,
	ReferenceId,
	ParameterName,
	LabTestId,
	DataType,
	OrdRank,
	UserId,
	CreateDate,
	DeleteFlag)
Output INSERTED.Id,INSERTED.LabTestId Into #New_TestParameter(New_Id,Old_TestId)
Select	P.Id,
		P.ReferenceId,
		ParameterName,
		LabTestId,
		DataType,
		OrdRank,
		1,
		getdate(),
		P.DeleteFlag
From #TestParameter P
Inner Join mst_LabTestMaster T On T.Id = P.LabTestId;

Print Convert(varchar(10),@@ROWCOUNT) + ' Lab Tests Parameters Migrated'

SET IDENTITY_INSERT [dbo].[Mst_LabTestParameter] Off

Update O Set Migrated = 1 From lnk_TestParameter_Old  O Inner Join #New_TestParameter N On N.New_Id=O.SubTestID;

-- Config

SET IDENTITY_INSERT [dbo].dtl_LabTestParameterConfig On

Insert Into dtl_LabTestParameterConfig (
	Id,
	ParameterId,
	MinBoundary,
	MaxBoundary,
	MinNormalRange,
	MaxNormalRange,
	UnitId,
	DefaultUnit,
	DetectionLimit,
	DeleteFlag)
Output INSERTED.Id,INSERTED.ParameterId Into #New_ParamConfig(New_Id,Old_ParameterId)
Select	C.Id,
		C.ParameterId,
		C.MinBoundary,
		C.MaxBoundary,
		C.MinNormalRange,
		C.MaxNormalRange,
		C.UnitId,
		C.DefaultUnit,
		C.DetectionLimit,
		C.DeleteFlag
From #ParamConfig C
Inner Join Mst_LabTestParameter P On P.Id = C.ParameterId;

Print Convert(varchar(10),@@ROWCOUNT) + ' Parameters Configuration Migrated'


SET IDENTITY_INSERT [dbo].[dtl_LabTestParameterConfig] Off

Update O Set Migrated = 1 From lnk_LabValue_Old  O Inner Join #New_ParamConfig N On N.New_Id=O.ID and O.SubTestID = N.Old_ParameterId;

--options

SET IDENTITY_INSERT [dbo].[dtl_LabTestParameterResultOption] ON


Insert Into dtl_LabTestParameterResultOption (
	Id,
	ParameterId,
	Value,
	DeleteFlag)
Output INSERTED.Id, INSERTED.ParameterId Into #New_ResultOption(New_Id,Old_ParameterId)
Select	O.Id,
		o.ParameterId,
		o.Value,
		o.DeleteFlag
From #ResultOption O
Inner Join Mst_LabTestParameter P On O.ParameterId = P.Id;

Print Convert(varchar(10),@@ROWCOUNT) + ' Result Options'

SET IDENTITY_INSERT [dbo].[dtl_LabTestParameterResultOption] Off

Update O Set Migrated = 1 From lnk_parameterresult_Old  O Inner Join #New_ResultOption N On N.New_Id= O.ResultID and O.ParameterID = N.Old_ParameterId;

-- orders

SET IDENTITY_INSERT [dbo].ord_LabOrder ON


Insert Into ord_LabOrder (
	Id,
	Ptn_Pk,
	LocationId,
	VisitId,
	ModuleId,
	OrderedBy,
	OrderDate,
	PreClinicLabDate,
	ClinicalOrderNotes,
	OrderNumber,
	CreatedBy,
	CreateDate,
	OrderStatus,
	UserId,
	DeleteFlag,
	UpdateDate)
Output Inserted.Id, Inserted.VisitId Into #New_Order(New_Id,VisitId)
Select	Id,
		O.Ptn_Pk,
		O.LocationId,
		O.VisitId,
		O.ModuleId,
		O.OrderedBy,
		O.OrderDate,
		O.PreClinicLabDate,
		O.ClinicalOrderNotes,
		O.OrderNumber,
		O.CreatedBy,
		O.CreateDate,
		O.OrderStatus,
		O.UserId,
		Isnull(O.DeleteFlag,0),
		O.UpdateDate
From #Order O;

Print Convert(varchar(10),@@ROWCOUNT) + ' Lab Orders'

SET IDENTITY_INSERT [dbo].ord_LabOrder Off

Update O Set Migrated = 1 From ord_PatientLabOrder_Old  O Inner Join #New_Order N On N.New_Id= O.LabID and O.VisitId = N.VisitId;




--SET IDENTITY_INSERT [dbo].dtl_LabOrderTest On

Insert Into dtl_LabOrderTest (
	LabOrderId,
	LabTestId,
	TestNotes,
	IsParent,
	ParentTestId,
	DeleteFlag,
	ResultNotes,
	ResultBy,
	ResultDate,
	ResultStatus,
	UserId,
	StatusDate)
	Output INSERTED.Id, INSERTED.LabOrderId, INSERTED.LabTestId Into #New_OrderTest(new_id,OrderId,LabTestId)
	Select	T.OrderId,
			T.LabTestId,
			Null,
			T.IsParent,
			T.ParentTestId,
			T.DeleteFlag,
			Null,
			T.ResultBy,
			T.ResultDate,
			T.ResultStatus,
			T.UserId,
			T.StatusDate
	From #OrderTest T
	Inner Join ord_LabOrder O On O.Id = T.OrderId;

	Print Convert(varchar(10),@@ROWCOUNT) + ' Orders Tests Migrated'

--SET IDENTITY_INSERT [dbo].dtl_LabOrderTest Off

--SET IDENTITY_INSERT [dbo].dtl_LabOrderTestResult on

Insert Into dtl_LabOrderTestResult (
	LabOrderId,
	LabTestId,
	LabOrderTestId,
	ParameterId,
	ResultValue,
	ResultText,
	ResultOption,
	ResultOptionId,
	ResultUnit,
	ResultUnitId,
	ResultConfigId,
	Undetectable,
	DetectionLimit,
	UserId,
	DeleteFlag,
	CreateDate,
	CreatedBy,
	StatusDate)
Output Inserted.Id, Inserted.LabOrderId, Inserted.LabTestId,Inserted.ParameterId Into #New_TestResult(New_Id  ,OrderId , LabTestId , ParameterId )
Select	R.OrderId,
		R.LabTestId,
		T.Id,
		R.ParameterId,
		R.ResultValue,
		R.ResultText,
		R.ResultOption,
		R.ResultOptionId,
		r.ResultUnit,
		R.ResultUnitId,
		R.ResultConfigId,
		R.Undetectable,
		R.DetectionLimit,
		R.UserId,
		Isnull(R.DeleteFlag,0),
		Isnull(R.CreateDate,getdate()),
		R.CreatedBy,
		R.StatusDate
From #TestResult R
Inner Join dtl_LabOrderTest T On R.LabTestId = T.LabTestId
		And T.LabOrderId = R.OrderId
Inner Join #New_OrderTest OT On OT.OrderId = T.LabOrderId
		And OT.LabTestId = T.LabTestId
		And OT.New_Id = T.Id;

Print Convert(varchar(10),@@ROWCOUNT) + ' Test Results Migrated'


--SET IDENTITY_INSERT [dbo].dtl_LabOrderTestResult Off

Update O Set Migrated = 1 From dtl_PatientLabResults_Old  O Inner Join #New_TestResult N On O.LabId = N.OrderId And O.LabTestId = N.LabTestId And O.ParameterId = N.ParameterId



End



GO
/****** Object:  StoredProcedure [dbo].[Laboratory_SaveLabOrder]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveLabOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_SaveLabOrder] AS' 
END
GO


ALTER PROCEDURE [dbo].[Laboratory_SaveLabOrder]                                       
	@PatientId int,                  
	@LocationID int,   
	@UserId int,                  
	@OrderedBy int,                                      
	@OrderDate datetime,     
	@LabOrderId int = Null,    
	@PreClinicDate datetime=null,
	@ClinicalNotes varchar(250) = null   ,	
	@itemList xml = null  ,  
	@ParameterList xml = null,
	@VisitId int = null,  
	@ModuleId int              
As                             
Begin

	Set Nocount On;
	Declare @OrderedTest Table(TestId int, TestNotes varchar(255), IsGroup bit, IsParent bit, ParentTestId int);	
	Declare @SavedTest Table(OrderTestId int, LabTestId int);
	Declare @OrderNumber varchar(50);
	;With LabR As
		(
			Select
				L.G.query('testid').value('.', 'int') TestId,
				nullif(L.G.query('testnotes').value('.', 'varchar(255)'), '') TestNotes,
				L.G.query('isgroup').value('.', 'bit') IsGroup
			From @itemList.nodes('/root/request') As L (G)
		)
	Insert Into @OrderedTest (
		TestId,
		TestNotes,
		IsGroup,
		IsParent)
		Select	TestID,
				TestNotes,
				IsGroup,
				1 IsParent
		From LabR;
	Insert Into @OrderedTest (
		TestId,
		TestNotes,
		IsGroup,
		IsParent,
		ParentTestId)
		Select	G.LabTestId TestId,
				Null As TestNotes,
				0 IsGroup,
				0 IsParent,
				L.TestId As ParentTestId
		From @OrderedTest L
		Inner Join lnk_GroupLabTest G On L.TestId = G.GroupLabTestId
				And L.IsGroup = 1;

	Begin Transaction LabOrder
	Begin Try
		Insert Into ord_Visit (
			Ptn_pk,
			LocationID,
			VisitDate,
			VisitType,
			DataQuality,
			UserID,
			Createdate,
			OrderedDate,
			ModuleID,
			Signature)
		Values (
			@PatientId,
			@LocationId,
			@OrderDate,
			6,
			0,
			@UserID,
			getdate(),
			@OrderDate,
			@ModuleId,
			@OrderedBy );
		Select @VisitId = scope_identity();

		Select @OrderNumber = max(convert(varchar, replace(OrderNumber, '-', '')))
		From ord_LabOrder
		Where OrderNumber Like convert(varchar, datepart(Year, getdate())) + '-%'

		If (@OrderNumber Is Null) Select @OrderNumber = convert(varchar(4),datepart(year, getdate())) + replicate('0', 5) + convert(varchar, 1); 
		Else Select @OrderNumber = convert(int, @OrderNumber) + 1;

		Select @OrderNumber = stuff(@OrderNumber, 5, 0, '-');

		Insert Into ord_LabOrder (
			Ptn_Pk,
			LocationId,
			ModuleId,
			VisitId,
			OrderedBy,
			OrderDate,
			CreateDate,
			CreatedBy,
			UserId,
			PreClinicLabDate,
			ClinicalOrderNotes,
			OrderNumber,
			OrderStatus,
			DeleteFlag
		)
		Values (
			@PatientId,
			@LocationId,
			@ModuleId,
			@VisitId,
			@OrderedBy,
			@OrderDate,
			getdate(),
			@UserID,
			@UserId,			
			@PreClinicDate,
			@ClinicalNotes,
			@OrderNumber,			
			'Pending',
			0 );

		Select @LabOrderId = scope_identity();

		Insert Into dtl_LabOrderTest (
			LabOrderId,
			LabTestId,
			TestNotes,
			IsParent,
			ParentTestId,
			DeleteFlag,
			ResultStatus,
			UserId,
			StatusDate)
		Output Inserted.Id, Inserted.LabTestId Into @SavedTest (OrderTestId, LabTestId)
			Select	@LabOrderId,
					T.TestId,
					T.TestNotes,
					T.IsParent,
					T.ParentTestId,
					0,
					'Pending',
					@UserId,
					getdate()
			From @OrderedTest T;

		Insert Into dtl_LabOrderTestResult (
			LabOrderId,
			LabTestId,
			LabOrderTestId,
			ParameterId,
			CreatedBy,
			CreateDate,
			UserId,
			DeleteFlag,
			StatusDate)
			Select	@LabOrderId,
					T.LabTestId,
					T.OrderTestId,
					P.Id,
					@UserId,
					getdate(),
					@UserId,
					0,
					getdate()
			From Mst_LabTestParameter P
			Inner Join @SavedTest T On T.LabTestId = P.LabTestId
			Where p.DeleteFlag =0 Order By OrdRank;

			-- Output the saved stuff.
			
			Select Id LabOrderId,
					O.Ptn_pk PatientId,
					LocationId,
					O.OrderedBy,
					O.OrderDate,
					O.CreateDate ,
					O.UserId,
					O.PreClinicLabDate PreClinicDate,
					VisitId,
					O.OrderNumber,
					ModuleId,
					O.ClinicalOrderNotes ClinicalNotes,
					O.OrderStatus,
					O.CreatedBy,
					O.UpdateDate,
					O.DeleteFlag
			 From ord_LabOrder O Where O.Id = @LabOrderId;

			If @@TRANCOUNT > 0 Commit Transaction LabOrder;
	End Try 
	Begin Catch
		Declare @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
		Select	@ErrorMessage = error_message(),
				@ErrorSeverity = error_severity(),
				@ErrorState = error_state();
		Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
		If @@TRANCOUNT > 0 Rollback Transaction LabOrder;
	End Catch;
End


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_SaveLabTest]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveLabTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_SaveLabTest] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160223
-- Description:	Save Lab Test
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_SaveLabTest] 
	-- Add the parameters for the stored procedure here
	 
	@ReferenceId varchar(36) = null,
	@TestName varchar(250),
	@IsGroup bit = 0,
	@DepartmentId int = null,
	@LoincCode varchar(15) = null,
	--@ParameterList xml = null,
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @LabTestId int;
	Declare @ParameterId int ;
	Select @ReferenceId = Isnull(@ReferenceId, Convert(varchar(36),newid()));
	Begin Transaction saveLabTest
	Begin Try
		If Exists(Select 1 From mst_LabTestMaster Where Name = @TestName) Begin
			Raiserror('Duplication Error :: Another lab test exists with the same name',16,1);
			Return 0;
		End
		If Exists(Select 1 From mst_LabTestMaster Where ReferenceId = @ReferenceId) Begin
			Raiserror('Duplication Error :: Another lab test exists with the Reference Id',16,1);
			Return 0;
		End
		Insert Into mst_LabTestMaster (
			ReferenceId,
			Name,
			IsGroup,
			DepartmentId,
			LoincCode,
			Active,
			DeleteFlag)
		Values (
			@ReferenceId,
			@TestName,
			@IsGroup,
			@DepartmentId,
			@LoincCode,
			1,
			0 );
		Select @LabTestId = Scope_Identity();

	
		Select	Id,
			ReferenceId,
			Name,
			IsGroup,
			DepartmentId,
			Department = (select D.LabDepartmentName From mst_LabDepartment D Where D.LabDepartmentID = M.DepartmentId),
			ParameterCount,
			Active,
			DeleteFlag
		From mst_LabTestMaster As M
		Where (Id = @LabTestId);
			
		If @@TRANCOUNT > 0 Commit Transaction saveLabTest;
		End Try 
		Begin Catch
			Declare @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
			Select	@ErrorMessage = error_message(),
					@ErrorSeverity = error_severity(),
					@ErrorState = error_state();
			Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
			If @@TRANCOUNT > 0 Rollback Transaction saveLabTest;
		End Catch;

END


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_SaveTestParameter]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveTestParameter]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_SaveTestParameter] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Save Test Parameter
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_SaveTestParameter] 
	-- Add the parameters for the stored procedure here
	@ParameterId int = null,
	@ReferenceId varchar(36),
	@Name varchar(250),
	@LabTestId int,
	@DataType varchar(20),
	@Rank decimal(5,2) = 0.00,
	@LoincCode varchar(50) = null,
	@UserId int,
	@DeleteFlag bit= 0,
	@OptionList xml = null,
	@ConfigList xml = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	declare @ResultOption Table(OptionId int, OptionValue varchar(50), DeleteFlag bit);
	declare @Config Table(
			ConfigId int,
			MinBoundary decimal(10,2),
			MaxBoundary decimal(10,2),
			MinNormal decimal(10,2),
			MaxNormal decimal(10,2),
			Unit int,
			DefaultUnit bit,
			Limit decimal(10,2),
			DeleteFlag bit);

		Begin Transaction saveTP
		Begin Try
			If (@ParameterId Is Null Or @ParameterId < 1 ) Begin
				Insert Into Mst_LabTestParameter (
					ReferenceId,
					parameterName,
					LabTestId,
					DataType,
					OrdRank,
					UserId,
					CreateDate,
					DeleteFlag,
					LoincCode)
				Values (
					@ReferenceId,
					@Name,
					@LabTestId,
					@DataType,
					@Rank,
					@UserId,
					getdate(),
					0,
					@LoincCode );
				Select @ParameterId = scope_identity();
			End
			Else Begin
				Update Mst_LabTestParameter Set
					ParameterName = isnull(@Name,ParameterName),
					DataType = @DataType,
					OrdRank = @Rank,
					LoincCode=@LoincCode,
					UpdateDate=getdate(),
					UserId =@UserId
				Where Id=@ParameterId;
			End
			If(@ConfigList Is Not Null) Begin
				Insert Into @Config(ConfigId, MinBoundary,MaxBoundary,MinNormal,MaxNormal, Unit,DefaultUnit,Limit,DeleteFlag)
				Select
					L.P.query('configid').value('.', 'int') ConfigId,
					convert(decimal(10,2),nullif(L.P.query('minboundary').value('.', 'varchar(10)'),'')) MinBoudary,
					convert(decimal(10,2),nullif(L.P.query('maxboundary').value('.', 'varchar(10)'),''))MaxBoundary,
					convert(decimal(10,2),nullif(L.P.query('minnormal').value('.', 'varchar(10)'),'')) MinNormal,
					convert(decimal(10,2),nullif(L.P.query('maxnormal').value('.', 'varchar(10)'),'')) MaxNormal,			
					L.P.query('unit').value('.', 'int') unit,
					L.P.query('defaultunit').value('.', 'bit') defaultunit,
					convert(decimal(10,2),nullif(L.P.query('limit').value('.', 'varchar(10)'),'')) Limit,	
					L.P.query('deleteflag').value('.', 'bit') DeleteFlag
				From @ConfigList.nodes('/root/config') As L (P);		
			End
			If(@OptionList Is Not Null) Begin
				Insert Into @ResultOption(OptionId,OptionValue,DeleteFlag)
				Select
					L.O.query('optionid').value('.', 'int') OptionId,
					L.O.query('value').value('.', 'varchar(50)') Value,
					L.O.query('deleteflag').value('.', 'bit') DeleteFlag
				From @OptionList.nodes('/root/options') As L (O);
			End
	
			Update p Set	
				MinBoundary= C.MinBoundary,
				MaxBoundary = C.MaxBoundary,
				MinNormalRange = C.MinNormal,
				MaxNormalRange = C.MaxNormal,
				UnitId = C.Unit,
				DefaultUnit = C.DefaultUnit,
				DetectionLimit = C.Limit,
				DeleteFlag = C.DeleteFlag
			From dtl_LabTestParameterConfig P
			Inner Join @Config C On  C.ConfigId = P.Id	And p.ParameterId = @ParameterId;

			Update p Set	
				MinBoundary= C.MinBoundary,
				MaxBoundary = C.MaxBoundary,
				MinNormalRange = C.MinNormal,
				MaxNormalRange = C.MaxNormal,
				UnitId = C.Unit,
				DefaultUnit = C.DefaultUnit,
				DetectionLimit = C.Limit,
				DeleteFlag = C.DeleteFlag
			From dtl_LabTestParameterConfig P
			Inner Join @Config C On C.Unit = P.UnitId
			Where P.ParameterId = @ParameterId And (ConfigId < 1 or ConfigId Is Null);


			Delete C From @Config C Inner Join dtl_LabTestParameterConfig P On P.UnitId = C.Unit
			Where P.ParameterId = @ParameterId And (ConfigId < 1 or ConfigId Is Null);

			Insert Into dtl_LabTestParameterConfig (
				ParameterId,
				MinBoundary,
				MaxBoundary,
				MinNormalRange,
				MaxNormalRange,
				UnitId,
				DefaultUnit,
				DetectionLimit,
				DeleteFlag)
			Select 
				@ParameterId,
				MinBoundary,
				MaxBoundary,
				MinNormal,
				MaxNormal,
				Unit,
				DefaultUnit,
				Limit,
				0
			From @Config Where DeleteFlag = 0 And (ConfigId < 1 or ConfigId Is Null) ;

			Update RO Set
				Value = O.OptionValue,
				DeleteFlag = O.DeleteFlag
			From dtl_LabTestParameterResultOption RO
			Inner Join @ResultOption O On RO.Id = O.OptionId
					And RO.ParameterId = @ParameterId;

			Insert Into dtl_LabTestParameterResultOption (
				ParameterId,
				Value,
				DeleteFlag)
			Select	@ParameterId,
					OptionValue,
					0
			From @ResultOption Where DeleteFlag = 0 And (OptionId < 1 or OptionId Is Null);

			Select	Id,
					ReferenceId,
					ParameterName,
					LabTestId,
					DataType,
					P.OrdRank,
					LoincCode,
					UserId,
					CreateDate,
					UpdateDate,
					DeleteFlag
			From Mst_LabTestParameter As P
			Where (Id = @ParameterId);

			Select	Id,
					ParameterId,
					MinBoundary,
					MaxBoundary,
					MinNormalRange,
					MaxNormalRange,
					C.UnitId,
					U.UnitName,
					Isnull(DefaultUnit,0) DefaultUnit,
					DetectionLimit,
					C.DeleteFlag
			From dtl_LabTestParameterConfig C
			Inner Join vw_LabTestParameterUnits U On U.UnitId = C.UnitId
			Where (ParameterId = @ParameterId)
			And (C.DeleteFlag = 0);

			Select	Id,
					ParameterId,
					Value,
					DeleteFlag
			From dtl_LabTestParameterResultOption
			Where (ParameterId = @ParameterId)
			And (DeleteFlag = 0);
		If @@TRANCOUNT > 0 Commit Transaction saveTP;
		End Try 
		Begin Catch
			Declare @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
			Select	@ErrorMessage = error_message(),
					@ErrorSeverity = error_severity(),
					@ErrorState = error_state();
			Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
			If @@TRANCOUNT > 0 Rollback Transaction saveTP;
		End Catch;
End

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_SaveTestResult]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveTestResult]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_SaveTestResult] AS' 
END
GO

-- =============================================
-- Author:  Joseph N
-- Create date: 20160223
-- Description: Save Lab Result
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_SaveTestResult] 
 -- Add the parameters for the stored procedure here
 @LabTestOrderId int , 
 
 @ParameterList xml = null   ,
 @UserId int ,
 @ResultNotes varchar(250) = null,
 @ResultBy int,
 @ResultDate datetime
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

    -- Insert statements for procedure here
 Declare @Results Table(ResultId int, 
       ParameterId int, 
       ResultValue decimal(10,2), 
       ResultText varchar(400), 
       ResultOption varchar(50), 
       ResultOptionValue int,
       ResultDate datetime, 
       ResultBy int,
       ResultUnit varchar(50) ,        
       ConfigId int,
       ResultUnitValue int,
       Undetectable bit,
       DetectionLimit decimal(10,2));
 
   Insert Into @Results(
    ResultId,
    ParameterId,
    ResultValue,
    ResultText,
    ResultOption,
    ResultOptionValue,
    ResultDate,
    ResultBy,
    ResultUnitValue,
    ResultUnit,    
    Undetectable,
    DetectionLimit,
    ConfigId
   )
   Select
    L.G.query('id').value('.', 'int') ResultId,
    L.G.query('parameterid').value('.', 'int') ParameterId,
    Convert(decimal(10,2),nullif(L.G.query('resultvalue').value('.', 'varchar(10)'), '')) ResultValue,
    nullif(L.G.query('resulttext').value('.', 'varchar(400)'), '') ResultText,
    nullif(L.G.query('resultoption').value('.', 'varchar(50)'), '') ResultOption,
    nullif(L.G.query('resultoptionvalue').value('.', 'int'), '') ResultOptionValue,
    nullif(L.G.query('resultdate').value('.', 'datetime'), '') ResultDate,
    nullif(L.G.query('resultby').value('.', 'int'), '') ResultBy,
    nullif(L.G.query('resultunitid').value('.', 'int'), '') ResultUnitValue,
    nullif(L.G.query('resultunit').value('.', 'varchar(50)'), '') ResultUnit ,
    nullif(L.G.query('undectectable').value('.', 'bit'), '') Undetectable,
    Convert(decimal(10,2),nullif(L.G.query('detectionlimit').value('.', 'varchar(10)'), '')) DetectionLimit,
    nullif(L.G.query('configid').value('.', 'int'), '') ConfigId
   From @ParameterList.nodes('/root/result') As L (G);
  
   
  Begin Transaction LabOrder
  Begin Try
   
   Update T Set
    ResultValue  = Isnull(T.ResultValue,R.ResultValue),
    ResultText  = Isnull(T.ResultText,R.ResultText),
    ResultOption = Isnull(T.ResultOption,R.ResultOption),
    ResultOptionId  = Isnull(T.ResultOptionId, R.ResultOptionValue),
    ResultUnitId = isnull(T.ResultUnitId, R.ResultUnitValue),
    ResultUnit  = Isnull(T.ResultUnit,R.ResultUnit),
    Undetectable = Isnull(T.Undetectable,R.Undetectable),
    DetectionLimit = Isnull(T.DetectionLimit, R.DetectionLimit),
    ResultConfigId =isnull(T.ResultConfigId,R.ConfigId),
    Statusdate  = getdate(),
    UserId= @UserId
   From dtl_LabOrderTestResult T
   Inner Join @Results R On R.ResultId = T.Id
     And R.ParameterId = T.ParameterId
   Where T.HasResult = 0
   And T.DeleteFlag = 0
   And T.LabOrderTestId = @LabTestOrderId;
   If(@@rowcount > 0) Begin
    Update dtl_LabOrderTest Set 
     ResultNotes = nullif(@ResultNotes,'') ,
     ResultBy = @ResultBy,
     ResultDate = @ResultDate,
     ResultStatus='Received',
     UserId = @UserId,
     StatusDate = getdate()
    Where Id = @LabTestOrderId;

    declare @labOrderId int, @PendingCount int; 
   
    Select Top 1 @labOrderId = T.LabOrderId From   dtl_LabOrderTest T Where Id=@LabTestOrderId;

    Select @PendingCount = Count(T.Id)
    From dtl_LabOrderTest T
    Inner Join mst_LabTestMaster M On T.LabTestId = M.Id
    Where T.LabOrderId = @labOrderId
     And M.IsGroup = 0
     And T.ResultDate Is Null;

     --Select  @labOrderId  = Max(LabOrderId),
     -- @PendingCount = Count(T.Id) - Sum(Case When ResultDate Is Not Null Then 1 Else 0 End)
     --From dtl_LabOrderTest T Inner Join mst_LabTestMaster M On T.LabTestId= M.Id Where LabOrderId = @labOrderId And M.IsGroup = 0;
     -- T.Id=@LabTestOrderId And M.IsGroup = 0;
     
    -- Update ord_LabOrder Set OrderStatus = Case When @PendingCount = 0 Then 'Complete' Else OrderStatus End
    Update ord_LabOrder Set OrderStatus =  'Partially Completed'  Where Id=@labOrderId;

    If(@PendingCount = 0) Begin
     Update dtl_LabOrderTest Set
       ResultStatus = 'Received'
      , ResultNotes = 'Group lab tests complete'
      , UserId = @UserId
      , ResultDate = @ResultDate
      , StatusDate = getdate()
      , ResultBy = @ResultBy
     Where LabOrderId = @labOrderId
     And ResultDate Is Null
     Update ord_LabOrder Set OrderStatus = 'Complete'  Where Id=@labOrderId;     
     
     Update ord_Visit set DataQuality = 1 Where Visit_Id = (Select VisitId From ord_LabOrder Where Id= @labOrderId)
    End

   End
   If @@TRANCOUNT > 0 Commit Transaction LabOrder;
  End Try 
  Begin Catch
   Declare @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
   Select @ErrorMessage = error_message(),
     @ErrorSeverity = error_severity(),
     @ErrorState = error_state();
   Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
   If @@TRANCOUNT > 0 Rollback Transaction LabOrder;
  End Catch;

END
GO
/****** Object:  StoredProcedure [dbo].[mstPatient_Insert]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mstPatient_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[mstPatient_Insert] AS' 
END
GO

-- =============================================
-- Author: Felix Kithinji
-- Create date: 15-Mar-2017
-- Description: Insert
-- =============================================
ALTER PROCEDURE [dbo].[mstPatient_Insert] 
 -- Add the parameters for the stored procedure here
 @FirstName varchar(MAX),
 @LastName varchar(MAX),
 @MiddleName varchar(MAX),
 @LocationID int,
 @PatientEnrollmentID varchar(50),
 @ReferredFrom int,
 @RegistrationDate datetime,
 @Sex int,
 @DOB datetime,
 @DobPrecision int,
 @MaritalStatus int,
 @Address varchar(MAX),
 @Phone varchar(MAX),
 @UserID int,
 @PosId varchar(10),
 @ModuleId int,
 @StartDate datetime,
 @CreateDate datetime
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

 DECLARE @Ptn_Pk int;
 DECLARE @EntryPointName varchar(50);
 DECLARE @Referral int;
 DECLARE @MaritalStatusName varchar(50);
 DECLARE @MaritalStatusId int;

 BEGIN
  Select @EntryPointName = ItemName
  from LookupItemView where ItemId=@ReferredFrom;

  SELECT @MaritalStatusName = ItemName
  from LookupItemView where ItemId=@MaritalStatus;

  select TOP 1 @Referral = ID from mst_Decode where NAME LIKE + '%'+ @EntryPointName + '%' AND CodeID = 17;
  select TOP 1 @MaritalStatusId = ID from mst_Decode where Name LIKE + '%'+ @MaritalStatusName + '%' AND CodeID=12;

  IF @Referral IS NULL
  BEGIN
  select TOP 1 @Referral = ID from mst_Decode where NAME = 'VCT'
  END
 END

    -- Insert statements for procedure here
 Insert Into mst_Patient(FirstName, LastName, MiddleName, LocationID, PatientEnrollmentID, ReferredFrom, RegistrationDate, Sex, DOB, DobPrecision, MaritalStatus, Address, Phone, UserID, PosId, Status, DeleteFlag, CreateDate,MovedToPatientTable)
 Values(
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@FirstName),
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@LastName),
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MiddleName),
  @LocationID,
  @PatientEnrollmentID,
  @Referral,
  @RegistrationDate,
  @Sex,
  @DOB,
  @DobPrecision,
  @MaritalStatusId,
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@Address),
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@Phone),
  @UserID,
  @PosId,
  0,
  0,
  @CreateDate,
  1
 );
 SELECT @Ptn_Pk=@@IDENTITY;
 SELECT SCOPE_IDENTITY() Ptn_Pk;

 Insert Into Lnk_PatientProgramStart(Ptn_pk, ModuleId, StartDate, UserID, CreateDate)
 Values(
  @Ptn_Pk,
  @ModuleId,
  @StartDate,
  @UserID,
  @CreateDate
 );
END
GO
/****** Object:  StoredProcedure [dbo].[Ord_Visit_Insert]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ord_Visit_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Ord_Visit_Insert] AS' 
END
GO

-- =============================================
-- Author: Felix Kithinji
-- Create date: 15-Mar-2017
-- Description: Insert
-- =============================================
ALTER PROCEDURE [dbo].[Ord_Visit_Insert]
 -- Add the parameters for the stored procedure here
 @Ptn_Pk int,
 @LocationID int,
 @VisitDate datetime,
 @VisitType int,
 @UserID int,
 @CreateDate datetime,
 @ModuleId int
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

 DECLARE @Id int

    -- Insert statements for procedure here
 Insert Into ord_Visit(Ptn_Pk, LocationID, VisitDate, VisitType, DeleteFlag, UserID, CreateDate, CreatedBy, ModuleId)
 Values(
  @Ptn_Pk,
  @LocationID,
  @VisitDate,
  @VisitType,
  0,
  @UserID,
  @CreateDate,
  @UserID,
  @ModuleId
 );
 SELECT @Id=@@IDENTITY;
END


GO
/****** Object:  StoredProcedure [dbo].[Patient_Insert]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patient_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Patient_Insert] AS' 
END
GO
ALTER PROCEDURE [dbo].[Patient_Insert] 
 -- Add the parameters for the stored procedure here
 @PersonId int,
 @ptn_pk int = null,
 @PatientIndex varchar(50),
 @DateOfBirth datetime,
 @NationalId varchar(100),
 @FacilityId int,
 @UserId int,
 @Active bit,
 @PatientType int,
 @DobPrecision bit
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

    -- Insert statements for procedure here
 Insert Into  Patient(ptn_pk,PersonId,PatientIndex,PatientType,FacilityId,Active,DateOfBirth,NationalId,DeleteFlag,CreatedBy,CreateDate,AuditData,DobPrecision)
 Values(
  @ptn_pk,
  @PersonId,
  @PatientIndex,
  @PatientType,
  @FacilityId,
  @Active,
  @DateOfBirth,
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@NationalId),
  0,
  @UserId,
  GETDATE(),
  NULL,
  @DobPrecision
 );
SELECT SCOPE_IDENTITY() Id;
END

GO
/****** Object:  StoredProcedure [dbo].[Patient_Update]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patient_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Patient_Update] AS' 
END
GO

-- =============================================
-- Author: Felix Kithinji
-- Create date: 15-Mar-2017
-- Description: update
-- =============================================
ALTER PROCEDURE [dbo].[Patient_Update] 
 -- Add the parameters for the stored procedure here
 @ptn_pk int = null,
 @DateOfBirth datetime,
 @NationalId varchar(100),
 @FacilityId int,
 @Id int
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

    -- Insert statements for procedure here
 UPDATE Patient
 SET
  ptn_pk = @ptn_pk,
  DateOfBirth = @DateOfBirth,
  NationalId=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@NationalId),
  FacilityId=@FacilityId
 WHERE
  Id=@Id
END


GO
/****** Object:  StoredProcedure [dbo].[PatientTreatmentSupporter_Insert]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientTreatmentSupporter_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PatientTreatmentSupporter_Insert] AS' 
END
GO


-- =============================================
-- Author: Felix
-- Create date: 28-Apr-2017
-- Description: Insert into Patient Treatment Supporter
-- =============================================
ALTER PROCEDURE [dbo].[PatientTreatmentSupporter_Insert] 
 -- Add the parameters for the stored procedure here
 @PersonId int, 
 @SupporterId int,
 @MobileContact varbinary(max),
 @CreatedBy int
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

 IF @MobileContact IS NULL
  SET @MobileContact = NULL;
 ELSE
  SET @MobileContact = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MobileContact);

    -- Insert statements for procedure here
 INSERT INTO PatientTreatmentSupporter([PersonId], [SupporterId], [MobileContact], [DeleteFlag], [CreatedBy], [CreateDate])
 VALUES(@PersonId, @SupporterId, @MobileContact, 0, @CreatedBy, GETDATE());

 SELECT SCOPE_IDENTITY() Id;
END



GO
/****** Object:  StoredProcedure [dbo].[Person_Insert]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Person_Insert] AS' 
END
GO
-- =============================================
-- Author:  Steve Osewe
-- Create date: 20-Jan-2017
-- Description: Insert
-- =============================================
ALTER PROCEDURE [dbo].[Person_Insert]
 -- Add the parameters for the stored procedure here
 @FirstName varchar(100),
 @MidName varchar(100)= Null,
 @LastName varchar(100),
 @Sex int,
 --@DateOfBirth date,
 --@NationalId varchar(100) = null,
 @UserId int
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

 --if(@DateOfBirth is null)BEGIN SET @DateOfBirth='1989-06-15' END
    -- Insert statements for procedure here
 Insert Into Person(FirstName, MidName,LastName,Sex,Active,DeleteFlag,CreateDate,CreatedBy)
 Values(
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@FirstName),
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MidName),
  ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@LastName),
  @Sex,
  --@DateOfBirth,
  --ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@NationalId),
  1,
  0,
  GETDATE(),
  @UserId
 );
 SELECT SCOPE_IDENTITY() PersonId;
END
GO
/****** Object:  StoredProcedure [dbo].[Person_Update]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Person_Update] AS' 
END
GO
ALTER PROCEDURE [dbo].[Person_Update]
 -- Add the parameters for the stored procedure here
 @FirstName varchar(100),
 @MidName varchar(100)= Null,
 @LastName varchar(100),
 @Sex int,
 --@DateOfBirth date,
 --@NationalId varchar(100) = null,
 @Id int
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

    -- Insert statements for procedure here
 UPDATE Person
 SET
  FirstName=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@FirstName),
  MidName=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MidName),
  LastName=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@LastName),
  Sex=@Sex
  --DateOfBirth=@DateOfBirth,
  --NationalId=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@NationalId)
 WHERE
   Id=@Id;
END
GO
/****** Object:  StoredProcedure [dbo].[PersonContact_Insert]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonContact_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PersonContact_Insert] AS' 
END
GO
-- =============================================
-- Author:		Steve Osewe
-- Create date: 20-Jan-2017
-- Description:	Insert
-- =============================================
ALTER PROCEDURE [dbo].[PersonContact_Insert]
	-- Add the parameters for the stored procedure here
	@PersonId int=Null,
	@PhysicalAddress varbinary(max)= Null,
	@MobileNumber varbinary(max)=Null,
	@AlternativeNumber varbinary(max)=Null,
	@EmailAddress varbinary(max)=Null,
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Declare @Id int;

	 IF @MobileNumber IS NULL
  SET @MobileNumber = NULL;
 ELSE
  SET @MobileNumber = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MobileNumber);

	if( @AlternativeNumber IS NULL)
		BEGIN
		  SET @AlternativeNumber = NULL;
		END
	else
	BEGIN
	  SET @AlternativeNumber=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@AlternativeNumber)
	END

	if(@EmailAddress is null)
	begin
		SET @EmailAddress= NULL;
	end
	else
		begin
		  SET @EmailAddress=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@EmailAddress);
		end

	Insert Into PersonContact(PersonId,PhysicalAddress,MobileNumber,AlternativeNumber,EmailAddress,Active,DeleteFlag,CreateDate,CreatedBy)
	Values(
		@PersonId,
		ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@PhysicalAddress),
		@MobileNumber,
		-- ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MobileNumber),
		@AlternativeNumber,
		@EmailAddress,
		1,
		0,
		GETDATE(),
		@UserId
	);
	SET @Id =(Select SCOPE_IDENTITY() Id);
	
	-- Set Previous Contacts to Zero
	if(@Id>0)
	BEGIN
		UPDATE PersonContact SET Active=0 WHERE PersonId=@PersonId AND Id NOT IN(Id);
	END
END

GO
/****** Object:  StoredProcedure [dbo].[PersonContact_Update]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonContact_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PersonContact_Update] AS' 
END
GO
ALTER PROCEDURE [dbo].[PersonContact_Update]
 -- Add the parameters for the stored procedure here
 @PersonId int=Null,
 @PhysicalAddress varbinary(max)= Null,
 @MobileNumber varbinary(max)=Null,
 @AlternativeNumber varbinary(max)=Null,
 @EmailAddress varbinary(max)=Null,
 @Id int
AS
BEGIN
 -- SET NOCOUNT ON added to prevent extra result sets from
 -- interfering with SELECT statements.
 SET NOCOUNT ON;

 if( @AlternativeNumber IS NULL)
  BEGIN
    SET @AlternativeNumber = NULL;
  END
 else
 BEGIN
   SET @AlternativeNumber=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@AlternativeNumber)
 END

 if(@EmailAddress is null)
 begin
  SET @EmailAddress= NULL;
 end
 else
  begin
    SET @EmailAddress=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@EmailAddress);
  end

    -- Insert statements for procedure here
    UPDATE PersonContact
 SET
  PhysicalAddress=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@PhysicalAddress),
  MobileNumber=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@MobileNumber),
  AlternativeNumber=@AlternativeNumber,
  EmailAddress=@EmailAddress
 WHERE 
  PersonId=@PersonId 
  AND
  Id=@Id 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_GetBMI]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_GetBMI]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_GetBMI] AS' 
END
GO
ALTER procedure [dbo].[pr_GetBMI]
(
@ptnpk varchar(50),
@locationID varchar(50),
@VisitID varchar(50)
)
as 
begin
-- select * from  dbo.dtl_PatientVitals where ptn_pk=128 and locationid=757 and visit_pk=1110 and height is not null and weight is not null

if exists(select 1 from  dbo.dtl_PatientVitals where ptn_pk=@ptnpk and locationid=@locationID and visit_pk=@VisitID and height is not null and weight is not null)
  begin 
		select  Weight / ((height / 100) * (height / 100))[BMI] from  dbo.dtl_PatientVitals where ptn_pk=@ptnpk and locationid=@locationID and visit_pk=@VisitID and height is not null and weight is not null
	end 
else if exists(select 1 from  dbo.dtl_PatientVitals where ptn_pk=@ptnpk and locationid=@locationID and height is not null and weight is not null)
 begin 
		select top 1 Weight / ((height / 100) * (height / 100))[BMI] from  dbo.dtl_PatientVitals where ptn_pk=@ptnpk and locationid=@locationID and height is not null and weight is not null order by visit_pk desc
	end 
else 
 begin select 0.0
	end 
end

GO
/****** Object:  StoredProcedure [dbo].[pr_Lab_AddResults_Constella]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Lab_AddResults_Constella]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_Lab_AddResults_Constella] AS' 
END
GO
--temp change for removing validation          
ALTER PROCEDURE [dbo].[pr_Lab_AddResults_Constella]                
@LabID int, @LocationID int,@labTestID int, @ParameterID int ,@TestResults decimal(18,4),              
@TestResults1 varchar(2000),@TestResultId int,@Financed int,@UnitId int,@UserId int               
AS    
Declare @Ptn_pk int   
Declare @Visit_ID int  
Declare @Subtestid int  
Declare @itemtypeid int  
Declare @ReportedbyDate datetime  
Declare @SellingPrice decimal  
Declare @CostPrice decimal  
Declare @Margin decimal  
  
               
BEGIN                
      
---- Rupesh 19Dec07----      
--INSERT INTO dtl_PatientLabResults(LabID,LocationID,LabTestID,ParameterID,TestResults,TestResults1,TestResultId,Financed,Units,UserId,CreateDate)                
--VALUES                
--(@LabID ,@LocationId , @LabTestID , @ParameterID,@TestResults,@TestResults1,@TestResultId,@Financed,@UnitId,@UserId,getdate() )                
      
if(@TestResults=99998888)      
 BEGIN      
  INSERT INTO dtl_PatientLabResults(LabID,LocationID,LabTestID,ParameterID,TestResults1,TestResultId,Financed,Units,UserId,CreateDate)                
  VALUES                
  (@LabID ,@LocationId , @LabTestID , @ParameterID,@TestResults1,@TestResultId,@Financed,@UnitId,@UserId,getdate() )                
 END      
ELSE      
 BEGIN      
  INSERT INTO dtl_PatientLabResults(LabID,LocationID,LabTestID,ParameterID,TestResults,TestResults1,TestResultId,Financed,Units,UserId,CreateDate)                
  VALUES                
  (@LabID ,@LocationId , @LabTestID , @ParameterID,@TestResults,@TestResults1,@TestResultId,@Financed,@UnitId,@UserId,getdate() )                
 END      
    
 update dtl_PatientLabResults set LocationID=(select LocationID from ord_PatientLabOrder where LabID=@LabID)    
    where LabID=@LabID    
--END          
      
    
 Select @Ptn_pk=Ptn_pk,@ReportedbyDate=ReportedbyDate,@Visit_ID=VisitId  
 from ord_PatientLabOrder where LabID=@LabID  
  
select @CostPrice=a.testcostprice,@Margin=a.testmargin,  
@SellingPrice=a.testsellingprice   
from Lnk_LabCostConfiguration a right outer join lnk_TestParameter b on b.subtestId=a.subtestId  
where b.subtestId= @ParameterID   
   
if(@ParameterID<>'')  
  BEGIN
   if(@TestResults<99998888 or @TestResults1<>'' or @TestResultId>0)
    BEGIN
     --PRINT('HELLO')
	  INSERT INTO Dtl_PatientBillTransaction(Ptn_Pk,VisitId,LocationId,TransactionDate,LabId,ItemId,Quantity,
	  SellingPrice,CostPrice,Margin,BillAmount,UserId,CreateDate,PharmacyId,BatchId,DispensingUnit,ConsultancyFee,AdminFee,DoctorId)  
	  VALUES(@Ptn_pk,@Visit_ID,@LocationId,@ReportedbyDate,@LabID,@ParameterID,1,isnull(@SellingPrice,0),
	   isnull(@CostPrice,0),isnull(@Margin,0),dbo.fn_GetLabPerVisit_BillAmount_Futures(@SellingPrice,@ParameterID),@UserId,getdate(),0,0,0,0.00,0.00,0)
     END
  END                          
END  
  
   
          
/*          
//--backup    ajay      
CREATE PROCEDURE [dbo].[pr_Lab_AddResults_Constella]                
@LabID int, @LocationID int,@labTestID int, @ParameterID int ,@TestResults decimal(18,2),              
@TestResults1 varchar(2000),@TestResultId int,@Financed int,@UserId int               
AS                
BEGIN                
              
INSERT INTO dtl_PatientLabResults(LabID,LocationID,LabTestID,ParameterID,TestResults,TestResults1,TestResultId,Financed,UserId,CreateDate)                
VALUES                
(@LabID ,@LocationId , @LabTestID , @ParameterID,@TestResults,@TestResults1,@TestResultId,@Financed,@UserId,getdate() )               
                
END          
*/

GO
/****** Object:  StoredProcedure [dbo].[pr_Lab_UpdateResults_Constella]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Lab_UpdateResults_Constella]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_Lab_UpdateResults_Constella] AS' 
END
GO
ALTER PROCEDURE [dbo].[pr_Lab_UpdateResults_Constella]                                
@LabID int, @LocationID int=null, @ParameterID int=null ,@TestResults decimal(18,4)=null,                              
@TestResults1 varchar(2000)=null,@TestResultId int=null,@Financed int = null,@UnitId int=null,@UserId int=null                              
AS                                
BEGIN        
 Declare @LabTestID int     
Declare @Ptn_pk int       
Declare @Visit_ID int      
Declare @Subtestid int      
Declare @itemtypeid int      
Declare @ReportedbyDate datetime      
Declare @SellingPrice decimal      
Declare @CostPrice decimal      
Declare @Margin decimal    
    
 Select @Ptn_pk=Ptn_pk,@ReportedbyDate=ReportedbyDate,@Visit_ID=VisitId      
  from ord_PatientLabOrder where LabID=@LabID      
      
 select @Subtestid=a.Subtestid,@CostPrice=a.testcostprice,@Margin=a.testmargin,      
 @SellingPrice=a.testsellingprice       
 from Lnk_LabCostConfiguration a right outer join lnk_TestParameter b on b.subtestId=a.subtestId      
 where b.subtestId= @ParameterID                              
 if (@ParameterID = 100)                
  Begin             
                      
    select @LabTestID = TestID from Lnk_TestParameter where SubTestID=@ParameterID             
             
    Insert into dtl_PatientLabResults(LabID, LocationID, LabTestID, ParameterID, TestResults, TestResults1,TestResultId, Financed, Units, UserId)              
    values(@LabID, @LocationID, @LabTestID, @ParameterID, Nullif(@TestResults, '99998888'), @TestResults1,@TestResultId,@Financed,@UnitId,@UserId)    
    if(@TestResults<99998888 or @TestResults1<>'' or @TestResultId>0)    
     BEGIN    
    INSERT INTO Dtl_PatientBillTransaction(Ptn_Pk,VisitId,LocationId,TransactionDate,LabId,ItemId,Quantity,    
    SellingPrice,CostPrice,Margin,BillAmount,UserId,CreateDate,PharmacyId,BatchId,DispensingUnit,ConsultancyFee,AdminFee,DoctorId)      
    VALUES(@Ptn_pk,@Visit_ID,@LocationId,@ReportedbyDate,@LabID,@ParameterID,1,isnull(@SellingPrice,0),    
    isnull(@CostPrice,0),isnull(@Margin,0),dbo.fn_GetLabPerVisit_BillAmount_Futures(@SellingPrice,@ParameterID),@UserId,getdate(),0,0,0,0.00,0.00,0)    
     END   
  End              
else               
 Begin  -- for Paperless Business Rules           
  if(@ParameterID = 97 or @ParameterID = 98 or @ParameterID = 99)          
   Begin          
  if (@TestResultId = 0)          
  Begin          
   Update dtl_PatientLabResults                  
   Set TestResults=Nullif(@TestResults, '99998888'),                
   TestResults1=Nullif(@TestResults1,''),                  
   TestResultId=NULL,                  
   Financed=@Financed,                  
   Units=@UnitId,                  
   UserID=@UserId,                  
   UpdateDate=getdate()                  
   where LabID=@LabID and ParameterID=@ParameterID     
    if(@TestResults<99998888 or @TestResults1<>'' or @TestResultId>0)    
    BEGIN    
      Update Dtl_PatientBillTransaction SET TransactionDate=@ReportedbyDate,SellingPrice=isnull(@SellingPrice,0),CostPrice=isnull(@CostPrice,0),    
      Margin=isnull(@Margin,0),BillAmount=dbo.fn_GetLabPerVisit_BillAmount_Futures(@SellingPrice,@ParameterID),UserId=@UserId,updatedate=getdate()    
      where LabId=@LabID and ItemId=@ParameterID and Ptn_Pk=@Ptn_pk and VisitId=@Visit_ID     
    END    
              
     End          
     else           
    Begin          
  Update dtl_PatientLabResults                  
  Set TestResults=Nullif(@TestResults, '99998888'),                
  TestResults1=Nullif(@TestResults1,''),                  
  TestResultId=@TestResultId,                  
  Financed=@Financed,                  
  Units=@UnitId,                  
  UserID=@UserId,                  
  UpdateDate=getdate()                  
  where LabID=@LabID and ParameterID=@ParameterID     
   if(@TestResults<99998888 or @TestResults1<>'' or @TestResultId>0)    
   BEGIN    
    Update Dtl_PatientBillTransaction SET TransactionDate=@ReportedbyDate,SellingPrice=isnull(@SellingPrice,0),CostPrice=isnull(@CostPrice,0),    
    Margin=isnull(@Margin,0),BillAmount=dbo.fn_GetLabPerVisit_BillAmount_Futures(@SellingPrice,@ParameterID),UserId=@UserId,updatedate=getdate()    
    where LabId=@LabID and ItemId=@ParameterID and Ptn_Pk=@Ptn_pk and VisitId=@Visit_ID     
   END    
            
     End          
             
 End          
else          
  Begin        
    print 'ds'       
        
    if(exists(select LabTestID from  dtl_PatientLabResults where LabID=@LabID and ParameterID=@ParameterID ))      
     begin      
     Update dtl_PatientLabResults                  
  Set TestResults=Nullif(@TestResults, '99998888'),                
  TestResults1=Nullif(@TestResults1,''),                  
  TestResultId=@TestResultId,                  
  Financed=@Financed,                  
  Units=@UnitId,                  
  UserID=@UserId,                  
  UpdateDate=getdate()                  
  where LabID=@LabID and ParameterID=@ParameterID      
  if(@TestResults<99998888 or @TestResults1<>'' or @TestResultId>0)    
   BEGIN   
   if(exists(select LabID from  Dtl_PatientBillTransaction where LabId=@LabID and ItemId=@ParameterID and Ptn_Pk=@Ptn_pk and VisitId=@Visit_ID ))      
   begin     
    Update Dtl_PatientBillTransaction SET TransactionDate=@ReportedbyDate,SellingPrice=isnull(@SellingPrice,0),CostPrice=isnull(@CostPrice,0),    
    Margin=isnull(@Margin,0),BillAmount=dbo.fn_GetLabPerVisit_BillAmount_Futures(@SellingPrice,@ParameterID),UserId=@UserId,updatedate=getdate()    
    where LabId=@LabID and ItemId=@ParameterID and Ptn_Pk=@Ptn_pk and VisitId=@Visit_ID   
            End   
     Else   
   BEGIN      
     INSERT INTO Dtl_PatientBillTransaction(Ptn_Pk,VisitId,LocationId,TransactionDate,LabId,ItemId,Quantity,    
     SellingPrice,CostPrice,Margin,BillAmount,UserId,CreateDate,PharmacyId,BatchId,DispensingUnit,ConsultancyFee,AdminFee,DoctorId)      
     VALUES(@Ptn_pk,@Visit_ID,@LocationId,@ReportedbyDate,@LabID,@ParameterID,1,isnull(@SellingPrice,0),    
     isnull(@CostPrice,0),isnull(@Margin,0),dbo.fn_GetLabPerVisit_BillAmount_Futures(@SellingPrice,@ParameterID),@UserId,getdate(),0,0,0,0.00,0.00,0)    
   END   
   END    
          
     end       
    else      
  begin      
  select @LabTestID = TestID from Lnk_TestParameter where SubTestID=@ParameterID         
    Insert into dtl_PatientLabResults(LabID, LocationID, LabTestID, ParameterID, TestResults, TestResults1,TestResultId, Financed, Units, UserId)              
    values(@LabID, @LocationID, @LabTestID, @ParameterID, Nullif(@TestResults, '99998888'), @TestResults1,@TestResultId,@Financed,@UnitId,@UserId)     
  if(@TestResults<99998888 or @TestResults1<>'' or @TestResultId>0)    
  BEGIN      
       INSERT INTO Dtl_PatientBillTransaction(Ptn_Pk,VisitId,LocationId,TransactionDate,LabId,ItemId,Quantity,    
       SellingPrice,CostPrice,Margin,BillAmount,UserId,CreateDate,PharmacyId,BatchId,DispensingUnit,ConsultancyFee,AdminFee,DoctorId)      
       VALUES(@Ptn_pk,@Visit_ID,@LocationId,@ReportedbyDate,@LabID,@ParameterID,1,isnull(@SellingPrice,0),    
    isnull(@CostPrice,0),isnull(@Margin,0),dbo.fn_GetLabPerVisit_BillAmount_Futures(@SellingPrice,@ParameterID),@UserId,getdate(),0,0,0,0.00,0.00,0)    
     END           
  end      
           
  End             
 End            
END

GO
/****** Object:  StoredProcedure [dbo].[pr_Laboratory_GetLabOrderDate_Constella]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Laboratory_GetLabOrderDate_Constella]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_Laboratory_GetLabOrderDate_Constella] AS' 
END
GO
ALTER PROCEDURE [dbo].[pr_Laboratory_GetLabOrderDate_Constella]                                          
@patientid int,          
@locationid int,  
@LabTestId int                     
                                         
AS                                            
BEGIN                                            
Select OrderedbyName, OrderedbyDate,PreClinicLabDate from dbo.ord_PatientLabOrder where ptn_pk=@patientid and          
LocationID=@locationid and LabId = @LabTestId and (DeleteFlag=0 or deleteFlag is null) order by orderedbyDate desc     
   
            
END

GO
/****** Object:  StoredProcedure [dbo].[Pr_Laboratory_GetLabResults_Constella]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_Laboratory_GetLabResults_Constella]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_Laboratory_GetLabResults_Constella] AS' 
END
GO
ALTER PROCEDURE [dbo].[Pr_Laboratory_GetLabResults_Constella]                   
@LabID int                  
AS                  
BEGIN                  
 -- SET NOCOUNT ON added to prevent extra result sets from                  
 -- interfering with SELECT statements.                  
 SET NOCOUNT ON;                  
            
--Query after Modification of dynamic unit          
--Table 0 
select a.LabID,a.LocationID,a.OrderedByName,a.OrderedByDate,a.ReportedByName,a.ReportedByDate,a.CheckedByName,a.CheckedByDate,a.PreClinicLabDate, a.LabPeriod,                 
b.LabTestID,c.SubTestId,b.TestResults,b.TestResults1,b.TestResultId,b.Financed,      
c.subtestname [SubTestName],d.LabTypeID 'LabTypeID',d.LabName,b.Units,e.name as UnitName,            
f.MinBoundaryValue,f.MaxBoundaryValue,a.LabNumber       
from ord_PatientlabOrder a       
inner join dtl_PatientLabResults b on a.labid = b.labid      
left outer join mst_Decode e on e.Id=b.Units              
left outer join lnk_labValue f  on  f.UnitId=b.units and f.SubTestId=b.ParameterId         
left outer join  lnk_testParameter c on c.subtestid=b.parameterId       
inner join mst_labtest d on c.testid=d.labtestid         
where a.labid=@LabID           
          
--Table 1
--select COALESCE(TestResults, TestResults1, TestResultId)[Result] from dbo.dtl_PatientLabResults where LabId=@LabID
--group by TestResults, TestResults1, TestResultId having COALESCE(TestResults, TestResults1, TestResultId) IS NOT NULL

select COALESCE(CAST(TestResults AS VARCHAR), CAST(TestResults1 AS VARCHAR), CAST(TestResultId AS VARCHAR))[Result] 
from dbo.dtl_PatientLabResults where LabId=@LabID
group by TestResults, TestResults1, TestResultId 
having COALESCE(CAST(TestResults AS VARCHAR), CAST(TestResults1 AS VARCHAR), CAST(TestResultId AS VARCHAR)) IS NOT NULL

END

GO
/****** Object:  StoredProcedure [dbo].[Pr_Laboratory_GetLabTestID_Constella]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_Laboratory_GetLabTestID_Constella]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_Laboratory_GetLabTestID_Constella] AS' 
END
GO
ALTER PROCEDURE [dbo].[Pr_Laboratory_GetLabTestID_Constella]                 
@LabID int                
AS                
BEGIN                
 -- SET NOCOUNT ON added to prevent extra result sets from                
 -- interfering with SELECT statements.                
 SET NOCOUNT ON;                
 Select LabID, OrderedbyName, OrderedbyDate, LabPeriod from ord_PatientLabOrder where LabID=@LabID       
      
 Select ParameterID from Dtl_PatientLabResults where LabID=@LabID         
       
 --select d.parameterid[TestId],l.LabName[TestName],m.labdepartmentname[Department] from  Dtl_PatientLabResults d    
 --inner join mst_labtest l on d.parameterid=l.LabTestID  
 --inner join mst_labdepartment m on m.LabDepartmentID=l.LabDepartmentID  
 --where d.LabID=@LabID  
  select b.SubTestId[TestId], b.SubTestName[TestName], d.labdepartmentname[Department]
  from Dtl_PatientLabResults a inner join lnk_testparameter b
  on a.ParameterID=b.SubTestId inner join mst_labtest c
  on a.LabTestId=c.LabTestId
  inner join mst_labdepartment d on c.LabDepartmentId=d.LabDepartmentID
  where a.LabId=@LabID
      
END

GO
/****** Object:  StoredProcedure [dbo].[pr_Laboratory_GetLabValues_constella]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Laboratory_GetLabValues_constella]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_Laboratory_GetLabValues_constella] AS' 
END
GO
ALTER PROCEDURE [dbo].[pr_Laboratory_GetLabValues_constella]                
         
AS                
            
BEGIN                
          
    
select a.LabTestId,a.LabName,b.SubTestId,b.SubTestName,c.MinBoundaryValue,            
c.MaxBoundaryValue,c.MinNormalRange,c.MaxNormalRange            
from Mst_LabTest a,Lnk_TestParameter b,Lnk_LabValue c            
where a.LabTestId = b.TestId and b.SubTestId = c.SubTestId            
order by a.LabTestId       
          
select a.LabTestId,a.LabName,b.SubTestId,b.SubTestName,c.ResultId,c.Result          
from Mst_LabTest a,Lnk_TestParameter b,Lnk_ParameterResult c            
where a.LabTestId = b.TestId and b.SubTestId = c.ParameterId           
order by a.LabTestId               
        
select a.LabTestId,a.LabName,b.SubTestId,b.SubTestName,c.LabTypeId,c.LabTypeName,        
d.LabDepartmentId,d.LabDepartmentName,a.DeleteFlag       
from Mst_LabTest a,Lnk_TestParameter b,Mst_LabType c,Mst_LabDepartment d        
where a.LabTestId = b.TestId and a.LabTypeId = c.LabTypeId and         
a.LabDepartmentId = d.LabDepartmentId  
order by a.LabTestId           
        
Select b.SubTestId,b.SubTestName,c.MinBoundaryValue,            
c.MaxBoundaryValue,c.MinNormalRange,c.MaxNormalRange            
from Lnk_TestParameter b,Lnk_LabValue c            
where  b.SubTestId = c.SubTestId            
        
/*            
select c.DefaultUnit,c.id,c.unitID,d.Name as UnitName,a.LabTestId,a.LabName,b.SubTestId,b.SubTestName,c.MinBoundaryValue,            
c.MaxBoundaryValue,c.MinNormalRange,c.MaxNormalRange    from     
mst_labTest a right outer join lnk_testparameter b on a.LabTestId=b.TestId    
inner join Lnk_LabValue c on b.SubTestId=c.SubTestId    
left outer join mst_Decode d on d.Id=c.UnitId     
where     
c.DefaultUnit=1 and d.CodeId=133    
*/    
select c.DefaultUnit,d.codeid,c.id,c.unitID,d.Name as UnitName,a.LabTestId,a.LabName,b.SubTestId,b.SubTestName,c.MinBoundaryValue,            
c.MaxBoundaryValue,c.MinNormalRange,c.MaxNormalRange    from     
mst_labTest a right outer join lnk_testparameter b on a.LabTestId=b.TestId    
inner join Lnk_LabValue c on b.SubTestId=c.SubTestId    
left outer join mst_Decode d on d.Id=c.UnitId     
where     
(c.DefaultUnit=1 or c.defaultUnit is null) and (d.CodeId=30  or d.CodeId is null)    
and (c.deleteFlag=0 or c.deleteFlag is null)    
            
END

GO
/****** Object:  StoredProcedure [dbo].[pr_Laboratory_GetPatientInfo_Constella]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Laboratory_GetPatientInfo_Constella]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_Laboratory_GetPatientInfo_Constella] AS' 
END
GO
ALTER PROCEDURE [dbo].[pr_Laboratory_GetPatientInfo_Constella]                              
@patientid int,  
@password  varchar(50)                               
AS                                
BEGIN                                
                                                                                                  
Declare @SymKey varchar(400)                        
Set @SymKey = 'Open symmetric key Key_CTC decryption by password='+ @password + ''                            
exec(@SymKey)                    
                     
select (convert(varchar(50), decryptbykey(FirstName)) + '' +  isnull(convert(varchar(50),decryptbykey(MiddleName)),'') +  ''+                        
convert(varchar(50), decryptbykey(LastName)))[Name], PatientEnrollmentID,PatientClinicID ,Sex,RegistrationDate,                         
CountryId +'-'+PosId+'-'+SatelliteId+'-'+PatientEnrollmentId [PatientID] from mst_patient                                
where ptn_pk=@patientid                   
                               
                                    
Select Top 1 VisitType, VisitDate,Visit_Id from ord_Visit where ptn_pk=@patientid and VisitType = 0 order by VisitDate desc   
select top 1 StartDate from lnk_PatientProgramStart where  ptn_pk=@patientid  order by startdate                               
Close symmetric key Key_CTC                           
END

GO
/****** Object:  StoredProcedure [dbo].[pr_Laboratory_GetPatientRecordformStatus_Futures]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Laboratory_GetPatientRecordformStatus_Futures]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_Laboratory_GetPatientRecordformStatus_Futures] AS' 
END
GO
ALTER procedure [dbo].[pr_Laboratory_GetPatientRecordformStatus_Futures]                      
@Ptn_pk int                      
as                      
                 
Begin                
select dbo.fn_GetPatientProgramStatus_Constella(@Ptn_pk)[status]      
  
            

      
   
select dbo.fn_GetPatientPMTCTProgramStatus_Futures(@Ptn_pk)[status] 

select * from Lnk_PatientProgramStart where ptn_pk = @Ptn_pk

End

GO
/****** Object:  StoredProcedure [dbo].[Pr_Laboratory_SaveLabOrder_Constella]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_Laboratory_SaveLabOrder_Constella]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_Laboratory_SaveLabOrder_Constella] AS' 
END
GO
ALTER PROCEDURE [dbo].[Pr_Laboratory_SaveLabOrder_Constella]                                 



@PatientId int , @LocationId int, 

@OrderedByName int,                 

@OrderedByDate varchar(40),      

@ReportedByName int,      

@ReportedByDate varchar(50),      

@CheckedByName int,                   

@CheckedByDate varchar(50),       

@PreClinicLabDate varchar(50),      

@LabPeriod int,    

@UserId int,      

@Transaction int,      

@Orderid int,

@LabNumber varchar(50)          

AS                     

Declare @Visit_ID int                   



BEGIN       



 SET NOCOUNT ON;                                



 if @Transaction = 1                       



		 begin                            

			   if exists(select * from ord_PatientLabOrder where ptn_pk = @patientid  and LabId = @Orderid and orderedbydate = @OrderedByDate and (DeleteFlag=0 or DeleteFlag is null))                                

			    begin                    

			    select 0                                

			    return                                

			   end                       



	   			Insert Into ord_Visit(Ptn_pk,LocationID,VisitDate,VisitType,DataQuality,UserID,Createdate)                                           

				Values (@patientid,@LocationID,@OrderedByDate,6,1,@UserID,getdate())                                  



				SET @Visit_ID = ident_current('ord_Visit')                  



	   	   		INSERT INTO ord_PatientLabOrder (Ptn_pk,LocationID,OrderedByName, OrderedByDate,ReportedByName,ReportedByDate,CheckedByName,CheckedByDate,PreClinicLabDate,UserId,CreateDate,VisitID, LabPeriod,LabNumber)                                

				VALUES  (@patientid,@LocationID ,@OrderedByName , @OrderedByDate,@ReportedByName ,@ReportedByDate,@CheckedByName ,@CheckedByDate ,nullif(@PreClinicLabDate,'1/1/1900 12:00:00 AM'), @UserId,getdate(),@Visit_ID, @LabPeriod,@LabNumber) 



				select LabID, LocationId from ord_PatientLabOrder where LabID=IDENT_CURRENT('ord_PatientLabOrder')        



			end       



 else                            



		 begin                      



		    declare @theOrderId int;      

			set @theOrderId=(select top 1 LabId from ord_PatientLabOrder where ptn_pk = @patientid and LabId = @Orderid and orderedbydate = @OrderedByDate and (DeleteFlag=0 or DeleteFlag is null))                    



			if(@theOrderId is null or @theOrderId=@OrderId)-- its new date or same date                    



				  begin     

					   update ord_PatientLabOrder set OrderedbyName = @OrderedByName, OrderedByDate = @OrderedByDate,                            

					   ReportedByName = @ReportedByName,ReportedByDate = @ReportedByDate,CheckedByName = @CheckedByName,                 

					   CheckedByDate = @CheckedByDate, PreClinicLabDate = nullif(@PreClinicLabDate,'1/1/1900 12:00:00 AM')                       

					   ,UserId = @UserId, UpdateDate = getdate(), LabPeriod = @LabPeriod,LabNumber=@LabNumber where LabId = @OrderId and Ptn_pk = @PatientId                     

				  end                    

			else                   



			   begin                    

					select 0--- form on this date already exists         

					return                                

				end							

		end                  



 ------- Rupesh:22May08:updating orderedBy date in ord_visit - incase of EDIT : starts -----                   



 declare @VID int                



 select @VID=VisitID from ord_PatientLabOrder where LabId=@OrderId                



    Update ord_Visit set DataQuality=1, VisitDate=@OrderedByDate where Visit_Id=@VID                      



 ------- Rupesh:22May08:updating orderedBy date in ord_visit - incase of EDIT : ends -----                   



---Return LabId          



select LabID, LocationId from ord_PatientLabOrder where LabID=@OrderId        



--select @OrderId        



----          



END

GO
/****** Object:  StoredProcedure [dbo].[Pr_Laboratory_SaveLabOrderTests_Constella]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_Laboratory_SaveLabOrderTests_Constella]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_Laboratory_SaveLabOrderTests_Constella] AS' 
END
GO
ALTER PROCEDURE [dbo].[Pr_Laboratory_SaveLabOrderTests_Constella]                                           
@Ptn_pk int,                      
@LocationID int,                    
@ParameterID int,                      
@UserId int,                      
@OrderedByName int,                                          
@OrderedByDate datetime,                  
@Flag int,                
@LabID varchar(50),          
@FlagExist int ,      
@PreClinicLabDate datetime=null                               
AS                               
                                     
BEGIN                                          
                                         
SET NOCOUNT ON;          
if (@FlagExist = 88)          
 Begin          
  if @LabID = 0              
  Begin               
   Begin                                      
   if @Flag = 0                  
    Begin                          
    Insert Into ord_Visit(Ptn_pk,LocationID,VisitDate,VisitType,DataQuality,UserID,Createdate,OrderedDate)                                                     
    Values (@Ptn_pk,@LocationID,@OrderedByDate,6,0,@UserID,getdate(),@OrderedByDate)                                            
                
    Declare @Visit_ID int                             
    set @Visit_ID = ident_current('ord_Visit')                            
    INSERT INTO ord_PatientLabOrder (Ptn_pk,LocationID,OrderedByName,OrderedByDate,Createdate,UserID,VisitID,PreClinicLabDate)                                          
    values (@Ptn_pk,@LocationID ,@OrderedByName ,@OrderedByDate,getdate(),@UserID,@Visit_ID,@PreClinicLabDate)                     
    End                  
   else                 
    Begin                   
    Declare @LabTestID int                    
    select @LabTestID = TestID from Lnk_TestParameter where SubTestID=@ParameterID    
    INSERT INTO Dtl_PatientLabResults (LabID,LocationID,LabTestID,ParameterID,Financed,UserID,CreateDate)                    
    values ( ident_current('ord_PatientLabOrder'),@LocationID,@LabTestID, @ParameterID,1, @UserID, getdate())                    
    End               
   End              
   Select ident_current('ord_PatientLabOrder')[LabID], OrderedbyName, OrderedbyDate from ord_PatientLabOrder where Ptn_pk=@Ptn_pk and LocationID=@LocationID              
   Select ParameterID from Dtl_PatientLabResults where LabID=ident_current('ord_PatientLabOrder')               
  End              
  else               
  Begin              
   Begin                
   if @Flag = 0              
    Begin              
    update ord_PatientLabOrder               
    set Ptn_pk=@Ptn_pk, LocationID=@LocationID, OrderedByName=@OrderedByName, OrderedByDate=@OrderedByDate,               
    UserID=@UserID, UpdateDate=getdate(),PreClinicLabDate=@PreClinicLabDate where LabID=@LabID              
    Delete from Dtl_PatientLabResults where LabID=@LabID              
    End              
   else              
    Begin              
    declare @LabTestIDUpdate int                    
    select @LabTestIDUpdate = TestID from Lnk_TestParameter where SubTestID=@ParameterID  
                       
    INSERT INTO Dtl_PatientLabResults (LabID,LocationID,LabTestID,ParameterID,Financed,UserID,CreateDate)                    
    values ( @LabID,@LocationID,@LabTestIDUpdate, @ParameterID,1, @UserID, getdate())                
    End              
   End           
   Select LabID, OrderedbyName, OrderedbyDate from ord_PatientLabOrder where LabID=@LabID              
   Select ParameterID from Dtl_PatientLabResults where LabID=@LabID                 
  End            
 End          
          
          
Else           
          
 Begin          
  Begin          
   if @Flag = 0              
    Begin              
    Delete from Dtl_PatientLabResults where LabID=@LabID       
    End              
   else              
    Begin              
    declare @LabTestIDUpdate1 int                    
    select @LabTestIDUpdate1 = TestID from Lnk_TestParameter where SubTestID=@ParameterID                    
    INSERT INTO Dtl_PatientLabResults (LabID,LocationID,LabTestID,ParameterID,Financed,UserID,CreateDate)       
    values (@LabID,@LocationID,@LabTestIDUpdate1, @ParameterID,1, @UserID, getdate())                
    End              
  End           
  Select LabID, OrderedbyName, OrderedbyDate from ord_PatientLabOrder where LabID=@LabID              
  Select ParameterID from Dtl_PatientLabResults where LabID=@LabID          
  End              
END

GO
/****** Object:  StoredProcedure [dbo].[pr_Scheduler_UpdateAppointmentStatus]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Scheduler_UpdateAppointmentStatus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_Scheduler_UpdateAppointmentStatus] AS' 
END
GO
ALTER PROCEDURE [dbo].[pr_Scheduler_UpdateAppointmentStatus]
(@Currentdate VARCHAR(11),
 @locationid  INT
)
AS      
     --Begin------Check in PatientMasterVisit table if record exist(excluding the records of scheduler and enrollment visit type)      ------with in grace period of appointment date then update the status to met if the       ------appointment date + grace period has gone then update the status to missed      ------seprately check the record in lab order table as the lab entries does not go into the PatientMasterVisit table      -----------------------Update Met status--------------------------      
     UPDATE PatientAppointment
       SET
           StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Met'
     ),
           StatusDate =
     (
         SELECT MIN(VisitDate)
         FROM PatientMasterVisit c
         WHERE(c.visitdate BETWEEN(PatientAppointment.StatusDate -
                                  (
                                      SELECT appgraceperiod
                                      FROM mst_facility
                                      WHERE facilityid = @locationid
                                  )) AND(PatientAppointment.StatusDate +
                                        (
                                            SELECT appgraceperiod
                                            FROM mst_facility
                                            WHERE facilityid = @locationid
                                        ) + 1))
              AND c.PatientId = PatientAppointment.PatientId
              AND c.Id <> PatientAppointment.PatientMasterVisitId
              AND visittype NOT IN(5, 0)
         AND visittype <> 0
     )
     WHERE StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Pending'
     )
           AND (deleteflag IS NULL
                OR deleteflag != 1)
           AND PatientId IN
     (
         SELECT c.PatientId
         FROM PatientMasterVisit c
         WHERE((c.visitdate BETWEEN(PatientAppointment.StatusDate -
                                   (
                                       SELECT appgraceperiod
                                       FROM mst_facility
                                       WHERE facilityid = @locationid
                                   )) AND(PatientAppointment.StatusDate +
                                         (
                                             SELECT appgraceperiod
                                             FROM mst_facility
                                             WHERE facilityid = @locationid
                                         ) + 1)))
              AND c.PatientId = PatientAppointment.PatientId
              AND c.Id <> PatientAppointment.PatientMasterVisitId
              AND visittype NOT IN(5, 0)
         AND visittype <> 0
     );
     UPDATE PatientAppointment
       SET
           StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Met'
     ),
           StatusDate =
     (
         SELECT MIN(VisitDate)
         FROM PatientMasterVisit c
         WHERE(c.visitdate BETWEEN(PatientAppointment.StatusDate -
                                  (
                                      SELECT appgraceperiod
                                      FROM mst_facility
                                      WHERE facilityid = @locationid
                                  )) AND(PatientAppointment.StatusDate +
                                        (
                                            SELECT appgraceperiod
                                            FROM mst_facility
                                            WHERE facilityid = @locationid
                                        ) + 1))
              AND c.PatientId = PatientAppointment.PatientId
              AND c.Id <> PatientAppointment.PatientMasterVisitId
              AND visittype NOT IN(5, 0)
         AND visittype <> 0
     )
     WHERE StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Pending'
     )
           AND (deleteflag IS NULL
                OR deleteflag != 1)
           AND PatientId IN
     (
         SELECT c.Ptn_Pk
         FROM ord_patientlaborder c
         WHERE((c.createdate BETWEEN(PatientAppointment.StatusDate -
                                    (
                                        SELECT appgraceperiod
                                        FROM mst_facility
                                        WHERE facilityid = @locationid
                                    )) AND(PatientAppointment.StatusDate +
                                          (
                                              SELECT appgraceperiod
                                              FROM mst_facility
                                              WHERE facilityid = @locationid
                                          ) + 1)))
              AND c.Ptn_Pk = PatientAppointment.PatientId
              AND c.locationid = @locationid
     );


     ---- -----------------------Update Missed status--------------------------      
     UPDATE PatientAppointment
       SET
           StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Missed'
     ),
           StatusDate = @Currentdate
     WHERE StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Pending'
     )
           AND (deleteflag IS NULL
                OR deleteflag != 1)
           AND PatientId IN
     (
         SELECT PatientAppointment.PatientId
         FROM PatientAppointment
         WHERE StatusId =
         (
             SELECT LookupItemId
             FROM LookupMasterItem
             WHERE DisplayName LIKE 'Pending'
         )
               AND PatientId = PatientAppointment.PatientId
               AND StatusDate = PatientAppointment.StatusDate
               AND (PatientAppointment.StatusDate +
                   (
                       SELECT appgraceperiod
                       FROM mst_facility
                       WHERE facilityid = @locationid
                   ) < @currentdate)
     );
     UPDATE A
       SET
           StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Care Ended'
     ),
           StatusDate = @Currentdate
     FROM Patient AS P
          INNER JOIN PatientAppointment AS A ON P.Id = A.PatientId
     WHERE(P.Active = 0)
          AND A.DeleteFlag = 0
          AND A.StatusId IN
     (
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Missed'
     ),
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Pending'
     )
     );

     -----------------------------------------------------------------------------------------------------------      ------update status of all those active patients(previously inactive) who have careended appointments, to missed and      -----Then compare StatusDate with currentdate if curentdate is less then (StatusDate + graceperoiddate) then mark StatusId pending      

     UPDATE PatientAppointment
       SET
           StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Missed'
     ),
           StatusDate = @Currentdate
     WHERE StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Care Ended'
     )
           AND (deleteflag IS NULL
                OR deleteflag != 1)
           AND PatientId IN
     (
         SELECT PatientId
         FROM Patient
         WHERE Active = 1
     );
     UPDATE PatientAppointment
       SET
           StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Pending'
     )
     WHERE StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Missed'
     )
           AND (deleteflag IS NULL
                OR deleteflag != 1)
           AND DATEADD(dd,
                      (
                          SELECT appgraceperiod
                          FROM mst_facility
                          WHERE facilityid = @locationid
                      ), StatusDate) >= @Currentdate;


     -----------------Update missed to Previously missed status---------------------------------      
     UPDATE PatientAppointment
       SET
           PatientAppointment.StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Previously Missed'
     ),
           StatusDate = @Currentdate
     WHERE PatientAppointment.StatusId =
     (
         SELECT LookupItemId
         FROM LookupMasterItem
         WHERE DisplayName LIKE 'Missed'
     )
           AND (deleteflag IS NULL
                OR deleteflag != 1)
           AND PatientAppointment.StatusDate <
     (
         SELECT MAX(b.StatusDate)
         FROM PatientAppointment b
         WHERE b.StatusId IN
         (
         (
             SELECT LookupItemId
             FROM LookupMasterItem
             WHERE DisplayName LIKE 'Pending'
         ),
         (
             SELECT LookupItemId
             FROM LookupMasterItem
             WHERE DisplayName LIKE 'Met'
         )
         )
               AND b.PatientId = PatientAppointment.PatientId
               AND (deleteflag IS NULL
                    OR deleteflag != 1)
     );
     --End
GO
/****** Object:  StoredProcedure [dbo].[pr_selectedListValue_Futures]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_selectedListValue_Futures]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_selectedListValue_Futures] AS' 
END
GO

ALTER procedure [dbo].[pr_selectedListValue_Futures]                                  
as                                  
begin            
   declare @CategoryId int            
   declare @BindTable varchar(300)            
   declare @FieldName varchar(300)            
   declare @Predefined int            
   declare @FieldId int            
   declare @ModuleId int 
   declare @RegFlag int           
   declare @selList varchar(MAX)            
            
   Create table #tmpList(FieldId int,FieldName Varchar(300), FieldValue varchar(max), Predefined int,             
    CodeId varchar(max),BindTable Varchar(300),ModuleId int)            
            
   declare ListFields cursor for            
   select '9999'+Convert(varchar,Id) [FieldId],isnull(CategoryId,0),BindTable,PdfName [FieldName],'1'[Predefined],ModuleId,ISNULL(PatientRegistration, 0) from mst_predefinedfields where controlid in (4,9,15,6)            
   union            
   select '8888'+Convert(varchar,Id) [FieldId],isnull(CategoryId,0),BindTable,FieldName [FieldName],'0'[Predefined],0 [ModuleId],ISNULL(PatientRegistration, 0) from mst_CustomFormField where controlid in (4,9,15,6)            
   open ListFields            
   fetch next from ListFields into @FieldId,@CategoryId,@BindTable,@FieldName,@Predefined,@ModuleId,@RegFlag             
   while @@fetch_status = 0            
     begin            
  set @selList = ''                        
        exec pr_GetListFormBuilder_Futures @BindTable,@CategoryId,@FieldName,@ModuleId,@RegFlag ,@selList output                        
        insert into #tmpList(FieldId,FieldName,FieldValue,Predefined,CodeId,BindTable,ModuleId)            
        values(@FieldId,@FieldName,isnull(@selList,''),@Predefined,@CategoryId,@BindTable,@ModuleId)                
        fetch next from ListFields into  @FieldId,@CategoryId,@BindTable,@FieldName,@Predefined,@ModuleId,@RegFlag             
    end                        
   close ListFields            
   deallocate ListFields            
   select * from #tmpList            
   drop table #tmpList                               
end 
GO
/****** Object:  StoredProcedure [dbo].[Pr_SF_GetPatientSearchresults]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_SF_GetPatientSearchresults]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pr_SF_GetPatientSearchresults] AS' 
END
GO
ALTER PROCEDURE [dbo].[Pr_SF_GetPatientSearchresults]                                                              
(                                                                                                              
@lastname varchar(50)=null,                                                                                  
@middlename varchar(50)=null,                                                                                                              
@firstname varchar(50)=null,                                                                                                              
@enrollmentid varchar(50)=null,                                                                                                              
@ClinicId int=null,                                                                                                              
@gender int=null, 
@StateId int=null, 
@DistrictId int=null,                                                                                                             
@BlockId int=null,
@UniqueId varchar(50)=null,                                                    
@password varchar(50)=null                                                                                       
                                                                                                              
)                                                                                                              
AS                                                                                                              
BEGIN                                                                                     
                                                                                                              
 declare @sql varchar(max)                                                                                                              
 declare @sqlwhere varchar(max)                                                                                                              
 declare @sqlclause varchar(max)                             
                                                                                     
                                                                                       
 Declare @SymKey varchar(400)                                                                                      
 Set @SymKey = 'Open symmetric key Key_CTC decryption by password='+ @password + ''                                                                                          
 exec(@SymKey)                                                                                
                                                                                         
 set @sqlclause = 'SELECT Ptn_Pk,                                                                                        
  convert(varchar(50), decryptbykey(Mst_Patient.firstname)) +'' ''+                                                                                  
  convert(varchar(50), decryptbykey(Mst_Patient.middlename))+'' ''+                                                                             
  convert(varchar(50), decryptbykey(Mst_Patient.lastname))[PatientName],                                                
  Mst_Patient.UniqueID[UniqueID],mst_Clinic.ClinicName                                      
  from mst_patient left outer join mst_Clinic on mst_patient.ClinicId=mst_Clinic.ClinicID'                                                  
 set @sqlwhere =  ' WHERE (mst_patient.DeleteFlag = 0 or mst_patient.DeleteFlag is null)'                                                            
                                                                                        
 set @sql=''                                                                                   
                                                                                                               
 if @firstname <> ''      
     begin                                                                                            
   set @sql=  @sql + ' AND convert(varchar(50), decryptbykey(Mst_Patient.firstname)) like ' + '''' + @firstname + '%' + ''''                                                     
  End        
                                                                        
 if @middlename <> ''       
   begin                                                                                                              
  set @sql=  @sql + ' AND convert(varchar(50), decryptbykey(Mst_Patient.middlename)) like ' + '''' + @middlename + '%' + ''''                                                                            
    End         
                                                                      
 if @lastname <> ''      
   begin                                                                                                                
   set @sql=  @sql + ' AND convert(varchar(50), decryptbykey(Mst_Patient.lastname)) like ' + '''' + @lastname + '%'+''''                                                                                                               
   End         
                                                                                                    
                                     
                                   
                                                                                                
 if @ClinicId > 0 and @ClinicId < 9999       
     begin               
   set @sql = @sql + ' AND Mst_Patient.ClinicId='+convert(varchar,@ClinicId)        
  End                                        
                              
 if @gender > 0       
      Begin                                               
   set @sql=  @sql + ' AND Mst_Patient.Sex = ' + convert(varchar,@gender)        
      End                                                                                                            
  if @StateId > 0       
      Begin                                               
   set @sql=  @sql + ' AND Mst_Patient.State = ' + convert(varchar,@StateId)        
      End
      if @DistrictId > 0       
      Begin                                               
   set @sql=  @sql + ' AND Mst_Patient.District = ' + convert(varchar,@DistrictId)        
      End
      if @BlockId > 0       
      Begin                                               
   set @sql=  @sql + ' AND Mst_Patient.Block = ' + convert(varchar,@BlockId)        
      End 
   
   if @UniqueId <> ''       
      Begin                                               
   set @sql=  @sql + ' AND Mst_Patient.UniqueId = ' + convert(varchar,@UniqueId)        
      End                                                                                                        
                                                                                                                
     
        
     
                                                                  
 set @sqlclause = @sqlclause + @sqlwhere + @sql + ' Order by firstname,middlename,lastname'                                                                                          
print(@sqlclause)        
--print(@sql)        
--print(@sqlwhere)                          
exec (@sqlclause)                                                                                                 
                                                                                     
Close symmetric key Key_CTC                                                           
                                                                                                          
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Bluecard_ToGreenCard]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Bluecard_ToGreenCard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_Bluecard_ToGreenCard] AS' 
END
GO

-- =============================================
-- Author:		<felix/stephen>
-- Create date: <03-22-2017>
-- Description:	<Patient registration migration from bluecard to greencard>
-- =============================================
ALTER PROCEDURE [dbo].[SP_Bluecard_ToGreenCard]
	-- Add the parameters for the stored procedure here
	@ptn_pk int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

DECLARE @FirstName varbinary(max), @MiddleName varbinary(max), @LastName varbinary(max), @Sex int, @Status bit , @DeleteFlag bit, 
		@CreateDate datetime, @UserID int,  @message varchar(80), @Id int, @PatientFacilityId varchar(50), @PatientType int, 
		@FacilityId varchar(10), @DateOfBirth datetime, @DobPrecision int, @NationalId varbinary(max), @PatientId int,  
		@ARTStartDate date,@transferIn int,@CCCNumber varchar(20), @entryPoint int, @ReferredFrom int, @RegistrationDate datetime,
		@MaritalStatusId int, @MaritalStatus int, @DistrictName varchar(50), @CountyID int, @SubCountyID int, @WardID int,
		@Address varbinary(max), @Phone varbinary(max), @EnrollmentId int, @PatientIdentifierId int, @ServiceEntryPointId int,
		@PatientMaritalStatusID int, @PatientTreatmentSupporterID int, @PersonContactID int, @IDNational varbinary(max);

DECLARE @FirstNameT varchar(50), @LastNameT varchar(50), @TreatmentSupportTelNumber varbinary(max), 
			@CreateDateT datetime, @UserIDT int, @IDT int;
  
PRINT '-------- Patients Report --------'; 
SELECT @message = '----- ptn_pk ' + CAST(@ptn_pk as varchar(50));
PRINT @message;
  
DECLARE mstPatient_cursor CURSOR FOR   
SELECT FirstName, MiddleName ,LastName,Sex, [Status], DeleteFlag, dbo.mst_Patient.CreateDate, dbo.mst_Patient.UserID, PatientFacilityId, PosId, DOB, DobPrecision, [ID/PassportNo],PatientEnrollmentID, [ReferredFrom], [RegistrationDate], MaritalStatus, DistrictName, Address, Phone
FROM mst_Patient
INNER JOIN
 dbo.Lnk_PatientProgramStart ON dbo.mst_Patient.Ptn_Pk = dbo.Lnk_PatientProgramStart.Ptn_pk
WHERE        (dbo.Lnk_PatientProgramStart.ModuleId = 203) AND dbo.mst_Patient.Ptn_Pk = @ptn_pk
  
OPEN mstPatient_cursor  
  
FETCH NEXT FROM mstPatient_cursor   
INTO @FirstName, @MiddleName, @LastName, @Sex, @Status, @DeleteFlag, @CreateDate, @UserID, @PatientFacilityId, @FacilityId, @DateOfBirth, @DobPrecision, @NationalId,@CCCNumber, @ReferredFrom, @RegistrationDate, @MaritalStatus , @DistrictName, @Address, @Phone
  
WHILE @@FETCH_STATUS = 0  
BEGIN  
    PRINT ' '  
    SELECT @message = '----- patients From mst_patient: ' + CAST(@ptn_pk as varchar(50))
  
    PRINT @message  

	exec pr_OpenDecryptedSession;

	--set null dates
	IF @CreateDate IS NULL
		BEGIN
			SELECT @CreateDate = getdate();
		END
	--Due to the logic of green card
	IF @Status = 1
		BEGIN
			SELECT @Status = 0
		END
	ELSE
		BEGIN
			SELECT @Status = 1
		END

	IF @NationalId IS NULL
		SET @IDNational = CONVERT(varbinary, '99999999');

	IF @Sex IS NOT NULL
		SET @Sex = (SELECT TOP 1 ItemId FROM LookupItemView WHERE MasterName like '%gender%' and ItemName like (select Name from mst_Decode where id = @Sex) + '%');
	ELSE
		SET @Sex = (select ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');

	--Default all persons to new
	SET @ARTStartDate=( SELECT ARTTransferInDate FROM dtl_PatientHivPrevCareIE WHERE Ptn_pk=@ptn_pk);
	if(@ARTStartDate Is NULL) BEGIN SET @PatientType=(SELECT Id FROM LookupItem WHERE Name='New');SET @transferIn=0; END ELSE BEGIN SET @PatientType=(SELECT Id FROM LookupItem WHERE Name='TransferIn');SET @transferIn=1; END
	-- SELECT @PatientType = 1285

	--encrypt nationalid
	SET @IDNational=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@NationalId);

	IF NOT EXISTS ( SELECT TOP 1 ptn_pk FROM Patient WHERE ptn_pk = @ptn_pk)
		BEGIN
			Insert into Person(FirstName, MidName, LastName, Sex, Active, DeleteFlag, CreateDate, CreatedBy)
			Values(@FirstName, @MiddleName, @LastName, @Sex, @Status, @DeleteFlag, @CreateDate, @UserID);

			SELECT @Id=@@IDENTITY;
			SELECT @message = 'Created Person Id: ' + CAST(@Id as varchar(50));
			PRINT @message;

			Insert into Patient(ptn_pk, PersonId, PatientIndex, PatientType, FacilityId, Active, DateOfBirth, DobPrecision, NationalId, DeleteFlag, CreatedBy, CreateDate, RegistrationDate)
			Values(@ptn_pk, @Id, @PatientFacilityId, @PatientType, @FacilityId, @Status, @DateOfBirth, @DobPrecision, @IDNational, @DeleteFlag, @UserID, @CreateDate, @RegistrationDate);

			SELECT @PatientId=@@IDENTITY;
			SELECT @message = 'Created Patient Id: ' + CAST(@PatientId as varchar);
			PRINT @message;

			-- Insert to PatientEnrollment
			INSERT INTO [dbo].[PatientEnrollment] ([PatientId] ,[ServiceAreaId] ,[EnrollmentDate] ,[EnrollmentStatusId] ,[TransferIn] ,[CareEnded] ,[DeleteFlag] ,[CreatedBy] ,[CreateDate] ,[AuditData])
			VALUES (@PatientId,1,(SELECT top 1 StartDate FROM Lnk_PatientProgramStart WHERE Ptn_pk=@ptn_pk),0, @transferIn,0 ,0 ,@UserID ,@CreateDate ,NULL)
		
			SELECT @EnrollmentId=@@IDENTITY;
			SELECT @message = 'Created PatientEnrollment Id: ' + CAST(@EnrollmentId as varchar);
			PRINT @message;

			IF @CCCNumber IS NOT NULL
				BEGIN
					-- Patient Identifier
					INSERT INTO [dbo].[PatientIdentifier] ([PatientId], [PatientEnrollmentId], [IdentifierTypeId], [IdentifierValue] ,[DeleteFlag] ,[CreatedBy] ,[CreateDate] ,[Active] ,[AuditData])
					VALUES (@PatientId , @EnrollmentId ,(SELECT Id FROM LookupItem WHERE Name='CCCNumber') ,@CCCNumber ,0 ,@UserID ,@CreateDate ,0 ,NULL);

					SELECT @PatientIdentifierId=@@IDENTITY;
					SELECT @message = 'Created PatientIdentifier Id: ' + CAST(@PatientIdentifierId as varchar);
					PRINT @message;
				END

			--Insert into ServiceEntryPoint
			IF @ReferredFrom > 0
				SET @entryPoint = (select TOP 1 ItemId from [dbo].[LookupItemView] where ItemName like '%' + (SELECT Name FROM mst_Decode WHERE ID=@ReferredFrom AND CodeID=17) + '%');
				IF @entryPoint IS NULL
					BEGIN
						SET @entryPoint = (select ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');
					END
			ELSE
				SET @entryPoint = (select ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');

			INSERT INTO ServiceEntryPoint([PatientId], [ServiceAreaId], [EntryPointId], [DeleteFlag], [CreatedBy], [CreateDate], [Active])
			VALUES(@PatientId, 1, @entryPoint, 0 , @UserID, @CreateDate, 0);

			SELECT @ServiceEntryPointId=@@IDENTITY;
			SELECT @message = 'Created ServiceEntryPoint Id: ' + CAST(@ServiceEntryPointId as varchar);
			PRINT @message;
	
			--Insert into MaritalStatus
			IF @MaritalStatus > 0
				BEGIN
					IF EXISTS (select TOP 1 ItemId from [dbo].[LookupItemView] where ItemName like '%' + (select Name from mst_Decode where ID = @MaritalStatus and CodeID = 12) + '%')
						SET @MaritalStatusId = (select TOP 1 ItemId from [dbo].[LookupItemView] where ItemName like '%' + (select Name from mst_Decode where ID = @MaritalStatus and CodeID = 12) + '%');
					ELSE
						SET @MaritalStatusId = (select ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');
				END
			ELSE
				SET @MaritalStatusId = (select ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');

			INSERT INTO PatientMaritalStatus(PersonId, MaritalStatusId, Active, DeleteFlag, CreatedBy, CreateDate)
			VALUES(@Id, @MaritalStatusId, 1, 0, @UserID, @CreateDate);

			SELECT @PatientMaritalStatusID=@@IDENTITY;
			SELECT @message = 'Created PatientMaritalStatus Id: ' + CAST(@PatientMaritalStatusID as varchar);
			PRINT @message;

			--Insert into PersonLocation
			--SET @CountyID = (SELECT TOP 1 CountyId from County where CountyName like '%' + @DistrictName  + '%');
			--SET @WardID = (SELECT TOP 1 WardId FROM County WHERE WardName LIKE '%' +  +'%')

			--INSERT INTO PersonLocation(PersonId, County, SubCounty, Ward, Village, Location, SubLocation, LandMark, NearestHealthCentre, Active, DeleteFlag, CreatedBy, CreateDate)
			--VALUES(@Id, @CountyID, @SubCountyID, @WardID, @Village, @Location, @SubLocation, @LandMark, @NearestHealthCentre, 1, @DeleteFlag, @UserID, @CreateDate);
    
			--Insert into Treatment Supporter
			DECLARE Treatment_Supporter_cursor CURSOR FOR
			SELECT SUBSTRING(TreatmentSupporterName,0,charindex(',',TreatmentSupporterName))as firstname ,
			SUBSTRING(TreatmentSupporterName,charindex(',',TreatmentSupporterName) + 1,len(TreatmentSupporterName)+1)as lastname,
			TreatmentSupportTelNumber, CreateDate, UserID
			from dtl_PatientContacts WHERE ptn_pk = @ptn_pk;


			OPEN Treatment_Supporter_cursor
			FETCH NEXT FROM Treatment_Supporter_cursor INTO @FirstNameT, @LastNameT, @TreatmentSupportTelNumber, @CreateDateT , @UserIDT

			IF @@FETCH_STATUS <> 0   
				PRINT '         <<None>>'       

			WHILE @@FETCH_STATUS = 0  
			BEGIN  

				--SELECT @message = '         ' + @product  
				--PRINT @message
				SET @TreatmentSupportTelNumber = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@TreatmentSupportTelNumber);
				IF @FirstNameT IS NOT NULL AND @LastNameT IS NOT NULL 
					BEGIN
						Insert into Person(FirstName, MidName, LastName, Sex, Active, DeleteFlag, CreateDate, CreatedBy)
						Values(ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@FirstNameT), NULL, ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@LastNameT), (select ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown'), 1, 0, @CreateDateT, @UserIDT);

						SELECT @IDT=@@IDENTITY;
						SELECT @message = 'Created Person Treatment Supporter Id: ' + CAST(@IDT as varchar(50));
						PRINT @message;

						IF @TreatmentSupportTelNumber IS NOT NULL
						 SET @TreatmentSupportTelNumber = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@TreatmentSupportTelNumber)

						INSERT INTO PatientTreatmentSupporter(PersonId, [SupporterId], [MobileContact], [DeleteFlag], [CreatedBy], [CreateDate])
						VALUES(@Id, @IDT, @TreatmentSupportTelNumber, 0, @UserIDT, @CreateDateT);

						SELECT @PatientTreatmentSupporterID=@@IDENTITY;
						SELECT @message = 'Created PatientTreatmentSupporterID Id: ' + CAST(@PatientTreatmentSupporterID as varchar);
						PRINT @message;
					END

				FETCH NEXT FROM Treatment_Supporter_cursor INTO  @FirstNameT, @LastNameT, @TreatmentSupportTelNumber, @CreateDateT, @UserIDT
				END  

			CLOSE Treatment_Supporter_cursor  
			DEALLOCATE Treatment_Supporter_cursor

			--Insert into Person Contact
			IF @Address IS NOT NULL AND @Phone IS NOT NULL
				BEGIN
					INSERT INTO PersonContact(PersonId, [PhysicalAddress], [MobileNumber], [AlternativeNumber], [EmailAddress], [Active], [DeleteFlag], [CreatedBy], [CreateDate])
					VALUES(@Id, @Address, @Phone, null, null, @Status, 0, @UserID, @CreateDate);

					SELECT @PersonContactID=@@IDENTITY;
					SELECT @message = 'Created PersonContact Id: ' + CAST(@PersonContactID as varchar);
					PRINT @message;
				END
		END
	ELSE
		BEGIN
			SET @Id = (SELECT TOP 1 PersonId FROM Patient WHERE ptn_pk = @ptn_pk);
			UPDATE Person
			SET FirstName = @FirstName, MidName = @MiddleName, LastName = @LastName, Sex = @Sex, Active = @Status, DeleteFlag = @DeleteFlag, CreateDate = @CreateDate, CreatedBy = @UserID
			WHERE Id = @Id;

			SELECT @message = 'Update Person Id: ' + CAST(@Id as varchar(50));
			PRINT @message;

			PRINT @Status;

			UPDATE Patient
			SET PatientIndex = @PatientFacilityId, PatientType = @PatientType, FacilityId = @FacilityId, Active = @Status, DateOfBirth = @DateOfBirth, DobPrecision = @DobPrecision, NationalId = @IDNational, DeleteFlag = @DeleteFlag, CreatedBy = @UserID, CreateDate = @CreateDate, RegistrationDate = @RegistrationDate
			WHERE PersonId = @Id;

			SELECT @PatientId=(SELECT TOP 1 Id FROM Patient WHERE PersonId = @Id);
			SELECT @message = 'Updated Patient';
			PRINT @message;

			-- UPDATE to PatientEnrollment
			UPDATE PatientEnrollment
			SET EnrollmentDate = (SELECT top 1 StartDate FROM Lnk_PatientProgramStart WHERE Ptn_pk=@ptn_pk), EnrollmentStatusId = 0, TransferIn = @transferIn, CareEnded = 0, DeleteFlag = 0, CreatedBy = @UserID, CreateDate = @CreateDate
			WHERE PatientId = @PatientId;

			SELECT @EnrollmentId = (SELECT TOP 1 Id FROM PatientEnrollment WHERE PatientId = @PatientId);
			SELECT @message = 'Updated PatientEnrollment Id: ' + CAST(@EnrollmentId as varchar);
			PRINT @message;

			BEGIN
			IF @CCCNumber IS NOT NULL
				BEGIN
				IF NOT EXISTS ( SELECT PatientId FROM PatientIdentifier WHERE PatientId = @PatientId AND PatientEnrollmentId = @EnrollmentId AND IdentifierTypeId = (SELECT Id FROM LookupItem WHERE Name='CCCNumber'))
					BEGIN
						-- Patient Identifier
						INSERT INTO [dbo].[PatientIdentifier] ([PatientId], [PatientEnrollmentId], [IdentifierTypeId], [IdentifierValue] ,[DeleteFlag] ,[CreatedBy] ,[CreateDate] ,[Active] ,[AuditData])
						VALUES (@PatientId , @EnrollmentId ,(SELECT Id FROM LookupItem WHERE Name='CCCNumber') ,@CCCNumber ,0 ,@UserID ,@CreateDate ,0 ,NULL);

						SELECT @PatientIdentifierId=@@IDENTITY;
						SELECT @message = 'Created PatientIdentifier Id: ' + CAST(@PatientIdentifierId as varchar);
						PRINT @message;
					END
				ELSE
					BEGIN
						UPDATE PatientIdentifier
						SET IdentifierTypeId = (SELECT Id FROM LookupItem WHERE Name='CCCNumber'), IdentifierValue = @CCCNumber, DeleteFlag = 0, CreatedBy = @UserID, CreateDate = @CreateDate, Active = 0
						WHERE PatientId = @PatientId AND PatientEnrollmentId = @EnrollmentId AND IdentifierTypeId = (SELECT Id FROM LookupItem WHERE Name='CCCNumber')
					END
				END
			END

			--Insert into ServiceEntryPoint
			IF @ReferredFrom > 0
				BEGIN
					SET @entryPoint = (select TOP 1 ItemId from [dbo].[LookupItemView] where ItemName like '%' + (SELECT Name FROM mst_Decode WHERE ID=@ReferredFrom AND CodeID=17) + '%');
				
					UPDATE ServiceEntryPoint
					SET EntryPointId = @entryPoint, CreatedBy = @UserID, CreateDate = @CreateDate
					WHERE PatientId = @PatientId;
					
					SELECT @ServiceEntryPointId=@@IDENTITY;
					SELECT @message = 'Updated ServiceEntryPoint Id: ' + CAST(@ServiceEntryPointId as varchar);
					PRINT @message;
				END
	
			--Updated into MaritalStatus
			IF @MaritalStatus > 0
				BEGIN
					BEGIN
						IF EXISTS (select TOP 1 ItemId from [dbo].[LookupItemView] where ItemName like '%' + (select Name from mst_Decode where ID = @MaritalStatus and CodeID = 12) + '%')
							SET @MaritalStatusId = (select TOP 1 ItemId from [dbo].[LookupItemView] where ItemName like '%' + (select Name from mst_Decode where ID = @MaritalStatus and CodeID = 12) + '%');
						ELSE
							SET @MaritalStatusId = (select ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');
					END
					UPDATE PatientMaritalStatus
					SET MaritalStatusId = @MaritalStatusId, CreatedBy = @UserID, CreateDate = @CreateDate
					WHERE PersonId = @Id;

					SELECT @PatientMaritalStatusID=@@IDENTITY;
					SELECT @message = 'Updated PatientMaritalStatus Id: ' + CAST(@PatientMaritalStatusID as varchar);
					PRINT @message;
				END

			--Update into Treatment Supporter
			DECLARE Treatment_Supporter_cursor CURSOR FOR
			SELECT SUBSTRING(TreatmentSupporterName,0,charindex(',',TreatmentSupporterName))as firstname ,
			SUBSTRING(TreatmentSupporterName,charindex(',',TreatmentSupporterName) + 1,len(TreatmentSupporterName)+1)as lastname,
			TreatmentSupportTelNumber, CreateDate, UserID
			from dtl_PatientContacts WHERE ptn_pk = @ptn_pk;


			OPEN Treatment_Supporter_cursor
			FETCH NEXT FROM Treatment_Supporter_cursor INTO @FirstNameT, @LastNameT, @TreatmentSupportTelNumber, @CreateDateT , @UserIDT

			IF @@FETCH_STATUS <> 0   
				PRINT '         <<None>>'       

			WHILE @@FETCH_STATUS = 0  
			BEGIN

				SET @TreatmentSupportTelNumber = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@TreatmentSupportTelNumber);
				IF @FirstNameT IS NOT NULL AND @LastNameT IS NOT NULL
					BEGIN
						IF NOT EXISTS (SELECT PersonId FROM PatientTreatmentSupporter WHERE PersonId = @Id)
							BEGIN
								Insert into Person(FirstName, MidName, LastName, Sex, Active, DeleteFlag, CreateDate, CreatedBy)
								Values(ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@FirstNameT), NULL, ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@LastNameT), (select ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown'), 1, 0, @CreateDateT, @UserIDT);

								SELECT @IDT=@@IDENTITY;
								SELECT @message = 'Created Person Treatment Supporter Id: ' + CAST(@IDT as varchar(50));
								PRINT @message;

								IF @TreatmentSupportTelNumber IS NOT NULL
								SET @TreatmentSupportTelNumber = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@TreatmentSupportTelNumber)

								INSERT INTO PatientTreatmentSupporter(PersonId, [SupporterId], [MobileContact], [DeleteFlag], [CreatedBy], [CreateDate])
								VALUES(@Id, @IDT, @TreatmentSupportTelNumber, 0, @UserIDT, @CreateDateT);

							END
						ELSE
							BEGIN
								SET @IDT = (SELECT SupporterId FROM PatientTreatmentSupporter WHERE PersonId = @Id);

								UPDATE Person
								SET FirstName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@FirstNameT), LastName = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@LastNameT)
								WHERE Id = @IDT;

								IF @TreatmentSupportTelNumber IS NOT NULL
								SET @TreatmentSupportTelNumber = ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@TreatmentSupportTelNumber)

								UPDATE PatientTreatmentSupporter
								SET MobileContact = @TreatmentSupportTelNumber
								WHERE PersonId = @Id;

							END
						END

				FETCH NEXT FROM Treatment_Supporter_cursor INTO  @FirstNameT, @LastNameT, @TreatmentSupportTelNumber, @CreateDateT, @UserIDT
				END  

			CLOSE Treatment_Supporter_cursor  
			DEALLOCATE Treatment_Supporter_cursor

			--UPDATE into Person Contact
			IF @Address IS NOT NULL AND @Phone IS NOT NULL
				BEGIN
					UPDATE PersonContact
					SET PhysicalAddress = @Address, MobileNumber = @Phone
					WHERE PersonId = @Id;
				END

		END

    -- Get the next mst_patient.
    FETCH NEXT FROM mstPatient_cursor   
    INTO @FirstName, @MiddleName, @LastName, @Sex, @Status, @DeleteFlag, @CreateDate, @UserID, @PatientFacilityId, @FacilityId, @DateOfBirth, @DobPrecision, @NationalId, @CCCNumber, @ReferredFrom, @RegistrationDate, @MaritalStatus , @DistrictName, @Address, @Phone
END   
CLOSE mstPatient_cursor;  
DEALLOCATE mstPatient_cursor;  
END

GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterAdverseEvents]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterAdverseEvents]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterAdverseEvents] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterAdverseEvents]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update AdverseEvent set DeleteFlag = 1 where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
	
End


/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugList]    Script Date: 3/22/2017 6:17:35 PM ******/
SET ANSI_NULLS ON





GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterAllergies]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterAllergies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterAllergies] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 19th Mar 2017
-- Description:	save patient encounter - delete allergies
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterAllergies]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update patientallergy set DeleteFlag = 1 where PatientId = @PatientID
End








GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterChronicIllness]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterChronicIllness]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterChronicIllness] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterChronicIllness]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update PatientChronicIllness set DeleteFlag = 1 where PatientId = @PatientID
End








GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterComplaints]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterComplaints]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterComplaints] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 26th April 2017
-- Description:	save patient encounter - Presenting Complaints
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterComplaints]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update PresentingComplaints set DeleteFlag = 1 where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
	
End


/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugList]    Script Date: 3/22/2017 6:17:35 PM ******/
SET ANSI_NULLS ON





GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterDiagnosis]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterDiagnosis]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterDiagnosis] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterDiagnosis]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update PatientDiagnosis set DeleteFlag = 1 where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
End







GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterGeneralExam]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterGeneralExam]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterGeneralExam] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Chronic Illness
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterGeneralExam]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
		declare @generalExamID int = (select top 1 Id from lookupmaster where Name = 'GeneralExamination')
		
		UPDATE PhysicalExamination SET DeleteFlag = 1
		where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and ExaminationTypeId = @generalExamID
		
End







GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterPHDP]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterPHDP]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterPHDP] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Chronic Illness
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterPHDP]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
		UPDATE PatientPHDP SET DeleteFlag = 1
		where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
		
End







GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterPhysicalExam]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterPhysicalExam]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterPhysicalExam] AS' 
END
GO

-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterPhysicalExam]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	declare @generalExamID int = (select top 1 Id from lookupmaster where Name = 'GeneralExamination')

	update PhysicalExamination set DeleteFlag = 1 
	where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and ExaminationTypeId <> @generalExamID
End







GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterPresentingComplaints]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterPresentingComplaints]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterPresentingComplaints] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 26th April 2017
-- Description:	save patient encounter - Presenting Complaints
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterPresentingComplaints]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update PresentingComplaints set DeleteFlag = 1 where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
	
End


/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugList]    Script Date: 3/22/2017 6:17:35 PM ******/
SET ANSI_NULLS ON





GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientEncounterVaccines]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientEncounterVaccines]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientEncounterVaccines] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientEncounterVaccines]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update Vaccination set DeleteFlag = 1 where PatientId = @PatientID
End








GO
/****** Object:  StoredProcedure [dbo].[sp_deletePatientFamilyPlanningMethod]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_deletePatientFamilyPlanningMethod]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_deletePatientFamilyPlanningMethod] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	delete family planning method
-- =============================================
ALTER PROCEDURE [dbo].[sp_deletePatientFamilyPlanningMethod]
	-- Add the parameters for the stored procedure here
	@PatientID varchar(50) = null,
	@FPId varchar(50) = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	update PatientFamilyPlanningMethod set DeleteFlag = 1 where PatientId = @PatientID and PatientFPId = @FPId
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getCurrentRegimen]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getCurrentRegimen]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getCurrentRegimen] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get current regimen
-- =============================================
ALTER PROCEDURE [dbo].[sp_getCurrentRegimen]
	-- Add the parameters for the stored procedure here
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select top 1 a.RegimenId, a.RegimenLineId, b.VisitDate
	from ARVTreatmentTracker a inner join PatientMasterVisit b on a.PatientMasterVisitId = b.id
	where a.PatientId = @PatientID
	order by b.VisitDate desc

End








GO
/****** Object:  StoredProcedure [dbo].[sp_getFacility]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getFacility]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getFacility] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 11th April 2017
-- Description:	get Facility
-- =============================================
ALTER PROCEDURE [dbo].[sp_getFacility]
	-- Add the parameters for the stored procedure here
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	select FacilityID,FacilityName,SatelliteID,DeleteFlag, UserID from mst_facility where deleteflag=0

End








GO
/****** Object:  StoredProcedure [dbo].[sp_getItemIdByGroupAndItemName]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getItemIdByGroupAndItemName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getItemIdByGroupAndItemName] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 11th April 2017
-- Description:	get ItemId By Group And ItemName
-- =============================================
ALTER PROCEDURE [dbo].[sp_getItemIdByGroupAndItemName]
	-- Add the parameters for the stored procedure here
	@groupName varchar(100) = null,
	@ItemName varchar(100) = null
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	select * from [dbo].[LookupItemView] where MasterName = @groupName and ItemName = @ItemName

End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounter]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounter]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientEncounter] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 10th Feb 2017
-- Description:	get patient encounter
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounter]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	declare @TBScreeningTypeID int = (Select Id from LookupMaster where name = 'TBStatus')
	declare @NutritionScreeningTypeID int = (Select Id from LookupMaster where name = 'NutritionStatus')
	declare @GeneralExamMasterId int = (Select top 1 Id from LookupMaster where name = 'GeneralExamination')
	declare @ARVAdherenceType int = (Select Id from LookupMaster where name = 'ARVAdherence')
	declare @CTXAdherenceType int = (Select Id from LookupMaster where name = 'CTXAdherence')

	--0
	select * from PatientMasterVisit where id = @PatientMasterVisitID and patientId = @PatientID
	and (DeleteFlag is null OR DeleteFlag = 0)
	
	--1
	select * from ComplaintsHistory where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID
	and (DeleteFlag is null OR DeleteFlag = 0)
	
	--2
	select * from PhysicalExamination where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID
	and ExaminationTypeId = @GeneralExamMasterId and (DeleteFlag is null OR DeleteFlag = 0)
	
	--TB Screening 3
	select ScreeningValueId from PatientScreening 
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and ScreeningTypeId = @TBScreeningTypeID
	and (DeleteFlag is null OR DeleteFlag = 0)
	
	--Nutrition Screening 4
	select ScreeningValueId from PatientScreening 
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and ScreeningTypeId = @NutritionScreeningTypeID
	and (DeleteFlag is null OR DeleteFlag = 0)
	
	--5
	select * from PatientPHDP where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID 
	and (DeleteFlag is null OR DeleteFlag = 0)

	--6 ARV Adherence
	select Score from AdherenceOutcome 
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and AdherenceType = @ARVAdherenceType
	and (DeleteFlag is null OR DeleteFlag = 0)

	--7 CTX Adherence
	select Score from AdherenceOutcome 
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and AdherenceType = @CTXAdherenceType
	and (DeleteFlag is null OR DeleteFlag = 0)

	--8 workplan
	select * from PatientClinicalNotes
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and deleteflag <> 1

	--9 ICF
	select * from [dbo].[PatientIcf]
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and deleteflag <> 1

	--10 ICF Action
	select * from [dbo].[PatientIcfAction]
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and deleteflag <> 1

	--11 IPT
	select * from [dbo].[PatientIpt]
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and deleteflag <> 1

	--12 IPT Outcome
	select * from [dbo].[PatientIptOutcome]
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and deleteflag <> 1

	--13 IPT Workup
	select * from [dbo].[PatientIptWorkup]
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and deleteflag <> 1

End





GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterAdverseEvents]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterAdverseEvents]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientEncounterAdverseEvents] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get patient encounter Adverse Events
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounterAdverseEvents]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select Severity SeverityID,EventName,EventCause,b.DisplayName Severity,[Action] 
	from AdverseEvent a left join LookupItem b on a.Severity = b.Id
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterAllergies]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterAllergies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientEncounterAllergies] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 19th Mar 2017
-- Description:	get patient encounter Allergies
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounterAllergies]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select Allergen allergyId,reaction reactionId, severity severityId, b.displayname allergy, c.DisplayName reaction, 
	d.DisplayName severity, CONVERT(varchar(20),a.onsetdate,106) onsetDate
	from patientallergy a inner join lookupitem b on a.allergen = b.Id
	left join lookupitem c on a.Reaction = c.id
	left join lookupitem d on a.severity = d.id
	where patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterChronicIllness]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterChronicIllness]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientEncounterChronicIllness] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get patient encounter Chronic Illness
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounterChronicIllness]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select chronicIllness chronicIllnessID, b.DisplayName chronicIllnessName, Treatment,dose,
	convert(varchar(20),OnsetDate,106) OnsetDate,active 
	from PatientChronicIllness a inner join LookupItem b on a.ChronicIllness = b.Id
	where patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterComplaints]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterComplaints]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientEncounterComplaints] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get patient encounter complaints
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounterComplaints]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select presentingComplaintsId, b.DisplayName complaint, convert(varchar(20), onsetDate, 106) onsetDate
	from presentingComplaints a left join LookupItem b on a.presentingComplaintsId = b.Id
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterDiagnosis]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterDiagnosis]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientEncounterDiagnosis] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get patient encounter Diagnosis
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounterDiagnosis]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select a.Diagnosis, b.DisplayName, ManagementPlan
	from PatientDiagnosis a inner join lookupitem b on a.diagnosis = b.id
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterExam]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterExam]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientEncounterExam] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get patient encounter Physical Exam
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounterExam]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select ExaminationTypeId examTypeID, ExamId examID, b.DisplayName examType, c.DisplayName exam, Finding findings
	from PhysicalExamination a 
	inner join LookupItem b on a.ExaminationTypeId = b.Id
	left join LookupItem c on a.ExamId = c.Id
	where PatientMasterVisitId = @PatientMasterVisitID and patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterHistory]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterHistory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientEncounterHistory] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 10th Feb 2017
-- Description:	get patient encounter History
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounterHistory]
	-- Add the parameters for the stored procedure here
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	declare @enrollmentVisitType int = (select id from lookupitem where name = 'Enrollment')

	SELECT        dbo.PatientMasterVisit.Id AS visitID, 'Green Card' AS VisitName, dbo.PatientMasterVisit.PatientId, dbo.PatientMasterVisit.VisitDate, dbo.mst_User.UserName, 
							 dbo.PatientMasterVisit.DeleteFlag
	FROM            dbo.PatientMasterVisit INNER JOIN
							 dbo.mst_User ON dbo.PatientMasterVisit.CreatedBy = dbo.mst_User.UserID
	WHERE  dbo.PatientMasterVisit.PatientId = @PatientID and  (dbo.PatientMasterVisit.VisitDate IS NOT NULL) AND (dbo.PatientMasterVisit.DeleteFlag IS NULL OR
							 dbo.PatientMasterVisit.DeleteFlag = 0) and dbo.PatientMasterVisit.visittype is null
	UNION
	SELECT        dbo.PatientMasterVisit.Id AS visitID, 'Pharmacy' AS VisitName, dbo.PatientMasterVisit.PatientId, dbo.PatientMasterVisit.VisitDate, dbo.mst_User.UserName, 
							 dbo.PatientMasterVisit.DeleteFlag
	FROM            dbo.PatientMasterVisit INNER JOIN
							 dbo.mst_User ON dbo.PatientMasterVisit.CreatedBy = dbo.mst_User.UserID INNER JOIN
							 ord_patientpharmacyorder ON PatientMasterVisit.Id = ord_patientpharmacyorder.patientmastervisitid
	WHERE  dbo.PatientMasterVisit.PatientId = @PatientID and (dbo.PatientMasterVisit.VisitDate IS NOT NULL) AND (dbo.PatientMasterVisit.DeleteFlag IS NULL OR
							 dbo.PatientMasterVisit.DeleteFlag = 0) and dbo.PatientMasterVisit.visittype is null


	order by visitdate desc
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterVaccines]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientEncounterVaccines]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientEncounterVaccines] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get patient encounter Vaccines
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounterVaccines]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select vaccine vaccineID, VaccineStage VaccineStageID, b.DisplayName VaccineName, c.DisplayName VaccineStageName, Convert(varchar(12),VaccineDate,106)VaccineDate
	from Vaccination a 
	inner join LookupItem b on a.Vaccine = b.Id
	left join LookupItem c on a.VaccineStage = c.Id
	where patientId = @PatientID and (a.DeleteFlag is null or a.DeleteFlag = 0)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPatientPharmacyPrescription]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPatientPharmacyPrescription]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPatientPharmacyPrescription] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 13th Mar 2017
-- Description:	get patient pharmacy prescription
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientPharmacyPrescription]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	declare @pharmacy_pk int
	set @pharmacy_pk = (select ptn_pharmacy_pk from ord_PatientPharmacyOrder 
						where PatientMasterVisitId = @PatientMasterVisitID and DeleteFlag <> 1)

	select a.Drug_Pk,
	--(select batchId from dtl_patientPharmacyDispensed where ptn_pharmacy_pk = a.ptn_pharmacy_pk and drug_pk = a.Drug_Pk) batchId,
	a.BatchNo batchId,
	a.FrequencyID,b.abbreviation abbr,b.DrugName,c.Name batchName,a.SingleDose dose, 
	d.Name freq,a.duration,a.OrderedQuantity,a.DispensedQuantity,
	--(select dispensedQuantity from dtl_patientPharmacyDispensed where ptn_pharmacy_pk = a.ptn_pharmacy_pk and drug_pk = a.Drug_Pk)DispensedQuantity,
	a.Prophylaxis
	from dtl_PatientPharmacyOrder a inner join mst_drug b on a.Drug_Pk = b.Drug_pk
	left join Mst_Batch c on a.BatchNo = c.ID
	left join mst_Frequency d on a.FrequencyID = d.ID
	--left join dtl_patientPharmacyDispensed e on a.ptn_pharmacy_pk = e.ptn_pharmacy_pk
	where a.ptn_pharmacy_pk = @pharmacy_pk
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPendingPrescriptions]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPendingPrescriptions]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPendingPrescriptions] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 16th Mar 2017
-- Description:	get patient encounter Chronic Illness
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPendingPrescriptions]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select a.PatientMasterVisitId, a.Ptn_pk, e.identifiervalue, c.FirstName, c.MidName, c.LastName, d.UserLastName + d.UserFirstName as prescribedBy 
	from ord_PatientPharmacyOrder a inner join patient b on a.ptn_pk = b.Id
	inner join person c on b.PersonId = c.Id
	inner join mst_User d on a.OrderedBy = d.UserID
	inner join PatientIdentifier e on e.PatientId = a.Ptn_pk
	where (a.DeleteFlag is null or a.DeleteFlag = 0) and (a.orderstatus = 1 or a.orderstatus = 3)
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyBatch]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyBatch]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPharmacyBatch] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get pharmacy drug batches
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPharmacyBatch]
	-- Add the parameters for the stored procedure here
	@DrugPk int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select a.id, a.Name + ' ~ Expiry Date: ' + Convert(varchar(20), a.ExpiryDate,106) + ' ~ Quantity: ' + CONVERT(varchar(20),sum(b.Quantity)) as Name 
	from Mst_Batch a inner join Dtl_StockTransaction b on a.id = b.batchid
	where a.ItemID = @DrugPk and a.DeleteFlag <> 1
	group by a.id, a.Name, a.ExpiryDate
	order by a.ExpiryDate asc

End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugFrequency]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyDrugFrequency]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPharmacyDrugFrequency] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 3rd June 2017
-- Description:	get pharmacy drug frequency
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPharmacyDrugFrequency]
	-- Add the parameters for the stored procedure here

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select id,name,multiplier from mst_Frequency where DeleteFlag <> 1
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugList]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyDrugList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPharmacyDrugList] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get pharmacy drug list
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPharmacyDrugList]
	-- Add the parameters for the stored procedure here
	@pmscm int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	--select Drug_pk, DrugName,CONCAT(Drug_pk, '~',abbreviation, '~', DrugName)val 
	--from mst_drug

	IF(@pmscm = 1)
	BEGIN
		Select	D.Drug_pk, D.DrugName,		Convert(varchar(5),D.Drug_pk) + ' '+ '~' + isnull(D.abbreviation,'') + '~'+ D.DrugName val 
		From Dtl_StockTransaction As ST	Inner Join Mst_Store As S On S.Id = ST.StoreId And S.DispensingStore = 1
		Right Outer Join Mst_Drug As D On D.Drug_pk = ST.ItemId 
		where D.DeleteFlag = 0
		Group By D.Drug_pk,	D.DrugName, D.abbreviation
		having Sum(ST.Quantity) > 0
	END
	ELSE
	BEGIN
		Select	D.Drug_pk, D.DrugName,
		Convert(varchar(5),D.Drug_pk) + ' '+ '~' + isnull(D.abbreviation,'') + '~'+ D.DrugName val 
		From Dtl_StockTransaction As ST	Inner Join Mst_Store As S On S.Id = ST.StoreId And S.DispensingStore = 1
		Right Outer Join Mst_Drug As D On D.Drug_pk = ST.ItemId 
		where D.DeleteFlag = 0
		Group By D.Drug_pk,	D.DrugName, D.abbreviation
	END

End







GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyDrugSwitchSubReasons]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyDrugSwitchSubReasons]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPharmacyDrugSwitchSubReasons] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 8th Mar 2017
-- Description:	get pharmacy drug switch, substitution reasons
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPharmacyDrugSwitchSubReasons]
	-- Add the parameters for the stored procedure here
	@TreatmentPlan int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	select LookupItemId, DisplayName from LookupMasterItem where LookupMasterId = @TreatmentPlan
	order by OrdRank
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyFields]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyFields]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPharmacyFields] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get pharmacy fields
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPharmacyFields]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

		--13 Pharmacy Parameters
	select b.ProgID, b.pharmacyPeriodTaken ,a.TreatmentStatusId,a.TreatmentStatusReasonId, a.RegimenLineId, a.RegimenId
	from ARVTreatmentTracker a inner join ord_PatientPharmacyOrder b on a.PatientMasterVisitId = b.PatientMasterVisitId
	where a.PatientMasterVisitId = @PatientMasterVisitID
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getPharmacyRegimens]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getPharmacyRegimens]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getPharmacyRegimens] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 8th Mar 2017
-- Description:	get pharmacy drug switch, substitution reasons
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPharmacyRegimens]
	-- Add the parameters for the stored procedure here
	@regimenLine int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On

	select LookupItemId, b.name + '(' + b.displayname + ')' DisplayName from LookupMasterItem a inner join lookupitem b on a.lookupitemid = b.id
	where a.LookupMasterId = @regimenLine
	order by OrdRank
End








GO
/****** Object:  StoredProcedure [dbo].[sp_getRegimenClassification]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getRegimenClassification]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getRegimenClassification] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 14th Feb 2017
-- Description:	get regimen classification
-- =============================================
ALTER PROCEDURE [dbo].[sp_getRegimenClassification]
	-- Add the parameters for the stored procedure here

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	declare @lookUpMasterID int = (select Id from lookupmaster where name = 'RegimenClassification')

	select * from lookupmasteritem where lookupmasterid = @lookUpMasterID order by ordrank

End








GO
/****** Object:  StoredProcedure [dbo].[sp_getTreatmentProgram]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getTreatmentProgram]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getTreatmentProgram] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 4th May 2017
-- Description:	get pharmacy Treatment Program
-- =============================================
ALTER PROCEDURE [dbo].[sp_getTreatmentProgram]
	-- Add the parameters for the stored procedure here
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	select id, name from [dbo].[mst_decode] where codeid = 33 and deleteflag = 0

End








GO
/****** Object:  StoredProcedure [dbo].[sp_getZScores]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getZScores]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_getZScores] AS' 
END
GO
-- =============================================      
-- Author:  John Macharia      
-- Create date:       
-- Modify date: 31 July 2014    
-- Description: Paediatric  scores    
-- =============================================  
ALTER procedure [dbo].[sp_getZScores]
(
	@PatientID int=null,
	@sex varchar(10)=null,
	@height float = null
)

As

begin
Declare @ageInDays int, @ageInMonths int;

Select @ageInMonths = Datediff(Month, DateOfBirth, Getdate()),
	@ageInDays = Datediff(Day, DateOfBirth, Getdate())
From patient
Where Id = @PatientID;


--0 weight for Age
If (@ageInDays <= 1856) 
Begin
	Select *
	From [dbo].[z_waz_young]
	Where Case  When @Sex= 'Female' And Sex= 2 Then 1
				When @Sex = 'Male' And Sex = 1 Then 1
				Else 0 End = 1
	And agedays = @ageInDays;
End
Else If(@ageInMonths >=61)
Begin
	Select *
	From [dbo].[z_waz_old]
	Where Case  When @Sex= 'Female' And Sex= 2 Then 1
				When @Sex = 'Male' And Sex = 1 Then 1
				Else 0 End = 1
	And ageMos = @ageInMonths;
End
Else
Begin	
	Select 1
End
--0 weight for Age
--If (@sex = 'Female' And @ageInDays <= 1856) Begin
--Select * From [dbo].[z_waz_young] Where Sex = 2 And agedays = @ageInDays
--End 
--Else If (@sex = 'Male' And @ageInDays <= 1856) Begin
--Select * From [dbo].[z_waz_young] Where Sex = 1 And agedays = @ageInDays
--End 

--Else If (@sex = 'Female' And @ageInMonths >= 61) Begin
--Select *
--From [dbo].[z_waz_old]
--Where Sex = 2
--And Agemos = @ageInMonths
--End Else If (@sex = 'Male' And @ageInMonths >= 61) Begin
--Select *
--From [dbo].[z_waz_old]
--Where Sex = 1
--And Agemos = @ageInMonths
--End Else Begin
--Select 1
--End

--1 weight for Height

If (@height Between 45 And 110) 
Begin
	Select *
	From [dbo].[z_whz_young]
	Where Case  When @Sex= 'Female' And Sex= 2 Then 1
				When @Sex = 'Male' And Sex = 1 Then 1
				Else 0 End = 1
	And LengthCm = @height;
End
Else If (@height Between 65 And 120) 
Begin
	Select *
	From [dbo].[z_whz_old]
	Where Case  When @Sex= 'Female' And Sex= 2 Then 1
				When @Sex = 'Male' And Sex = 1 Then 1
				Else 0 End = 1
	And HeightCm = @height;
End
Else
Begin	
	Select 1
End

--If (@sex = 'Female' And @height >= 45 And @height <= 110) Begin
--Select *
--From [dbo].[z_whz_young]
--Where Sex = 2
--And LengthCm = @height
--End 
--Else If (@sex = 'Male' And @height >= 45 And @height <= 110) Begin
--Select *
--From [dbo].[z_whz_young]
--Where Sex = 1
--And LengthCm = @height
--End 
--Else If (@sex = 'Female' And @height >= 65 And @height <= 120) Begin
--Select *
--From [dbo].[z_whz_old]
--Where Sex = 2
--And HeightCm = @height
--End Else If (@sex = 'Male' And @height >= 65 And @height <= 120) Begin
--Select *
--From [dbo].[z_whz_old]
--Where Sex = 1
--And HeightCm = @height
--End Else Begin
--Select 1
--End

/* 2 BMIz */
If (@ageInDays Between 0 And 1856) 
Begin
	Select *
	From [dbo].z_bmiz_young
	Where Case  When @Sex= 'Female' And Sex= 2 Then 1
				When @Sex = 'Male' And Sex = 1 Then 1
				Else 0 End = 1
	And agedays = @ageInDays;
End
Else If (@ageInMonths Between 61 And 229) 
Begin
	Select *
	From [dbo].[z_bmiz_old]
	Where Case  When @Sex= 'Female' And Sex= 2 Then 1
				When @Sex = 'Male' And Sex = 1 Then 1
				Else 0 End = 1
	And Agemos = @ageInMonths;
End
Else
Begin	
	Select 1
End

--If (@sex = 'Female' And @ageInDays >= 0 And @ageInDays <= 1856) Begin
--Select *
--From z_bmiz_young
--Where Sex = 2
--And agedays = @ageInDays
--End Else If (@sex = 'Male' And @ageInDays >= 0 And @ageInDays <= 1856) Begin
--Select *
--From z_bmiz_young
--Where Sex = 1
--And agedays = @ageInDays
--End Else If (@sex = 'Female' And @ageInMonths >= 61 And @ageInMonths <= 229) Begin
--Select *
--From z_bmiz_old
--Where Sex = 2
--And Agemos = @ageInMonths
--End Else If (@sex = 'Male' And @ageInMonths >= 61 And @ageInMonths <= 229) Begin
--Select *
--From z_bmiz_old
--Where Sex = 1
--And Agemos = @ageInMonths
--End Else Begin
--Select 1
--End
End




GO
/****** Object:  StoredProcedure [dbo].[SP_mst_PatientToGreencardRegistration]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_mst_PatientToGreencardRegistration]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_mst_PatientToGreencardRegistration] AS' 
END
GO
-- =============================================
-- Author:		<felix/stephen>
-- Create date: <03-22-2017>
-- Description:	<Patient registration migration from bluecard to greencard>
-- =============================================
ALTER PROCEDURE [dbo].[SP_mst_PatientToGreencardRegistration]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @ptn_pk int, @FirstName varbinary(max), @MiddleName varbinary(max), @LastName varbinary(max), @Sex int, @Status bit , @DeleteFlag bit, 
		@CreateDate datetime, @UserID int,  @message varchar(80), @PersonId int, @PatientFacilityId varchar(50), @PatientType int, 
		@FacilityId varchar(10), @DateOfBirth datetime, @DobPrecision int, @NationalId varbinary(max), @PatientId int,  
		@ARTStartDate date,@transferIn int,@CCCNumber varchar(20), @entryPoint int, @ReferredFrom int, @RegistrationDate datetime,
		@MaritalStatusId int, @MaritalStatus int, @DistrictName varchar(50), @CountyID int, @SubCountyID int, @WardID int,
		@Address varbinary(max), @Phone varbinary(max), @EnrollmentId int, @PatientIdentifierId int, @ServiceEntryPointId int,
		@PatientMaritalStatusID int, @PatientTreatmentSupporterID int, @PersonContactID int, @LocationID int;
  
	PRINT '-------- Patients Report --------';  
	exec pr_OpenDecryptedSession;

	DECLARE mstPatient_cursor CURSOR FOR   
	SELECT mst_Patient.Ptn_Pk, FirstName, MiddleName ,LastName,Sex, [Status], DeleteFlag, mst_Patient.CreateDate, mst_Patient.UserID, PatientFacilityId, PosId, DOB, DobPrecision, [ID/PassportNo], PatientEnrollmentID, [ReferredFrom], [RegistrationDate], MaritalStatus, DistrictName, Address, Phone, LocationID
	FROM mst_Patient INNER JOIN  dbo.Lnk_PatientProgramStart ON dbo.mst_Patient.Ptn_Pk = dbo.Lnk_PatientProgramStart.Ptn_pk
	WHERE (dbo.Lnk_PatientProgramStart.ModuleId = 203)  and MovedToPatientTable =0
	ORDER BY mst_Patient.Ptn_Pk;
  
	OPEN mstPatient_cursor;
  
	FETCH NEXT FROM mstPatient_cursor   
	INTO @ptn_pk, @FirstName, @MiddleName, @LastName, @Sex, @Status, @DeleteFlag, @CreateDate, @UserID, @PatientFacilityId, @FacilityId, @DateOfBirth, @DobPrecision, @NationalId,@CCCNumber, @ReferredFrom, @RegistrationDate, @MaritalStatus , @DistrictName, @Address, @Phone, @LocationID
  
	WHILE @@FETCH_STATUS = 0  
	BEGIN
		-- STEP 1: Start the transaction
		BEGIN TRANSACTION

		PRINT ' '  
		SELECT @message = '----- patients From mst_patient: ' + CAST(@ptn_pk as varchar(50))
  
		PRINT @message  

		--set null dates
		IF @CreateDate is null
			SELECT @CreateDate = getdate()
		--Due to the logic of green card
		IF @Status = 1
			SELECT @Status = 0
		ELSE
			SELECT @Status = 1

		IF @NationalId IS NULL
			SET @NationalId = 999999999;

		IF @Sex IS NOT NULL
			BEGIN
				IF ((select top 1  Name from mst_Decode where id = @Sex) = 'Male' OR (select top 1 Name from mst_Decode where id = @Sex) = 'Female')
					BEGIN
						SET @Sex = (SELECT TOP 1 ItemId FROM LookupItemView WHERE MasterName like '%gender%' and ItemName like  + '%');
					END
				ELSE
					SET @Sex = (select top 1  ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');
			END
		ELSE
			SET @Sex = (select top 1  ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');

		--Default all persons to new
		SET @ARTStartDate=( SELECT top 1  ARTTransferInDate FROM dtl_PatientHivPrevCareIE WHERE Ptn_pk=@ptn_pk And ARTTransferInDate Is Not Null);
		if(@ARTStartDate Is NULL) BEGIN SET @PatientType=(SELECT top 1 Id FROM LookupItem WHERE Name='New');SET @transferIn=0; END ELSE BEGIN SET @PatientType=(SELECT top 1 Id FROM LookupItem WHERE Name='Transfer-In');SET @transferIn=1; END
		-- SELECT @PatientType = 1285

		--encrypt nationalid
		SELECT @NationalId=ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@NationalId);

		Insert into Person(FirstName, MidName, LastName, Sex, Active, DeleteFlag, CreateDate, CreatedBy)
		Values(@FirstName, @MiddleName, @LastName, @Sex, @Status, @DeleteFlag, @CreateDate, @UserID);

		IF @@ERROR <> 0
			BEGIN
				-- Rollback the transaction
				ROLLBACK

				-- Raise an error and return
				--RAISERROR ('Error in deleting employees in DeleteDepartment.', 16, 1)
				PRINT 'Error Occurred inserting into person';
				RETURN
			END

		SELECT @PersonId = SCOPE_IDENTITY();
		SELECT @message = 'Created Person Id: ' + CAST(@PersonId as varchar(50));
		PRINT @message;

		Insert into Patient(ptn_pk, PersonId, PatientIndex, PatientType, FacilityId, Active, DateOfBirth, DobPrecision, NationalId, DeleteFlag, CreatedBy, CreateDate, RegistrationDate)
		Values(@ptn_pk, @PersonId, @PatientFacilityId, @PatientType, @FacilityId, @Status, @DateOfBirth, @DobPrecision, @NationalId, @DeleteFlag, @UserID, @CreateDate, @RegistrationDate);

		IF @@ERROR <> 0
			BEGIN
				-- Rollback the transaction
				ROLLBACK

				-- Raise an error and return
				--RAISERROR ('Error in deleting employees in DeleteDepartment.', 16, 1)
				PRINT 'Error Occurred inserting into patient';
				RETURN
			END

		SELECT @PatientId = SCOPE_IDENTITY();
		SELECT @message = 'Created Patient Id: ' + CAST(@PatientId as varchar);
		PRINT @message;

			-- Insert to PatientEnrollment
			INSERT INTO [dbo].[PatientEnrollment] ([PatientId] ,[ServiceAreaId] ,[EnrollmentDate] ,[EnrollmentStatusId] ,[TransferIn] ,[CareEnded] ,[DeleteFlag] ,[CreatedBy] ,[CreateDate] ,[AuditData])
			VALUES (@PatientId,1,(SELECT top 1 StartDate FROM Lnk_PatientProgramStart WHERE Ptn_pk=@ptn_pk),0, @transferIn,0 ,0 ,@UserID ,@CreateDate ,NULL);

			IF @@ERROR <> 0
				BEGIN
					-- Rollback the transaction
					ROLLBACK

					-- Raise an error and return
					--RAISERROR ('Error in deleting employees in DeleteDepartment.', 16, 1)
					PRINT 'Error Occurred inserting into patient enrollment';
					RETURN
				END
		
			SELECT @EnrollmentId = SCOPE_IDENTITY();
			SELECT @message = 'Created PatientEnrollment Id: ' + CAST(@EnrollmentId as varchar);
			PRINT @message;

			IF @CCCNumber IS NOT NULL
				BEGIN
					-- Patient Identifier
					INSERT INTO [dbo].[PatientIdentifier] ([PatientId], [PatientEnrollmentId], [IdentifierTypeId], [IdentifierValue] ,[DeleteFlag] ,[CreatedBy] ,[CreateDate] ,[Active] ,[AuditData])
					VALUES (@PatientId , @EnrollmentId ,(SELECT TOP 1 Id FROM LookupItem WHERE Name='CCCNumber') ,@CCCNumber ,0 ,@UserID ,@CreateDate ,0 ,NULL);

					IF @@ERROR <> 0
						BEGIN
							-- Rollback the transaction
							ROLLBACK

							-- Raise an error and return
							--RAISERROR ('Error in deleting employees in DeleteDepartment.', 16, 1)
							PRINT 'Error Occurred inserting into patient identifier';
							RETURN
						END

					SELECT @PatientIdentifierId = SCOPE_IDENTITY();
					SELECT @message = 'Created PatientIdentifier Id: ' + CAST(@PatientIdentifierId as varchar);
					PRINT @message;
				END

		--Insert into ServiceEntryPoint
		IF @ReferredFrom > 0 bEGIN
			SET @entryPoint = (select TOP 1 ItemId from [dbo].[LookupItemView] where ItemName like '%' + (SELECT top 1 Name FROM mst_Decode WHERE ID=@ReferredFrom AND CodeID=17) + '%');
			IF @entryPoint IS NULL
				BEGIN
					SET @entryPoint = (select top 1 ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');
				END
		END
		ELSE
			SET @entryPoint = (select top 1 ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');

		INSERT INTO ServiceEntryPoint([PatientId], [ServiceAreaId], [EntryPointId], [DeleteFlag], [CreatedBy], [CreateDate], [Active])
		VALUES(@PatientId, 1, @entryPoint, 0 , @UserID, @CreateDate, 0);

		IF @@ERROR <> 0
			BEGIN
				-- Rollback the transaction
				ROLLBACK

				-- Raise an error and return
				--RAISERROR ('Error in deleting employees in DeleteDepartment.', 16, 1)
				PRINT 'Error Occurred inserting into service entry point';
				RETURN
			END

		SELECT @ServiceEntryPointId = SCOPE_IDENTITY();
		SELECT @message = 'Created ServiceEntryPoint Id: ' + CAST(@ServiceEntryPointId as varchar);
		PRINT @message;
	
		--Insert into MaritalStatus
		IF @MaritalStatus > 0
			BEGIN
				IF EXISTS (select TOP 1 ItemId from [dbo].[LookupItemView] where ItemName like '%' + (select Name from mst_Decode where ID = @MaritalStatus and CodeID = 12) + '%')
					SET @MaritalStatusId = (select TOP 1 ItemId from [dbo].[LookupItemView] where ItemName like '%' + (select TOP 1 Name from mst_Decode where ID = @MaritalStatus and CodeID = 12) + '%');
				ELSE
					SET @MaritalStatusId = (select TOP 1 ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');
			END
		ELSE
			SET @MaritalStatusId = (select TOP 1 ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown');

		INSERT INTO PatientMaritalStatus(PersonId, MaritalStatusId, Active, DeleteFlag, CreatedBy, CreateDate)
		VALUES(@PersonId, @MaritalStatusId, 1, 0, @UserID, @CreateDate);

		IF @@ERROR <> 0
			BEGIN
				-- Rollback the transaction
				ROLLBACK

				-- Raise an error and return
				--RAISERROR ('Error in deleting employees in DeleteDepartment.', 16, 1)
				PRINT 'Error Occurred inserting into patient marital status';
				RETURN
			END

		SELECT @PatientMaritalStatusID = SCOPE_IDENTITY();
		SELECT @message = 'Created PatientMaritalStatus Id: ' + CAST(@PatientMaritalStatusID as varchar);
		PRINT @message;

		--Insert into PersonLocation
		--SET @CountyID = (SELECT TOP 1 CountyId from County where CountyName like '%' + @DistrictName  + '%');
		--SET @WardID = (SELECT TOP 1 WardId FROM County WHERE WardName LIKE '%' +  +'%')

		--INSERT INTO PersonLocation(PersonId, County, SubCounty, Ward, Village, Location, SubLocation, LandMark, NearestHealthCentre, Active, DeleteFlag, CreatedBy, CreateDate)
		--VALUES(@Id, @CountyID, @SubCountyID, @WardID, @Village, @Location, @SubLocation, @LandMark, @NearestHealthCentre, 1, @DeleteFlag, @UserID, @CreateDate);
    
		--Insert into Treatment Supporter
		DECLARE Treatment_Supporter_cursor CURSOR FOR
		SELECT SUBSTRING(TreatmentSupporterName,0,charindex(',',TreatmentSupporterName))as firstname ,
		SUBSTRING(TreatmentSupporterName,charindex(',',TreatmentSupporterName) + 1,len(TreatmentSupporterName)+1)as lastname,
		TreatmentSupportTelNumber, CreateDate, UserID
		from dtl_PatientContacts WHERE ptn_pk = @ptn_pk;

		DECLARE @FirstNameT varchar(50), @LastNameT varchar(50), @TreatmentSupportTelNumber varchar(50), 
		@CreateDateT datetime, @UserIDT int, @IDT int;


		OPEN Treatment_Supporter_cursor
		FETCH NEXT FROM Treatment_Supporter_cursor INTO @FirstNameT, @LastNameT, @TreatmentSupportTelNumber, @CreateDateT , @UserIDT

		IF @@FETCH_STATUS <> 0   
			PRINT '         <<None>>'       

		WHILE @@FETCH_STATUS = 0  
		BEGIN  

			--SELECT @message = '         ' + @product  
			--PRINT @message
		
			IF @FirstNameT IS NOT NULL AND @LastNameT IS NOT NULL 
				BEGIN
					Insert into Person(FirstName, MidName, LastName, Sex, Active, DeleteFlag, CreateDate, CreatedBy)
					Values(ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@FirstNameT), NULL, ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@LastNameT), (select TOP 1 ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown'), 1, 0, getdate(), @UserIDT);

					IF @@ERROR <> 0
						BEGIN
							-- Rollback the transaction
							ROLLBACK

							-- Raise an error and return
							--RAISERROR ('Error in deleting employees in DeleteDepartment.', 16, 1)
							PRINT 'Error Occurred inserting into person for treatment supporter';
							RETURN
						END

					SELECT @IDT = SCOPE_IDENTITY();
					SELECT @message = 'Created Person Treatment Supporter Id: ' + CAST(@IDT as varchar(50));
					PRINT @message;

					INSERT INTO PatientTreatmentSupporter(PersonId, [SupporterId], [MobileContact], [DeleteFlag], [CreatedBy], [CreateDate])
					VALUES(@PersonId, @IDT, ENCRYPTBYKEY(KEY_GUID('Key_CTC'),@TreatmentSupportTelNumber), 0, @UserIDT, getdate());

					IF @@ERROR <> 0
						BEGIN
							-- Rollback the transaction
							ROLLBACK

							-- Raise an error and return
							--RAISERROR ('Error in deleting employees in DeleteDepartment.', 16, 1)
							PRINT 'Error Occurred inserting into patient treatment supporter';
							RETURN
						END

					SELECT @PatientTreatmentSupporterID = SCOPE_IDENTITY();
					SELECT @message = 'Created PatientTreatmentSupporterID Id: ' + CAST(@PatientTreatmentSupporterID as varchar);
					PRINT @message;
				END

			FETCH NEXT FROM Treatment_Supporter_cursor INTO  @FirstNameT, @LastNameT, @TreatmentSupportTelNumber, @CreateDateT, @UserIDT
			END  

		CLOSE Treatment_Supporter_cursor  
		DEALLOCATE Treatment_Supporter_cursor

		--Insert into Person Contact
		IF @Address IS NOT NULL AND @Phone IS NOT NULL
			BEGIN
				INSERT INTO PersonContact(PersonId, [PhysicalAddress], [MobileNumber], [AlternativeNumber], [EmailAddress], [Active], [DeleteFlag], [CreatedBy], [CreateDate])
				VALUES(@PersonId, @Address, @Phone, null, null, @Status, 0, @UserID, @CreateDate);

				IF @@ERROR <> 0
					BEGIN
						-- Rollback the transaction
						ROLLBACK

						-- Raise an error and return
						--RAISERROR ('Error in deleting employees in DeleteDepartment.', 16, 1)
						PRINT 'Error Occurred inserting into person contact';
						RETURN
					END

				SELECT @PersonContactID = SCOPE_IDENTITY();
				SELECT @message = 'Created PersonContact Id: ' + CAST(@PersonContactID as varchar);
				PRINT @message;
			END

		--Starting baseline

		DECLARE @HBVInfected bit, @Pregnant bit, @TBinfected bit, @WHOStage int, @BreastFeeding bit, 
				@CD4Count decimal , @MUAC decimal, @Weight decimal, @Height decimal, @artstart datetime,
				@ClosestARVDate datetime, @PatientMasterVisitId int, @HIVDiagnosisDate datetime, @EnrollmentDate datetime,
				@EnrollmentWHOStage int, @VisitDate datetime, @Cohort varchar(50), @visit_id int;

		Select TOP 1 @artstart = ARTStartDate	From mst_Patient	Where Ptn_Pk = @ptn_pk	And LocationID = @LocationId;
		select TOP 1 @visit_id = visit_id from dtl_PatientARVEligibility where ptn_pk = @ptn_pk And LocationID = @LocationId;

		SET @Pregnant = 0;

		IF @Sex = (SELECT TOP 1 ItemId FROM LookupItemView WHERE MasterName like '%gender%' and ItemName like 'Female%')
			BEGIN
				--SET @Pregnant = 0;
				IF EXISTS(select TOP 1 Name from mst_Decode where id=(select TOP 1 eligibleThrough from dtl_PatientARVEligibility where ptn_pk = @ptn_pk And LocationID = @LocationId) and name like 'Pregnancy')
					BEGIN
						SET @Pregnant = 1;
					END
			END
			
		If EXISTS(SELECT * FROM dtl_PatientVitals dtl WHERE dtl.Visit_pk = @visit_id ) Begin
			SET @Weight = (Select Top (1) dtl.[Weight]
			From ord_Visit As ord
			Inner Join
				dtl_PatientVitals As dtl On dtl.Visit_pk = ord.Visit_Id
			Where (ord.Ptn_Pk = @ptn_pk)
			And (dtl.[Weight] Is Not Null)
			And (ord.Visit_Id = @visit_id));
		End 
		Else Begin
			SET @Weight = NULL;
		End
		
		If exists (SELECT * FROM dtl_PatientVitals dtl WHERE dtl.Visit_pk = @visit_id) Begin
			SET @Height = (Select Top 1 dtl.Height
			From Ord_visit ord
			Inner Join
				dtl_PatientVitals dtl On dtl.visit_pk = ord.Visit_Id
			Where ord.ptn_pk = @ptn_pk
			And dtl.Height Is Not Null
			And (ord.Visit_Id = @visit_id));
		End 
		Else Begin
			SET @Height = NULL;
		End
		
		If EXISTS(SELECT * FROM dtl_PatientVitals dtl WHERE dtl.Visit_pk = @visit_id) Begin
			SET @MUAC = (Select Top (1) dtl.Muac
			From ord_Visit As ord
			Inner Join
				dtl_PatientVitals As dtl On dtl.Visit_pk = ord.Visit_Id
			Where (ord.Ptn_Pk = @ptn_pk)
			And (dtl.Muac Is Not Null)
			And (ord.Visit_Id = @visit_id));
		End
		
		SET @TBinfected = 0;
		IF EXISTS(select TOP 1 Name from mst_Decode where id=(select TOP 1 eligibleThrough from dtl_PatientARVEligibility where ptn_pk = @ptn_pk And LocationID = @LocationId) and name like 'TB/HIV')
			BEGIN
				SET @TBinfected = 1;
			END
			
		SET @BreastFeeding = 0;
		IF EXISTS(select TOP 1 Name from mst_Decode where id=(select TOP 1 eligibleThrough from dtl_PatientARVEligibility where ptn_pk = @ptn_pk And LocationID = @LocationId) and name like 'BreastFeeding')
			BEGIN
				SET @TBinfected = 1;
			END
			
		SET @HIVDiagnosisDate = (select top 1 ConfirmHIVPosDate from dtl_PatientHivPrevCareEnrollment where ptn_pk = @ptn_pk);
		SET @EnrollmentDate = (select TOP 1 DateEnrolledInCare from dtl_PatientHivPrevCareEnrollment where ptn_pk=@ptn_pk);
		SET @EnrollmentWHOStage = (SELECT TOP 1 Name FROM mst_Decode WHERE ID = (SELECT TOP 1 WHOStage FROM dtl_PatientARVEligibility where WHOStage > 0 AND ptn_pk=@ptn_pk) and codeid=22);
		SET @Cohort = (select  TOP 1 convert(char(3),[FirstLineRegStDate] , 0) + ' ' + CONVERT(varchar(10), year([FirstLineRegStDate])) from [dbo].[dtl_PatientARTCare] WHERE ptn_pk = @ptn_pk);
		SET @CD4Count = (SELECT top 1 CD4 FROM dtl_PatientARVEligibility WHERE ptn_pk = @ptn_pk)
		SET @WHOStage = (SELECT TOP 1 WHOStage FROM dtl_PatientARVEligibility where ptn_pk = @ptn_pk);
		
		SELECT @EnrollmentWHOStage = CASE @EnrollmentWHOStage  
			 WHEN 1 THEN (SELECT TOP 1 ItemId FROM LookupItemView WHERE MasterName ='WHOStage' AND ItemName = 'Stage' + '1') 
			 WHEN 2 THEN (SELECT TOP 1 ItemId FROM LookupItemView WHERE MasterName ='WHOStage' AND ItemName = 'Stage' + '2')   
			 WHEN 3 THEN (SELECT TOP 1 ItemId FROM LookupItemView WHERE MasterName ='WHOStage' AND ItemName = 'Stage' + '3')   
			 WHEN 4 THEN (SELECT TOP 1 ItemId FROM LookupItemView WHERE MasterName ='WHOStage' AND ItemName = 'Stage' + '4')  
			 ELSE (select TOP 1 ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown')
		  END
		  
		SELECT @WHOStage = CASE @WHOStage  
			 WHEN 1 THEN (SELECT TOP 1 ItemId FROM LookupItemView WHERE MasterName ='WHOStage' AND ItemName = 'Stage' + '1') 
			 WHEN 2 THEN (SELECT TOP 1 ItemId FROM LookupItemView WHERE MasterName ='WHOStage' AND ItemName = 'Stage' + '2')   
			 WHEN 3 THEN (SELECT TOP 1 ItemId FROM LookupItemView WHERE MasterName ='WHOStage' AND ItemName = 'Stage' + '3')   
			 WHEN 4 THEN (SELECT TOP 1 ItemId FROM LookupItemView WHERE MasterName ='WHOStage' AND ItemName = 'Stage' + '4')  
			 ELSE (select TOP 1 ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown')
		  END
		  
		SET @VisitDate = (SELECT TOP 1 [VisitDate] FROM [dbo].[ord_Visit] where [Ptn_Pk] = @ptn_pk AND [VisitType] in(18, 19));
		IF @EnrollmentDate IS NULL BEGIN SET @EnrollmentDate = GETDATE(); END;

		INSERT INTO PatientMasterVisit(PatientId, ServiceId, Start, [End], Active, VisitDate, VisitScheduled, VisitBy, VisitType, [Status], CreateDate, DeleteFlag, CreatedBy)
		VALUES(@PatientId, 1, @EnrollmentDate, NULL, 0, @VisitDate, NULL, NULL, (SELECT top 1 ItemId FROM LookupItemView WHERE	MasterName like '%VisitType%' and ItemName like '%Enrollment%'), NULL, GETDATE(), 0 , @UserID);

		SELECT @PatientMasterVisitId = SCOPE_IDENTITY();

		IF (@Weight IS NOT NULL AND @Height IS NOT NULL  )
		BEGIN
			INSERT INTO [dbo].[PatientBaselineAssessment]([PatientId], [PatientMasterVisitId], [HBVInfected], [Pregnant], [TBinfected], [WHOStage], [BreastFeeding], [CD4Count], [MUAC], [Weight], [Height], [DeleteFlag], [CreatedBy], [CreateDate] )
			VALUES(@PatientId, @PatientMasterVisitId, 0, @Pregnant, @TBinfected, @WHOStage, @BreastFeeding, @CD4Count, @MUAC, @Weight, @Height, 0 , @UserID, GETDATE());

			IF @@ERROR <> 0
				BEGIN
					-- Rollback the transaction
					ROLLBACK

					-- Raise an error and return
					--RAISERROR ('Error in deleting employees in DeleteDepartment.', 16, 1)
					PRINT 'Error Occurred inserting into patient baseline assessment';
					RETURN
				END
		END

		IF EXISTS(SELECT * FROM dtl_PatientHivPrevCareIE WHERE Ptn_pk = @ptn_pk)
			BEGIN
				DECLARE @TransferInDate datetime, @TreatmentStartDate datetime, @CurrentART varchar(50), @FacilityFrom varchar(150), @CreateDateTransfer datetime, @MFLCODE int;

				SET @TransferInDate = (SELECT TOP 1 ARTTransferInDate FROM dtl_PatientHivPrevCareIE WHERE Ptn_pk = @ptn_pk);
				SET @TreatmentStartDate = (SELECT TOP 1 FirstLineRegStDate FROM dtl_PatientARTCare WHERE ptn_pk = @ptn_pk);
				SET @CurrentART = (SELECT TOP 1 CurrentART FROM dtl_PatientHivPrevCareIE WHERE Ptn_pk = @ptn_pk);
				SET @FacilityFrom = (SELECT TOP 1 ARTTransferInFrom FROM dtl_PatientHivPrevCareIE WHERE Ptn_pk = @ptn_pk);
				SET @CreateDateTransfer = (SELECT TOP 1 CreateDate FROM dtl_PatientHivPrevCareIE WHERE Ptn_pk = @ptn_pk);

				SET @MFLCODE = (select TOP 1 PosId from mst_Patient WHERE Ptn_pk = @ptn_pk);

				IF @TransferInDate IS NOT NULL AND @TreatmentStartDate IS NOT NULL AND @CurrentART IS NOT NULL AND @FacilityFrom IS NOT NULL AND @MFLCODE IS NOT NULL
					BEGIN
						INSERT INTO [dbo].[PatientTransferIn]([PatientId], [PatientMasterVisitId], [ServiceAreaId], [TransferInDate], [TreatmentStartDate], [CurrentTreatment],  [FacilityFrom] , [MFLCode] ,[CountyFrom] , [TransferInNotes], [DeleteFlag] ,[CreatedBy] , [CreateDate])
						VALUES(@PatientId, @PatientMasterVisitId, 1, @TransferInDate, @TreatmentStartDate, @CurrentART, @FacilityFrom, @MFLCODE, (select ItemId from LookupItemView where MasterName = 'Unknown' and ItemName = 'Unknown'), ' ', 0 , @UserID, @CreateDateTransfer);

						IF @@ERROR <> 0
						BEGIN
							-- Rollback the transaction
							ROLLBACK

							-- Raise an error and return
							--RAISERROR ('Error in deleting employees in DeleteDepartment.', 16, 1)
							PRINT 'Error Occurred inserting into patient transfer in';
							RETURN
						END
					END
		END

		IF EXISTS (Select	ptn_pk,	locationID,	Visit_pk [VisitId], a.PurposeId, b.Name [Purpose], a.Regimen [Regimen],	a.DateLastUsed [RegLastUsed] From dtl_PatientBlueCardPriorART a Inner Join Mst_Decode b On a.PurposeID = b.ID WHERE ptn_pk = @ptn_pk)
			BEGIN
				DECLARE @TreatmentType varchar(50), @Purpose varchar(50), @Regimen varchar(50), @DateLastUsed datetime;
			
				SET @TreatmentType = (select TOP 1 [Name] from mst_Decode where codeID=33 AND ID = (Select a.PurposeId From dtl_PatientBlueCardPriorART a Inner Join Mst_Decode b On a.PurposeID = b.ID WHERE ptn_pk = @ptn_pk));
				SET @Purpose = (select TOP 1 b.Name [Purpose] From dtl_PatientBlueCardPriorART a Inner Join Mst_Decode b On a.PurposeID = b.ID WHERE ptn_pk = @ptn_pk);
				SET @Regimen = (select TOP 1 a.Regimen [Regimen] From dtl_PatientBlueCardPriorART a Inner Join Mst_Decode b On a.PurposeID = b.ID WHERE ptn_pk = @ptn_pk);
				SET @DateLastUsed = (select TOP 1 a.DateLastUsed [RegLastUsed] From dtl_PatientBlueCardPriorART a Inner Join Mst_Decode b On a.PurposeID = b.ID WHERE ptn_pk = @ptn_pk);

				INSERT INTO [dbo].[PatientARVHistory]([PatientId], [PatientMasterVisitId], [TreatmentType], [Purpose] , [Regimen], [DateLastUsed], [DeleteFlag] , [CreatedBy] , [CreateDate])
				VALUES(@PatientId, @PatientMasterVisitId, @TreatmentType, @Purpose, @Regimen, @DateLastUsed, 0, @UserID, @CreateDate);

				IF @@ERROR <> 0
					BEGIN
						-- Rollback the transaction
						ROLLBACK

						-- Raise an error and return
						--RAISERROR ('Error in deleting employees in DeleteDepartment.', 16, 1)
						PRINT 'Error Occurred inserting into patient arv history';
						RETURN
					END
			END

		IF EXISTS(select TOP 1 FirstLineRegStDate from [dbo].[dtl_PatientARTCare] WHERE ptn_pk = @ptn_pk)
			BEGIN
				INSERT INTO [dbo].[PatientTreatmentInitiation]([PatientMasterVisitId], [PatientId], [DateStartedOnFirstLine], [Cohort], Regimen, [RegimenCode] , [BaselineViralload] , [BaselineViralloadDate] , [DeleteFlag] , [CreatedBy] , [CreateDate] )
				VALUES(@PatientMasterVisitId, @PatientId, (select TOP 1 FirstLineRegStDate from [dbo].[dtl_PatientARTCare] WHERE ptn_pk = @ptn_pk), @Cohort, Null,(SELECT TOP 1 FirstLineReg FROM dtl_PatientARTCare where ptn_pk = @ptn_pk) , NULL, NULL, 0, @UserID, @CreateDate);

				IF @@ERROR <> 0
					BEGIN
						-- Rollback the transaction
						ROLLBACK

						-- Raise an error and return
						--RAISERROR ('Error in deleting employees in DeleteDepartment.', 16, 1)
						PRINT 'Error Occurred inserting into patient treatment initiation';
						RETURN
					END
			END

		IF @HIVDiagnosisDate IS NOT NULL AND @EnrollmentDate IS NOT NULL AND @EnrollmentWHOStage IS NOT NULL AND @artstart IS NOT NULL
			BEGIN
				INSERT INTO [dbo].[PatientHivDiagnosis]([PatientMasterVisitId] , [PatientId] , [HIVDiagnosisDate] , [EnrollmentDate] , [EnrollmentWHOStage] , [ARTInitiationDate] , [DeleteFlag] , [CreatedBy] , [CreateDate])
				VALUES(@PatientMasterVisitId, @PatientId, @HIVDiagnosisDate, @EnrollmentDate, @EnrollmentWHOStage, @artstart, 0 , @UserID, @CreateDate);

				IF @@ERROR <> 0
					BEGIN
						-- Rollback the transaction
						ROLLBACK

						-- Raise an error and return
						--RAISERROR ('Error in deleting employees in DeleteDepartment.', 16, 1)
						PRINT 'Error Occurred inserting into patient hiv diagnosis';
						RETURN
					END
			END
		--ending baseline
		Update mst_Patient Set MovedToPatientTable =1 Where Ptn_Pk=@ptn_pk;
		COMMIT;
		-- Get the next mst_patient.
		FETCH NEXT FROM mstPatient_cursor   
		INTO @ptn_pk, @FirstName, @MiddleName, @LastName, @Sex, @Status, @DeleteFlag, @CreateDate, @UserID, @PatientFacilityId, @FacilityId, @DateOfBirth, @DobPrecision, @NationalId, @CCCNumber, @ReferredFrom, @RegistrationDate, @MaritalStatus , @DistrictName, @Address, @Phone, @LocationID
	END   
	CLOSE mstPatient_cursor;  
	DEALLOCATE mstPatient_cursor;
END


GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterAdverseEvents]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterAdverseEvents]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterAdverseEvents] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterAdverseEvents]
	-- Add the parameters for the stored procedure here
	@masterVisitID int = null,
	@PatientID int = null,
	@adverseEvent varchar(250) = null,
	@medicineCausingAE varchar(250) = null,
	@adverseSeverity varchar(250) = null,
	@adverseAction varchar(250) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
if exists(select 1 from AdverseEvent where PatientMasterVisitId = @masterVisitID and PatientId = @PatientID and EventName = @adverseEvent)
	BEGIN
		update AdverseEvent set EventCause = @medicineCausingAE, Severity = @adverseSeverity,[Action] = @adverseAction, DeleteFlag = 0
		where PatientMasterVisitId = @masterVisitID and PatientId = @PatientID and EventName = @adverseEvent
	END
	ELSE
	BEGIN
		insert into AdverseEvent(PatientId,PatientMasterVisitId,EventName,EventCause,Severity,[Action],DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@adverseEvent,@medicineCausingAE,@adverseSeverity,@adverseAction,0,@userID,GETDATE())
	END
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterAllergies]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterAllergies]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterAllergies] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 19th Mar 2017
-- Description:	save patient encounter - Allergies
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterAllergies]
	-- Add the parameters for the stored procedure here
	@MasterVisitID int = null,
	@PatientID int = null,
	@allergy varchar(50) = null,
	@allergyReaction varchar(50) = null,
	@allergySeverity varchar(50) = null,
	@allergyOnsetDate varchar(50) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	if exists(select 1 from patientallergy where Allergen = @allergy and PatientId = @PatientID)
	BEGIN
		update patientallergy set Allergen = @allergy, Reaction = @allergyReaction, severity = @allergySeverity,
		OnsetDate = @allergyOnsetDate, DeleteFlag = 0
		where Allergen = @allergy and PatientId = @PatientID
	END
	ELSE
	BEGIN
		insert into patientallergy(PatientId,PatientMasterVisitId,Allergen,Reaction,Severity,OnsetDate,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@allergy,@allergyReaction,@allergySeverity,@allergyOnsetDate, 0,@userID,GETDATE())
	END

End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterChronicIllness]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterChronicIllness]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterChronicIllness] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Chronic Illness
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterChronicIllness]
	-- Add the parameters for the stored procedure here
	@MasterVisitID int = null,
	@PatientID int = null,
	@chronicIllness varchar(50) = null,
	@treatment varchar(250) = null,
	@dose varchar(50) = null,
	@onsetDate varchar(20) = null,
	@active int = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	if exists(select 1 from PatientChronicIllness where ChronicIllness = @chronicIllness and PatientId = @PatientID)
	BEGIN
		update PatientChronicIllness set Treatment = @treatment,Dose = @dose,OnsetDate = @onsetDate, active = @active, DeleteFlag = 0
		where ChronicIllness = @chronicIllness and PatientId = @PatientID
	END
	ELSE
	BEGIN
		insert into PatientChronicIllness(PatientId,PatientMasterVisitId,ChronicIllness,Treatment,Dose,OnsetDate,active,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@chronicIllness,@treatment,@dose,@onsetDate,@active,0,@userID,GETDATE())
	END
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterComplaints]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterComplaints]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterComplaints] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 26th Apr 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterComplaints]
	-- Add the parameters for the stored procedure here
	@masterVisitID int = null,
	@PatientID int = null,
	@presentingComplaintID int = null,
	@onsetDate varchar(50) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
if exists(select 1 from presentingComplaints where PatientMasterVisitId = @masterVisitID and PatientId = @PatientID and PresentingComplaintsId = @presentingComplaintID)
	BEGIN
		update presentingComplaints set onsetDate = @onsetDate, DeleteFlag = 0
		where PatientMasterVisitId = @masterVisitID and PatientId = @PatientID and PresentingComplaintsId = @presentingComplaintID
	END
	ELSE
	BEGIN
		insert into presentingComplaints(PatientId,PatientMasterVisitId,PresentingComplaintsId,onsetDate,DeleteFlag,CreatedBy,CreatedDate) 
		values(@PatientID,@MasterVisitID,@presentingComplaintID,@onsetDate,0,@userID,GETDATE())
	END
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterDiagnosis]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterDiagnosis]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterDiagnosis] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Adverse Events
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterDiagnosis]
	-- Add the parameters for the stored procedure here
	@masterVisitID int = null,
	@PatientID int = null,
	@diagnosis varchar(250) = null,
	@treatment varchar(250) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	if exists(select 1 from PatientDiagnosis where Diagnosis = @diagnosis and PatientId = @PatientID and PatientMasterVisitID = @masterVisitID)
	BEGIN
		update PatientDiagnosis set ManagementPlan = @treatment, DeleteFlag = 0
		where Diagnosis = @diagnosis and PatientId = @PatientID and PatientMasterVisitID = @masterVisitID
	END
	ELSE
	BEGIN
		insert into PatientDiagnosis(PatientId,PatientMasterVisitId,Diagnosis,ManagementPlan,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@diagnosis,@treatment,0,@userID,GETDATE())
	END
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterGeneralExam]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterGeneralExam]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterGeneralExam] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 27th Apr 2017
-- Description:	save patient encounter - General Examination
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterGeneralExam]
	-- Add the parameters for the stored procedure here
	@MasterVisitID int = null,
	@PatientID int = null,
	@Exam varchar(50) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here

	declare @generalExamMasterID int = (select top 1 Id from lookupmaster where Name = 'GeneralExamination')
	declare @ExamID int = (select LookupItemId from LookupMasterItem where LookupMasterId = @generalExamMasterID and DisplayName = @Exam)

	if exists(select 1 from PhysicalExamination where PatientMasterVisitId = @MasterVisitID
	and PatientId = @PatientID and ExaminationTypeId = @generalExamMasterID and ExamId = @ExamID)
	BEGIN
		update PhysicalExamination set DeleteFlag = 0
		where PatientMasterVisitId = @MasterVisitID and PatientId = @PatientID and ExaminationTypeId = @generalExamMasterID
		and ExamId = @ExamID
	END
	ELSE
	BEGIN
		insert into PhysicalExamination(PatientId,PatientMasterVisitId,ExaminationTypeId,ExamId,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@generalExamMasterID,@ExamID,0,@userID,GETDATE())
	END
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPatientManagement]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPatientManagement]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterPatientManagement] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Patient Management
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterPatientManagement]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null,
	@ARVAdherence int = null,
	@CTXAdherence int = null,
	@WorkPlan varchar(1000) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	declare @ARVAdherenceType int = (Select Id from LookupMaster where name = 'ARVAdherence')
	declare @CTXAdherenceType int = (Select Id from LookupMaster where name = 'CTXAdherence')

	if(@PatientMasterVisitID > 0)
	BEGIN
		if(@ARVAdherence > 0)
		BEGIN
			if exists(select 1 from AdherenceOutcome where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and AdherenceType = @ARVAdherenceType)
			BEGIN
				update AdherenceOutcome set Score = @ARVAdherence
				where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and AdherenceType = @ARVAdherenceType
			END
			ELSE
			BEGIN
				insert into [dbo].[AdherenceOutcome] (PatientId, PatientMasterVisitId,AdherenceType,Score,DeleteFlag,CreateBy,CreateDate)
				values(@PatientID,@PatientMasterVisitID,@ARVAdherenceType,@ARVAdherence,0,@userID,GETDATE())
			END
		END

		if(@CTXAdherence > 0)
		BEGIN
			if exists(select 1 from AdherenceOutcome where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and AdherenceType = @CTXAdherenceType)
			BEGIN
				update AdherenceOutcome set Score = @CTXAdherence
				where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and AdherenceType = @CTXAdherenceType
			END
			ELSE
			BEGIN
				insert into [dbo].[AdherenceOutcome] (PatientId, PatientMasterVisitId,AdherenceType,Score,DeleteFlag,CreateBy,CreateDate)
				values(@PatientID,@PatientMasterVisitID,@CTXAdherenceType,@CTXAdherence,0,@userID,GETDATE())
			END
		END

		if exists(select 1 from PatientClinicalNotes where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID)
		BEGIN
			update PatientClinicalNotes set ClinicalNotes = @WorkPlan
			where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
		END
		ELSE
		BEGIN
			insert into PatientClinicalNotes(PatientId,PatientMasterVisitId,ServiceAreaId,ClinicalNotes,DeleteFlag,CreatedBy,CreateDate) 
			values(@PatientID,@PatientMasterVisitID,203,@WorkPlan,0,@userID,GETDATE())
		END
	END
	ELSE
	BEGIN
		if(@ARVAdherence > 0)
		BEGIN
			insert into [dbo].[AdherenceOutcome] (PatientId, PatientMasterVisitId,AdherenceType,Score,DeleteFlag,CreateBy,CreateDate)
			values(@PatientID,@PatientMasterVisitID,@ARVAdherenceType,@ARVAdherence,0,@userID,GETDATE())
		END

		if(@CTXAdherence > 0)
		BEGIN
			insert into [dbo].[AdherenceOutcome] (PatientId, PatientMasterVisitId,AdherenceType,Score,DeleteFlag,CreateBy,CreateDate)
			values(@PatientID,@PatientMasterVisitID,@CTXAdherenceType,@CTXAdherence,0,@userID,GETDATE())
		END

		insert into PatientClinicalNotes(PatientId,PatientMasterVisitId,ServiceAreaId,ClinicalNotes,DeleteFlag,CreatedBy,CreateDate) 
		values(@PatientID,@PatientMasterVisitID,203,@WorkPlan,0,@userID,GETDATE())
	END
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPHDP]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPHDP]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterPHDP] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Chronic Illness
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterPHDP]
	-- Add the parameters for the stored procedure here
	@MasterVisitID int = null,
	@PatientID int = null,
	@phdp varchar(50) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	declare @phdpMasterID int = (select Id from LookupMaster where Name = 'PHDP')
	declare @phdpID int = (select LookupItemId from LookupMasterItem where LookupMasterId = @phdpMasterID and DisplayName = @phdp)

	if exists(select 1 from PatientPHDP where PatientMasterVisitId = @MasterVisitID and PatientId = @PatientID and Phdp = @phdpID)
	BEGIN
		UPDATE PatientPHDP SET DeleteFlag = 0
		where PatientMasterVisitId = @MasterVisitID and PatientId = @PatientID and Phdp = @phdpID
	END
	ELSE
	BEGIN
		insert into PatientPHDP(PatientId,PatientMasterVisitId,phdp,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@phdpID,0,@userID,GETDATE())
	END
	
	
End







GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPhysicalExam]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPhysicalExam]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterPhysicalExam] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 7th Feb 2017
-- Description:	save patient encounter - Physical Examination
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterPhysicalExam]
	-- Add the parameters for the stored procedure here
	@MasterVisitID int = null,
	@PatientID int = null,
	@examType int = null,
	@exam varchar(250) = null,
	@findings varchar(50) = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	if exists(select 1 from PhysicalExamination where PatientMasterVisitId = @MasterVisitID
	and PatientId = @PatientID and ExaminationTypeId = @examType and ExamId = @exam)
	BEGIN
		update PhysicalExamination set Finding = @findings, DeleteFlag = 0
		where PatientMasterVisitId = @MasterVisitID and PatientId = @PatientID and ExaminationTypeId = @examType and ExamId = @exam
	END
	ELSE
	BEGIN
		insert into PhysicalExamination(PatientId,PatientMasterVisitId,ExaminationTypeId,ExamId,Finding,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@examType,@exam,@findings,0,@userID,GETDATE())
	END
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterPresentingComplaints]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterPresentingComplaints]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterPresentingComplaints] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 20th Jan 2017
-- Description:	save patient encounter - Presenting Complaints
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterPresentingComplaints]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null,
	@serviceID int = null,
	@VisitDate datetime = null,
	@VisitScheduled int =null,
	@VisitBy int = null,
	@anyPresentingComplaints int = null,
	@ComplaintsNotes nvarchar(1000) = null,
	@TBScreening int = null,
	@NutritionalStatus int = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	declare @TBScreeningTypeID int = (Select Id from LookupMaster where name = 'TBStatus')
	declare @NutritionScreeningTypeID int = (Select Id from LookupMaster where name = 'NutritionStatus')

	IF(@PatientMasterVisitID > 0)
	BEGIN
		update PatientMasterVisit set visitDate = @VisitDate, visitScheduled = @VisitScheduled, visitBy = @VisitBy
		where id = @PatientMasterVisitID and PatientId = @PatientID

		if exists(select 1 from ComplaintsHistory where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID)
		BEGIN
			update ComplaintsHistory set PresentingComplaint = @ComplaintsNotes, AnyComplaint = @anyPresentingComplaints 
			where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID
		END
		ELSE
		BEGIN
			insert into ComplaintsHistory (PatientId,PatientMasterVisitId,AnyComplaint,PresentingComplaint,DeleteFlag,CreateBy,CreateDate) 
			values(@PatientID,@PatientMasterVisitID,@anyPresentingComplaints,@ComplaintsNotes,0,@userID,GETDATE())
		END

		if(@TBScreening > 0)
		begin
			IF EXISTS(SELECT 1 FROM PatientScreening WHERE PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID 
			and ScreeningTypeId = @TBScreeningTypeID)
			BEGIN
				update PatientScreening set ScreeningValueId = @TBScreening
				where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and ScreeningTypeId = @TBScreeningTypeID
			END
			ELSE
			BEGIN
				insert into PatientScreening (PatientId,PatientMasterVisitId,ScreeningTypeId,ScreeningDone,ScreeningValueId,DeleteFlag,CreatedBy,CreateDate)
				values(@PatientID,@PatientMasterVisitID,@TBScreeningTypeID,1,@TBScreening,0,@userID,GETDATE())
			END
		end

		if(@NutritionalStatus > 0)
		begin
			IF EXISTS(SELECT 1 FROM PatientScreening WHERE PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID 
			and ScreeningTypeId = @NutritionScreeningTypeID)
			BEGIN
				update PatientScreening set ScreeningValueId = @NutritionalStatus
				where PatientMasterVisitId = @PatientMasterVisitID and PatientId = @PatientID and ScreeningTypeId = @NutritionScreeningTypeID
			END
			ELSE
			BEGIN
				insert into PatientScreening (PatientId,PatientMasterVisitId,ScreeningTypeId,ScreeningDone,ScreeningValueId,DeleteFlag,CreatedBy,CreateDate)
				values(@PatientID,@PatientMasterVisitID,@NutritionScreeningTypeID,1,@NutritionalStatus,0,@userID,GETDATE())
			END
		end
		
		select @PatientMasterVisitID as PatientMasterVisitID
	END
	ELSE
	BEGIN
		insert into PatientMasterVisit (patientId,serviceId,start,active,createdBy,createDate,visitDate,visitScheduled,visitBy)
		values(@PatientID,@serviceID,CONVERT (time, GETDATE()),1,@userID,GETDATE(),@VisitDate,@VisitScheduled,@VisitBy)
		SELECT @PatientMasterVisitID = SCOPE_IDENTITY()

		insert into ComplaintsHistory (PatientId,PatientMasterVisitId,AnyComplaint,PresentingComplaint,DeleteFlag,CreateBy,CreateDate) 
		values(@PatientID,@PatientMasterVisitID,@anyPresentingComplaints,@ComplaintsNotes,0,@userID,GETDATE())

		if(@TBScreening > 0)
		begin
			insert into PatientScreening (PatientId,PatientMasterVisitId,ScreeningTypeId,ScreeningDone,ScreeningValueId,DeleteFlag,CreatedBy,CreateDate)
			values(@PatientID,@PatientMasterVisitID,@TBScreeningTypeID,1,@TBScreening,0,@userID,GETDATE())
		end
		if(@NutritionalStatus > 0)
		begin
			insert into PatientScreening (PatientId,PatientMasterVisitId,ScreeningTypeId,ScreeningDone,ScreeningValueId,DeleteFlag,CreatedBy,CreateDate)
			values(@PatientID,@PatientMasterVisitID,@NutritionScreeningTypeID,1,@NutritionalStatus,0,@userID,GETDATE())
		end
		

		select @PatientMasterVisitID as PatientMasterVisitID

	END
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterTS]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterTS]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterTS] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 20th Jan 2017
-- Description:	save patient encounter - Presenting Complaints
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterTS]
	-- Add the parameters for the stored procedure here
	@PatientMasterVisitID int = null,
	@PatientID int = null,
	@serviceID int = null,
	@VisitDate datetime = null,
	@VisitScheduled int =null,
	@VisitBy int = null,
	@userID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	IF(@PatientMasterVisitID > 0)
	BEGIN
		update PatientMasterVisit set visitDate = @VisitDate, visitScheduled = @VisitScheduled, visitBy = @VisitBy
		where id = @PatientMasterVisitID and PatientId = @PatientID
		
		select @PatientMasterVisitID as PatientMasterVisitID
	END
	ELSE
	BEGIN
		insert into PatientMasterVisit (patientId,serviceId,start,active,createdBy,createDate,visitDate,visitScheduled,visitBy)
		values(@PatientID,@serviceID,CONVERT (time, GETDATE()),1,@userID,GETDATE(),@VisitDate,@VisitScheduled,@VisitBy)
		SELECT @PatientMasterVisitID = SCOPE_IDENTITY()
		

		select @PatientMasterVisitID as PatientMasterVisitID

	END
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientEncounterVaccines]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientEncounterVaccines]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientEncounterVaccines] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 29th Jan 2017
-- Description:	save patient encounter - Chronic Illness
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientEncounterVaccines]
	-- Add the parameters for the stored procedure here
	@MasterVisitID int = null,
	@PatientID int = null,
	@vaccine varchar(50) = null,
	@vaccineStage varchar(50) = null,
	@vaccineDate varchar(50) = null,
	@dose int = null,
	@duration int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
-- Insert statements for procedure here
	if exists(select 1 from Vaccination where Vaccine = @vaccine and VaccineStage = @vaccineStage and PatientId = @PatientID)
	BEGIN
		update Vaccination set VaccineDate = @vaccineDate, DeleteFlag = 0
		where Vaccine = @vaccine and VaccineStage = @vaccineStage and PatientId = @PatientID
	END
	ELSE
	BEGIN
		insert into Vaccination(PatientId,PatientMasterVisitId,Vaccine,VaccineStage,VaccineDate,DeleteFlag,CreatedBy,CreateDate) 
		values(@PatientID,@MasterVisitID,@vaccine,@vaccineStage,@vaccineDate, 0,1,GETDATE())
	END
	
End








GO
/****** Object:  StoredProcedure [dbo].[sp_savePatientFamilyPlanningMethod]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_savePatientFamilyPlanningMethod]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_savePatientFamilyPlanningMethod] AS' 
END
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 11th Mar 2017
-- Description:	save patient family planning method
-- =============================================
ALTER PROCEDURE [dbo].[sp_savePatientFamilyPlanningMethod]
	-- Add the parameters for the stored procedure here
	@PatientID int = null,
	@FPId int = null,
	@fpMethod int = null
	

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

	IF EXISTS(SELECT 1 FROM PatientFamilyPlanningMethod where patientid = @PatientID and PatientFPId = @FPId and FPMethodId = @fpMethod)
	BEGIN
		update PatientFamilyPlanningMethod set DeleteFlag = 0
		where patientid = @PatientID and PatientFPId = @FPId and FPMethodId = @fpMethod
	END
	ELSE
	BEGIN
		insert into PatientFamilyPlanningMethod (PatientId,PatientFPId, FPMethodId,DeleteFlag)
		values(@PatientID,@FPId,@fpMethod,0)
	END
END







GO
/****** Object:  StoredProcedure [dbo].[sp_SaveUpdatePharmacy_GreenCard]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaveUpdatePharmacy_GreenCard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_SaveUpdatePharmacy_GreenCard] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_SaveUpdatePharmacy_GreenCard]                                                
( 
 @PatientMasterVisitID int = 0,                                               
 @PatientId int = null,                                                
 @LocationID int = null,                                                
 @OrderedBy int = null,                                                                                                                                          
 @UserID int = null,                                                 
 @RegimenType varchar(50) = null,                                                
 @DispensedBy int=null,                                                
 @DispensedByDate datetime=null,    
 @RegimenLine int = null,                
 @PharmacyNotes varchar(200) = null,
 @ModuleID int = null,

 @TreatmentProgram int = null,
 @PeriodTaken int = null,

 @TreatmentPlan int = null, 
 @TreatmentPlanReason int = null,
 @Regimen int = null                 
)                                                
                                                
As       
Begin               
	Declare @ptn_pharmacy int,@RegimenMap_Pk int,@ARTStartDate datetime,@Ptn_Pharmacy_Pk int, @ptn_pk int, @visitPK int

	Select @RegimenType = Nullif(Ltrim(Rtrim(@RegimenType)), '')

	set @ptn_pk = (select ptn_pk from patient where id = @PatientId)

	IF EXISTS(select 1 from ord_PatientPharmacyOrder where PatientMasterVisitId = @PatientMasterVisitID) 
	BEGIN
		set @Ptn_Pharmacy_Pk = (select ptn_pharmacy_pk from ord_PatientPharmacyOrder where patientmasterVisitID = @PatientMasterVisitID)
		Update [ord_PatientPharmacyOrder] Set
			[OrderedBy] = @OrderedBy, [DispensedBy] = @DispensedBy,
			[ProgID] = @TreatmentProgram, [UpdateDate] = Getdate(),
			[ProviderID] = 1, [DispensedByDate] = @DispensedByDate,
			UserID = @UserID,	Regimenline = @Regimenline,
			PharmacyNotes = @PharmacyNotes, pharmacyperiodtaken = @PeriodTaken
		Where patientmasterVisitID = @PatientMasterVisitID

		Update ARVTreatmentTracker set regimenid = @Regimen, regimenLineId = @RegimenLine, TreatmentStatusId = @TreatmentPlan,
		TreatmentStatusReasonId = @TreatmentPlanReason

		If(@RegimenType Is Not Null) 
		Begin
		
			Select @RegimenMap_Pk = RegimenMap_Pk
			From dtl_regimenmap a, ord_patientpharmacyorder b
			Where a.ptn_pk = b.ptn_pk
			And b.ptn_pharmacy_pk = a.orderID
			And b.Ptn_Pharmacy_Pk = @Ptn_Pharmacy_Pk;

			Update [dtl_RegimenMap] Set
				[RegimenType] = @RegimenType,
				[UpdateDate] = Getdate()
			Where ([RegimenMap_Pk] = @RegimenMap_Pk)
		End
		
		Select @ARTStartDate = dbo.fn_GetPatientARTStartDate_constella(@ptn_pk)
		
		Update mst_Patient Set
			ARTStartDate = @ARTStartDate
		Where ptn_pk = @ptn_pk;

		Select @ptn_pharmacy_pk;
	END
	ELSE
	BEGIN
		insert into ord_Visit (ptn_pk,locationid,VisitDate,VisitType,DataQuality,DeleteFlag,UserID,CreateDate,CreatedBy)
		values(@ptn_pk, @locationID,GETDATE(),4,1,0,@UserID,GETDATE(),@UserID)

		set @visitPK = SCOPE_IDENTITY();

		Insert Into dbo.ord_PatientPharmacyOrder (
			Ptn_pk, PatientID, patientmasterVisitID, LocationID, OrderedBy, OrderedByDate, DispensedBy, DispensedByDate, ProgID,
			UserID, CreateDate, ProviderID, Regimenline, PharmacyNotes, VisitID, pharmacyPeriodTaken)
		Values (
			@ptn_pk,@PatientId, @PatientMasterVisitID, @LocationID, @OrderedBy, getdate(), @DispensedBy, @DispensedByDate, @TreatmentProgram, 
			@UserID, Getdate(), 1, @RegimenLine, @PharmacyNotes, @visitPK, @PeriodTaken);

		Set @ptn_pharmacy =SCOPE_IDENTITY();

		Insert into ARVTreatmentTracker (PatientId,ServiceAreaId,PatientMasterVisitId,RegimenId,RegimenLineId,
		TreatmentStatusId,TreatmentStatusReasonId, DeleteFlag, CreateBy, createdate)
		values(@patientid,@moduleid,@PatientMasterVisitID,@Regimen,@RegimenLine,@TreatmentPlan,@TreatmentPlanReason,
		0,@UserID,GETDATE())

		Update ord_PatientPharmacyOrder Set
			ReportingID = (Select Right('000000' + Convert(varchar, @ptn_pharmacy), 6))
		Where ptn_pharmacy_pk = @ptn_pharmacy;

		--If (@DispensedByDate Is Not Null And @DispensedBy > 0) Begin
		--	Update ord_PatientPharmacyOrder Set
		--		OrderStatus = 2
		--	Where ptn_pharmacy_pk = @ptn_pharmacy;
		--End

		
		If(@RegimenType Is Not Null) 
		Begin	
			Insert Into dtl_RegimenMap (Ptn_Pk,	LocationID,	Visit_Pk, RegimenType, OrderId,	UserID,	CreateDate)
			Values (@ptn_pk, @LocationID, @visitPK, @RegimenType, @ptn_pharmacy, @UserID, Getdate());
		End

		Select @ARTStartDate = dbo.fn_GetPatientARTStartDate_constella(@ptn_pk)
		Update mst_Patient Set
			ARTStartDate = @ARTStartDate
		Where ptn_pk = @ptn_pk;

		Select @ptn_pharmacy;

	END
End






GO
/****** Object:  StoredProcedure [dbo].[sp_SaveUpdatePharmacyPrescription_GreenCard]    Script Date: 5/9/2017 3:16:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaveUpdatePharmacyPrescription_GreenCard]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_SaveUpdatePharmacyPrescription_GreenCard] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_SaveUpdatePharmacyPrescription_GreenCard]                                    
	@ptn_pharmacy_pk int = null,
	@DrugId int = null,
	@BatchId varchar(50) = null,
	@Dose decimal(18,2)=0,                                 
	@FreqId int = null,
	@Duration decimal(18,2) = null,
	@qtyPres decimal(18,2) = null,
	@qtyDisp decimal(18,2) = null,
	@UserID int = null,                
	@Prophylaxis int = null,
	@pmscm varchar(50) = null                               
                                    
AS                                        
Begin
	declare @TotalOrderedQuantity int,@TotalDispensedQuantity int
	Select @TotalOrderedQuantity = 0, @TotalDispensedQuantity = 0
			
	if exists(select 1 from dtl_PatientPharmacyOrder where ptn_pharmacy_pk = @ptn_pharmacy_pk And Drug_Pk = @DrugId
	 and BatchNo = @BatchId)
	BEGIN
		Update dtl_PatientPharmacyOrder Set
			SingleDose = @Dose,
			FrequencyID = @FreqId,
			Duration = @Duration,
			OrderedQuantity = @qtyPres,
			BatchNo = @BatchId,
			UserID = @UserID,
			DispensedQuantity = @qtyDisp,
			UpdateDate = Getdate(),
			Prophylaxis = @Prophylaxis
		Where ptn_pharmacy_pk = @ptn_pharmacy_pk And Drug_Pk = @DrugId and BatchNo = @BatchId

		if(@pmscm = 1 and @qtyDisp > 0)
		BEGIN
			--IF NOT EXISTS(select 1 from dtl_patientPharmacyDispensed where ptn_pharmacy_pk = @ptn_pharmacy_pk and Drug_Pk = @DrugId
			--and batchId = @BatchId)
			--BEGIN
			--	INSERT into dtl_patientPharmacyDispensed
			--	(ptn_pharmacy_pk,drug_pk,batchId,frequencyID,dose,duration,dispensedQuantity,dispensedDate,deleteFlag)
			--	values(@ptn_pharmacy_pk,@DrugId,@BatchId,@FreqId,@Dose,@Duration,@qtyDisp,GETDATE(),0)
			--END
			
			update ord_PatientPharmacyOrder set DispensedByDate = GETDATE(), DispensedBy = @UserID
		END
	
	END
	ELSE
	BEGIN
		Insert Into dtl_PatientPharmacyOrder (
			ptn_pharmacy_pk,Drug_Pk,SingleDose,FrequencyID,Duration,OrderedQuantity,BatchNo, DispensedQuantity, UserID,CreateDate,Prophylaxis,
			genericid,StrengthID)
		Values (
			@ptn_pharmacy_pk,@DrugId,@Dose,@FreqId,@Duration,@qtyPres,@BatchId,@qtyDisp,@UserID,Getdate(),@Prophylaxis,0,0);

		if(@pmscm = 1 and @qtyDisp > 0)
		BEGIN
			--INSERT into dtl_patientPharmacyDispensed
			--(ptn_pharmacy_pk,drug_pk,batchId,frequencyID,dose,duration,dispensedQuantity,dispensedDate,deleteFlag)
			--values(@ptn_pharmacy_pk,@DrugId,@BatchId,@FreqId,@Dose,@Duration,@qtyDisp,GETDATE(),0)

			declare @ptn_pk int = (select Ptn_pk from ord_patientpharmacyorder where ptn_pharmacy_pk=@ptn_pharmacy_pk)
			declare @storeID int = (select top 1 StoreId from Dtl_StockTransaction where BatchId = @BatchId)

			insert into Dtl_StockTransaction
			(ItemId,BatchId,ptn_pharmacy_pk, PtnPk,storeid,transactiondate,quantity,UserId,createdate)
			values(@DrugId,@BatchId,@ptn_pharmacy_pk,@ptn_pk,@storeID,getdate(),-@qtyDisp,@UserID,GETDATE())

			update ord_PatientPharmacyOrder set DispensedByDate = GETDATE(), DispensedBy = @UserID
		END
		
	END

	Select	@TotalOrderedQuantity = Sum(a.OrderedQuantity),
			@TotalDispensedQuantity = Sum(a.dispensedQuantity)
	From dtl_PatientPharmacyOrder a
	Where a.ptn_pharmacy_pk = @ptn_pharmacy_pk

	Update ord_PatientPharmacyOrder Set
		OrderStatus = Case 
						When DispensedByDate Is Null Then 1 --new order
						When DispensedByDate Is Not Null  And @TotalDispensedQuantity = @TotalOrderedQuantity Then 2 --complete
						When DispensedByDate Is Not Null  And @TotalDispensedQuantity < @TotalOrderedQuantity Then 3 --partial
						Else orderstatus End
	Where ptn_pharmacy_pk = @ptn_pharmacy_pk

                                     
End





GO
