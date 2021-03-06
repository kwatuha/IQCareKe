using DataAccess.Base;
using DataAccess.Common;
using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;

namespace DataAccess.Entity
{

    public class ClsObject : ProcessBase  //,IDisposable 
    {
        #region "Constructor"
        public ClsObject()
        {
        }      
        #endregion

        #region "User Functions"
        /// <summary>
        /// Returns the object.
        /// </summary>
        /// <param name="paramaters">The parameters.</param>
        /// <param name="commandText">The command text.</param>
        /// <param name="Obj">The object.</param>
        /// <param name="Mode">The mode.</param>
        /// <returns></returns>
        public object ReturnObject(Hashtable paramaters, string commandText, ClsUtility.ObjectEnum Obj,ConnectionMode Mode)
        {
            //int i;
            //string cmdpara, cmdvalue, cmddbtype;
            SqlCommand theCmd = new SqlCommand();
            SqlTransaction theTran = (SqlTransaction)this.Transaction;
            SqlConnection cnn;

            if (null == this.Connection)
            {
                cnn = (SqlConnection)DataMgr.GetConnection(Mode);
            }
            else
            {
                cnn = (SqlConnection)this.Connection;
            }           
            if (null == this.Transaction)
            {
                theCmd = new SqlCommand(commandText, cnn);
            }
            else
            {
                theCmd = new SqlCommand(commandText, cnn, theTran);
            }
            /* for (i = 1; i < Params.Count; )
             {
                 cmdpara = Params[i].ToString();
                 cmddbtype = Params[i + 1].ToString();
                 cmdvalue = Params[i + 2].ToString();
                 System.Data.Common.DbParameter p = theCmd.CreateParameter();
                 p.ParameterName = cmdpara;
                 p.Value = cmdvalue;
                 theCmd.Parameters.Add(cmdpara);

                 theCmd.Parameters.Add(cmdpara, cmddbtype).Value = cmdvalue;
                 i = i + 3;
             }
             */
            for (int i = 1; i <= paramaters.Count;) {
                theCmd.Parameters.Add(paramaters[i]);
                i++;
            }
            theCmd.CommandType = CommandType.StoredProcedure;
            theCmd.CommandTimeout = DataMgr.CommandTimeOut();
            string theSubstring = commandText.Substring(0, 6).ToUpper();
            switch (theSubstring)
            {
                case "SELECT":
                    theCmd.CommandType = CommandType.Text;
                    break;
                case "UPDATE":
                    theCmd.CommandType = CommandType.Text;
                    break;
                case "INSERT":
                    theCmd.CommandType = CommandType.Text;
                    break;
                case "DELETE":
                    theCmd.CommandType = CommandType.Text;
                    break;
                case "TRUNCA":
                    theCmd.CommandType = CommandType.Text;
                    break;
            }

            theCmd.Connection = cnn;
            try
            {
                if (Obj == ClsUtility.ObjectEnum.DataSet)
                {

                    SqlDataAdapter theAdpt = new SqlDataAdapter(theCmd);
                    DataSet theDS = new DataSet();
                    theAdpt.Fill(theDS);
                    theAdpt.Dispose();
                    return theDS;
                }

                if (Obj == ClsUtility.ObjectEnum.DataTable)
                {
                    SqlDataAdapter theAdpt = new SqlDataAdapter(theCmd);
                    DataTable theDT = new DataTable();
                    theAdpt.Fill(theDT);
                    theAdpt.Dispose();
                    return theDT;
                }

                if (Obj == ClsUtility.ObjectEnum.DataRow)
                {
                    SqlDataAdapter theAdpt = new SqlDataAdapter(theCmd);
                    DataTable theDT = new DataTable();
                    theAdpt.Fill(theDT);
                    theAdpt.Dispose();
                    return theDT.Rows[0];
                }


                if (Obj == ClsUtility.ObjectEnum.ExecuteNonQuery)
                {
                    int NoRowsAffected = theCmd.ExecuteNonQuery();
                    return NoRowsAffected;
                }
                return 0;
            }
            catch (Exception err)
            {


               throw err;
            }
            finally
            {
                if (null != cnn)
                    if (null == this.Connection)
                        DataMgr.ReleaseConnection(cnn);
            }

        }
        public object ReturnObject(Hashtable paramaters, string commandText, ClsUtility.ObjectEnum Obj, string connectionName)
        {
            //int i;
            //string cmdpara, cmdvalue, cmddbtype;
            SqlCommand theCmd = new SqlCommand();
            SqlTransaction theTran = (SqlTransaction)this.Transaction;
            SqlConnection cnn;

