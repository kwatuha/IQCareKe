﻿using DataAccess.Base;
using DataAccess.Common;
using DataAccess.Entity;
using Interface.Clinical;
using System;
using System.Collections;
using System.Data;

namespace BusinessProcess.Clinical
{
    /// <summary>
    /// 
    /// </summary>
    public class BPatientARTCare : ProcessBase, IPatientARTCare
    {
        /// <summary>
        /// Gets the patient art care.
        /// </summary>
        /// <param name="patientid">The patientid.</param>
        /// <param name="LocationId">The location identifier.</param>
        /// <returns></returns>
        public DataSet GetPatientARTCare(int patientid,int LocationId)
        {
            lock (this)
            {
                ClsUtility.Init_Hashtable();
                ClsUtility.AddParameters("@patientid", SqlDbType.Int, patientid.ToString());
                ClsUtility.AddParameters("@LocationId", SqlDbType.Int, LocationId.ToString());
                ClsObject UserManager = new ClsObject();
                return (DataSet)UserManager.ReturnObject(ClsUtility.theParams, "pr_Clinical_GetARTCarePatientData", ClsUtility.ObjectEnum.DataSet);
            }
        }
        //Saving and Updating

        /// <summary>
        /// Save_s the update_ art care.
        /// </summary>
        /// <param name="patientId">The patient identifier.</param>
        /// <param name="visitId">The visit identifier.</param>
        /// <param name="locationId">The location identifier.</param>
        /// <param name="ht">The ht.</param>
        /// <param name="userId">The user identifier.</param>
        /// <param name="dqFlag">The data quality flag.</param>
        /// <param name="theCustomDataDT">The custom data dt.</param>
        /// <returns></returns>
        public int Save_Update_ARTCare(int patientId, int visitId, int locationId, Hashtable ht, int userId, int dqFlag, DataTable theCustomDataDT)
        {
            int retval = 0;
            DataSet theDS;
            ClsObject FollowupManager = new ClsObject();
            try
            {
                this.Connection = DataMgr.GetConnection();
                this.Transaction = DataMgr.BeginTransaction(this.Connection);

                FollowupManager.Connection = this.Connection;
                FollowupManager.Transaction = this.Transaction;

                ClsUtility.Init_Hashtable();
                ClsUtility.AddParameters("@patientid", SqlDbType.Int, patientId.ToString());
                ClsUtility.AddParameters("@locationid", SqlDbType.Int, locationId.ToString());
                ClsUtility.AddParameters("@Visit_ID", SqlDbType.Int, visitId.ToString());                
                ClsUtility.AddParameters("@ARTTransferindate", SqlDbType.DateTime, ht["ARTTransferindate"].ToString());
                ClsUtility.AddParameters("@ARTTransferinfrom", SqlDbType.VarChar, ht["ARTTransferinfrom"].ToString());
                ClsUtility.AddParameters("@transferARVs", SqlDbType.VarChar, ht["transferARVs"].ToString());
                ClsUtility.AddParameters("@AnotherRegimennStartdt", SqlDbType.DateTime, ht["AnotherRegimennStartdt"].ToString());
                ClsUtility.AddParameters("@AotherRegimen", SqlDbType.VarChar, ht["AotherRegimen"].ToString());
                ClsUtility.AddParameters("@AnotherWeight", SqlDbType.VarChar, ht["AnotherWeight"].ToString());
                ClsUtility.AddParameters("@AnotherClinicalStage", SqlDbType.Int, ht["AnotherClinicalStage"].ToString());
                ClsUtility.AddParameters("@AotherCD4", SqlDbType.VarChar, ht["AotherCD4"].ToString());
                ClsUtility.AddParameters("@AnotherCD4Percent", SqlDbType.VarChar, ht["AnotherCD4Percent"].ToString());
                ClsUtility.AddParameters("@pregnant", SqlDbType.Int, ht["pregnant"].ToString());
                ClsUtility.AddParameters("@dataquality", SqlDbType.Int, dqFlag.ToString());
                ClsUtility.AddParameters("@UserId", SqlDbType.Int, userId.ToString());
               
                
                theDS = (DataSet)FollowupManager.ReturnObject(ClsUtility.theParams, "pr_Clinical_SaveUpdateARTCare_Futures", ClsUtility.ObjectEnum.DataSet);

                for (int i = 0; i < theCustomDataDT.Rows.Count; i++)
                {
                    ClsUtility.Init_Hashtable();
                    string theQuery = theCustomDataDT.Rows[i]["Query"].ToString();
                    theQuery = theQuery.Replace("#99#", patientId.ToString());
                    theQuery = theQuery.Replace("#88#", locationId.ToString());
                    theQuery = theQuery.Replace("#77#", theDS.Tables[0].Rows[0]["Visit_Id"].ToString());
                    theQuery = theQuery.Replace("#66#", "'" + System.DateTime.Now.ToString("dd-MMM-yyyy") + "'");
                    ClsUtility.AddParameters("@QryString", SqlDbType.VarChar, theQuery);
                    int RowsAffected = (Int32)FollowupManager.ReturnObject(ClsUtility.theParams, "pr_General_Dynamic_Insert", ClsUtility.ObjectEnum.ExecuteNonQuery);
                }

                ////////////////////////////////
                DataMgr.CommitTransaction(this.Transaction);
                DataMgr.ReleaseConnection(this.Connection);
            }

            catch
            {
                DataMgr.RollBackTransation(this.Transaction);
                throw;
            }

            finally
            {
                if (this.Connection != null)
                    DataMgr.ReleaseConnection(this.Connection);

            }
            return retval;
        }