            if (null == this.Connection)
            {
                cnn = (SqlConnection)DataMgr.GetConnection(connectionName);
            }
            else
            {
                cnn = (SqlConnection)this.Connection;
            }
            if (null == this.Transaction)
            {
                theCmd = new SqlCommand(commandText, cnn);
            }
            else
            {
                theCmd = new SqlCommand(commandText, cnn, theTran);
            }

            //for (i = 1; i < Params.Count;)
            //{
            //    cmdpara = Params[i].ToString();
            //    cmddbtype = Params[i + 1].ToString();
            //    cmdvalue = Params[i + 2].ToString();
            //    System.Data.Common.DbParameter p = theCmd.CreateParameter();
            //    p.ParameterName = cmdpara;
            //    p.Value = cmdvalue;
            //    theCmd.Parameters.Add(cmdpara, cmddbtype).Value = cmdvalue;
            //    i = i + 3;
            //}
            for (int i = 1; i <= paramaters.Count;)
            {

                theCmd.Parameters.Add(paramaters[i]);
                i++;
            }
            theCmd.CommandType = CommandType.StoredProcedure;
            theCmd.CommandTimeout = DataMgr.CommandTimeOut();
            string theSubstring = commandText.Substring(0, 6).ToUpper();
            switch (theSubstring)
            {
                case "SELECT":
                    theCmd.CommandType = CommandType.Text;
                    break;
                case "UPDATE":
                    theCmd.CommandType = CommandType.Text;
                    break;
                case "INSERT":
                    theCmd.CommandType = CommandType.Text;
                    break;
                case "DELETE":
                    theCmd.CommandType = CommandType.Text;
                    break;
                case "TRUNCA":
                    theCmd.CommandType = CommandType.Text;
                    break;
            }

            theCmd.Connection = cnn;
            try
            {
                if (Obj == ClsUtility.ObjectEnum.DataSet)
                {

                    SqlDataAdapter theAdpt = new SqlDataAdapter(theCmd);
                    DataSet theDS = new DataSet();
                    theAdpt.Fill(theDS);
                    theAdpt.Dispose();
                    return theDS;
                }

                if (Obj == ClsUtility.ObjectEnum.DataTable)
                {
                    SqlDataAdapter theAdpt = new SqlDataAdapter(theCmd);
                    DataTable theDT = new DataTable();
                    theAdpt.Fill(theDT);
                    theAdpt.Dispose();
                    return theDT;
                }

                if (Obj == ClsUtility.ObjectEnum.DataRow)
                {
                    SqlDataAdapter theAdpt = new SqlDataAdapter(theCmd);
                    DataTable theDT = new DataTable();
                    theAdpt.Fill(theDT);
                    theAdpt.Dispose();
                    return theDT.Rows[0];
                }


                if (Obj == ClsUtility.ObjectEnum.ExecuteNonQuery)
                {
                    int NoRowsAffected = theCmd.ExecuteNonQuery();
                    return NoRowsAffected;
                }
                return 0;
            }
            catch (Exception err)
            {


                throw err;
            }
            finally
            {
                if (null != cnn)
                    if (null == this.Connection)
                        DataMgr.ReleaseConnection(cnn);
            }

        }
        public object ReturnObject(Hashtable paramaters, string commandText,ClsUtility.ObjectEnum Obj)
        {
            //int i;
            //string cmdpara,  cmddbtype;
            //object cmdvalue;
            SqlCommand theCmd = new SqlCommand();
            SqlTransaction theTran = (SqlTransaction)this.Transaction;
            SqlConnection cnn;

            if (null == this.Connection)
            {
                cnn = (SqlConnection)DataMgr.GetConnection();
            }
            else
            {
                cnn = (SqlConnection)this.Connection;
            }

            if (null == this.Transaction)
            {
                theCmd  = new SqlCommand(commandText, cnn);
            }
            else                                                                                            
            {
                theCmd = new SqlCommand(commandText, cnn, theTran);
            }