        //*********************//
        //John Macharia start
        /// <summary>
        /// Gets the patient arv therapy.
        /// </summary>
        /// <param name="patientid">The patientid.</param>
        /// <param name="LocationId">The location identifier.</param>
        /// <returns></returns>
        public DataSet GetPatientARVTherapy(int patientid, int LocationId)
        {
            lock (this)
            {
                ClsUtility.Init_Hashtable();
                ClsUtility.AddParameters("@patientid", SqlDbType.Int, patientid.ToString());
                ClsUtility.AddParameters("@LocationId", SqlDbType.Int, LocationId.ToString());
                ClsObject UserManager = new ClsObject();
                return (DataSet)UserManager.ReturnObject(ClsUtility.theParams, "pr_Clinical_GetARVTherapyPatientData", ClsUtility.ObjectEnum.DataSet);
            }
        }

        /// <summary>
        /// Save_s the update_ arv therapy.
        /// </summary>
        /// <param name="patientId">The patient identifier.</param>
        /// <param name="visitId">The visit identifier.</param>
        /// <param name="locationId">The location identifier.</param>
        /// <param name="ht">The ht.</param>
        /// <param name="userId">The user identifier.</param>
        /// <param name="dqFlag">The data quality flag.</param>
        /// <param name="theCustomFieldData">The custom field data.</param>
        /// <returns></returns>
        public int Save_Update_ARVTherapy(int patientId, int visitId, int locationId, Hashtable ht, int userId, int dqFlag, DataTable theCustomFieldData)
        {
            int retval = 0;
            ClsObject obj = new ClsObject();
            try
            {
                this.Connection = DataMgr.GetConnection();
                this.Transaction = DataMgr.BeginTransaction(this.Connection);

                obj.Connection = this.Connection;
                obj.Transaction = this.Transaction;

                ClsUtility.Init_Hashtable();
                ClsUtility.AddParameters("@patientid", SqlDbType.Int, patientId.ToString());
                ClsUtility.AddParameters("@locationid", SqlDbType.Int, locationId.ToString());
                ClsUtility.AddParameters("@Visit_ID", SqlDbType.Int, visitId.ToString());
                ClsUtility.AddParameters("@ARVDateEligible", SqlDbType.DateTime, ht["DateEligible"].ToString());
                ClsUtility.AddParameters("@ARVEligibleThrough", SqlDbType.Int, ht["EligibleThru"].ToString());
                ClsUtility.AddParameters("@EligibleWHOStage", SqlDbType.Int, ht["WHOStage"].ToString());
                ClsUtility.AddParameters("@EligibleCD4", SqlDbType.VarChar, ht["CD4"].ToString());
                ClsUtility.AddParameters("@EligibleCD4percent", SqlDbType.VarChar, ht["CD4Percent"].ToString());
                ClsUtility.AddParameters("@ARVCohortMonth", SqlDbType.VarChar, ht["CohortMonth"].ToString());
                ClsUtility.AddParameters("@ARVCohortYear", SqlDbType.Int, ht["CohortYear"].ToString());
                ClsUtility.AddParameters("@AnotherRegimenStartDate", SqlDbType.DateTime, ht["AnotherRegimenStartDate"].ToString());
                ClsUtility.AddParameters("@AnotherRegimen", SqlDbType.VarChar, ht["AnotherRegimen"].ToString());
                ClsUtility.AddParameters("@AnotherWeight", SqlDbType.VarChar, ht["AnotherWeight"].ToString());
                ClsUtility.AddParameters("@AnotherHeight", SqlDbType.VarChar, ht["AnotherHeight"].ToString());
                ClsUtility.AddParameters("@AnotherWHOStage", SqlDbType.Int, ht["AnotherClinicalStage"].ToString());
                ClsUtility.AddParameters("@dataquality", SqlDbType.Int, dqFlag.ToString());
                ClsUtility.AddParameters("@UserId", SqlDbType.Int, userId.ToString());
                if (ht.ContainsKey("MUAC") && ht["MUAC"].ToString() != "")
                {
                    ClsUtility.AddParameters("@MUAC", SqlDbType.Decimal, ht["MUAC"].ToString());
                }
                if (ht.ContainsKey("OtherCriteria") && ht["OtherCriteria"].ToString() != "")
                {
                    ClsUtility.AddParameters("@OtherEligibleCriteria", SqlDbType.VarChar, ht["OtherCriteria"].ToString());
                }
                if (ht.ContainsKey("ModuleId"))
                {
                    ClsUtility.AddExtendedParameters("@ModuleId", SqlDbType.Int, Convert.ToInt32(ht["ModuleId"]));
                }
                DataTable retvalother = (DataTable)obj.ReturnObject(ClsUtility.theParams, "pr_Clinical_SaveUpdateARVTherapy_Futures", ClsUtility.ObjectEnum.DataTable);

                for (int i = 0; i < theCustomFieldData.Rows.Count; i++)
                {
                    ClsUtility.Init_Hashtable();
                    string theQuery = theCustomFieldData.Rows[i]["Query"].ToString();
                    theQuery = theQuery.Replace("#99#", patientId.ToString());
                    theQuery = theQuery.Replace("#88#", locationId.ToString());
                    theQuery = theQuery.Replace("#77#", retvalother.Rows[0]["Visit_ID"].ToString());
                 //   theQuery = theQuery.Replace("#66#", "02/06/2013");
                    theQuery = theQuery.Replace("#66#", "'" + ht["visitdate"].ToString() + "'");
                    ClsUtility.AddParameters("@QryString", SqlDbType.VarChar, theQuery);
                    int RowsAffected = (Int32)obj.ReturnObject(ClsUtility.theParams, "pr_General_Dynamic_Insert", ClsUtility.ObjectEnum.ExecuteNonQuery);
                }

                ////////////////////////////////
                DataMgr.CommitTransaction(this.Transaction);
                DataMgr.ReleaseConnection(this.Connection);
            }

            catch
            {
                DataMgr.RollBackTransation(this.Transaction);
                throw;
            }

            finally
            {
                if (this.Connection != null)
                    DataMgr.ReleaseConnection(this.Connection);

            }
            return retval;
        }
        //John Macharia End
    }
    


}