            //for (i = 1; i < Params.Count; )
            //{
            //    cmdpara = Params[i].ToString();
            //    cmddbtype = Params[i + 1].ToString();
            //    //if (cmddbtype.Contains("binary"))
            //        cmdvalue = Params[i + 2];
            //    //else
            //    //    cmdvalue = Params[i + 2].ToString();
            //   // theCmd.Parameters.Add(cmdpara, cmddbtype).Value = cmdvalue;
            //    theCmd.Parameters.AddWithValue(cmdpara,cmdvalue);//.Value = cmdvalue;
            //    i = i + 3;
            //}
            for (int i = 1; i <= paramaters.Count;)
            {
                theCmd.Parameters.Add((SqlParameter)paramaters[i]);
               
                i++;
            }
            theCmd.CommandType = CommandType.StoredProcedure;
            theCmd.CommandTimeout = DataMgr.CommandTimeOut(); 
            string theSubstring = commandText.Substring(0, 6).ToUpper();
            switch (theSubstring)
            {
                case "SELECT":
                    theCmd.CommandType = CommandType.Text;
                    break;
                case "UPDATE":
                    theCmd.CommandType = CommandType.Text;
                    break;
                case "INSERT":
                    theCmd.CommandType = CommandType.Text;
                    break;
                case "DELETE":
                    theCmd.CommandType = CommandType.Text;
                    break;
                case "TRUNCA":
                    theCmd.CommandType = CommandType.Text;
                    break;
                case ";WITH ":
                    theCmd.CommandType = CommandType.Text;
                    break;
            }
 
            theCmd.Connection = cnn;
            try
            {
                if (Obj == ClsUtility.ObjectEnum.DataSet)
                {
                    
                    SqlDataAdapter theAdpt = new SqlDataAdapter(theCmd);
                    DataSet theDS = new DataSet();
                    theAdpt.Fill(theDS);
                    theAdpt.Dispose();
                    return theDS;
                }

                if (Obj == ClsUtility.ObjectEnum.DataTable)
                {
                    SqlDataAdapter theAdpt = new SqlDataAdapter(theCmd);
                    DataTable theDT = new DataTable(); 
                    theAdpt.Fill(theDT);
                    theAdpt.Dispose();
                    return theDT;
                }

                if (Obj == ClsUtility.ObjectEnum.DataRow)
                {
                    SqlDataAdapter theAdpt = new SqlDataAdapter(theCmd);
                    DataTable theDT = new DataTable();
                    theAdpt.Fill(theDT);
                    theAdpt.Dispose();
                    return theDT.Rows[0];
                }


                if (Obj == ClsUtility.ObjectEnum.ExecuteNonQuery)
                {
                    int NoRowsAffected = theCmd.ExecuteNonQuery();
                    return NoRowsAffected;
                }
                return 0;
            }
            catch(Exception err)
            {
                

               throw err;
            }
            finally
            {

                if (null != cnn)
                    if (null == this.Connection)
                        DataMgr.ReleaseConnection(cnn);
            }

        }
        #endregion

        #region IDisposable Support
        //private bool disposedValue = false; // To detect redundant calls

        //protected virtual void Dispose(bool disposing)
        //{
        //    if (!disposedValue)
        //    {
        //        if (disposing)
        //        {
        //            // TODO: dispose managed state (managed objects).
        //        }

        //        // TODO: free unmanaged resources (unmanaged objects) and override a finalizer below.
        //        // TODO: set large fields to null.

        //        disposedValue = true;
        //    }
        //}

        //// TODO: override a finalizer only if Dispose(bool disposing) above has code to free unmanaged resources.
        //// ~ClsObject() {
        ////   // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
        ////   Dispose(false);
        //// }

        //// This code added to correctly implement the disposable pattern.
        //public void Dispose()
        //{
        //    // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
        //    Dispose(true);
        //    // TODO: uncomment the following line if the finalizer is overridden above.
        //    // GC.SuppressFinalize(this);
        //}
        #endregion

        //public string ConnectionsString(ConnectionMode mode)
        //{
        //  return  DataMgr.GetConnectionString(mode);
        //}
    }
}
