using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using BusinessEntityLayer;
using DataAccessLayer;
using Microsoft.VisualBasic;

namespace BusinessLayer
{
    public class HD_CaseBL
    {
        HD_DataAccessLayer objDAL = new HD_DataAccessLayer();
        #region VIEW DATA
        public DataTable GetCaseDetailsByCustomer(HD_CaseBEL hD_CaseBEL)
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_Get_CaseByCustomer '" + hD_CaseBEL.CaseCustomerId + "'";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" GetCaseDetailsByCustomer:" + ex.Message, "E_");
            }
            return Dt;
        }

        public DataTable GetCaseDetails(HD_CaseBEL hD_CaseBEL)
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_InsUpdcase 'S','','','','" + hD_CaseBEL.CaseStatus + "','','"+hD_CaseBEL.CaseCustomerId+"','','','','','" + hD_CaseBEL.CaseRefNo + "','" + hD_CaseBEL.CaseCreatedDate.ToString("yyyy-MM-dd") + "'";
                //"+ Convert.ToDateTime( hD_CaseBEL.CaseCreatedDate).ToString("yyyy - MM - dd") + "
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" GetCaseDetails:" + ex.Message, "E_");
            }
            return Dt;
        }

        public DataTable GetCaseDetailsBYId(HD_CaseBEL hD_CaseBEL)
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_Get_CaseById '" + hD_CaseBEL.CaseId + "'";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" GetCaseDetailsBYId:" + ex.Message, "E_");
            }
            return Dt;
        }

        public DataTable GetCaseStatus()
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_Get_Case_Status";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" GetCaseStatus:" + ex.Message, "E_");
            }
            return Dt;
        }

        public DataTable GetCaseChannel()
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_Get_Case_Channel";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" GetCaseChannel:" + ex.Message, "E_");
            }
            return Dt;
        }

        public DataTable GetSolution()
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_Get_Solutions";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" GetSolution:" + ex.Message, "E_");
            }
            return Dt;
        }

        public DataTable GetFiles(HD_CaseBEL objCaseBEL)
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSqL = "EXEC HD_SP_InsFiles 'S','" + objCaseBEL.CaseId + "','','',''";
                Dt = objDAL.ExecuteAndGetDataTable(sSqL);
            }
            catch (Exception ex) {
                objDAL.tolog(" GetFiles:" + ex.Message, "E_");
            }
            return Dt;
        }






        #endregion

        #region INSERT UPDATE DELETE CASE

        public DataTable InsertCase(HD_CaseBEL objCaseBEL)
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSqL = "EXEC HD_SP_InsUpdcase 'I','" + objCaseBEL.CaseTitle + "','" + objCaseBEL.CaseDescription + "','" + objCaseBEL.CaseChannel + "','" + objCaseBEL.CaseStatus + "','" + objCaseBEL.CaseCreatedBy + "'," +
                    "'" + objCaseBEL.CaseCustomerId + "','" + objCaseBEL.CaseAssignedTo + "','" + objCaseBEL.CasePriority + "','" + objCaseBEL.CaseDueDate.ToString("yyyy-MM-dd") + "','','',''";
                Dt = objDAL.ExecuteAndGetDataTable(sSqL);
            }
            catch (Exception ex) {
                objDAL.tolog(" Insercasefromcustomersummary:" + ex.Message, "E_");
            }
            return Dt;
        }

        public DataTable InsertFile(HD_CaseBEL objCaseBEL)
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSqL = "EXEC HD_SP_InsFiles 'I','" + objCaseBEL.CaseId + "','" + objCaseBEL.casefilename + "','" + objCaseBEL.casefilecreatedby + "','" + objCaseBEL.casefilesize + "'";
                Dt = objDAL.ExecuteAndGetDataTable(sSqL);
            }
            catch (Exception ex) {
                objDAL.tolog(" InserFileFromCustomerSummary:" + ex.Message, "E_");
            }
            return Dt;
        }

        #endregion

        #region STATUS UPDATION

        public DataTable UpdateCase(HD_CaseBEL objCaseBEL)
        {

            DataTable Dt = new DataTable();
            try
            {
               
                string sSql = "EXEC HD_SP_InsUpdcase 'U','" + objCaseBEL.CaseTitle + "','" + objCaseBEL.CaseDescription + "','" + objCaseBEL.CaseChannel + "','" + objCaseBEL.CaseStatus + "','" + objCaseBEL.CaseCreatedBy + "'," +
                    "'" + objCaseBEL.CaseCustomerId + "','" + objCaseBEL.CaseAssignedTo + "','" + objCaseBEL.CasePriority + "','" + objCaseBEL.CaseDueDate.ToString("yyyy-MM-dd") + "','','"+objCaseBEL.CaseId+"',''";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" UpdateCase:" + ex.Message, "E_");
            }
            return Dt;
        }

        public DataTable UpdateTrackingInprogress(HD_CaseBEL objCaseBEL)
        {

            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_UpdateStatus 'U','" + objCaseBEL.CaseId + "','" + objCaseBEL.casefilecreatedby +"','" + objCaseBEL.CaseStatus + "','','" + objCaseBEL.CaseCreatedBy + "'," +
                    "'" + objCaseBEL.CaseCustomerId + "','" + objCaseBEL.CaseAssignedTo + "','" + objCaseBEL.CasePriority + "','" + objCaseBEL.CaseDueDate + "','','',''";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" UpdateTrackingInprogress:" + ex.Message, "E_");
            }
            return Dt;
        }

        public DataTable UpdateTrackingResolved(HD_CaseBEL objCaseBEL)
        {

            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_UpdateStatus 'U','" + objCaseBEL.CaseId + "','" + objCaseBEL.casefilecreatedby + "','" + objCaseBEL.CaseStatus + "','','" + objCaseBEL.CaseCreatedBy + "'," +
                    "'" + objCaseBEL.CaseCustomerId + "','" + objCaseBEL.CaseAssignedTo + "','" + objCaseBEL.CasePriority + "','" + objCaseBEL.CaseDueDate + "'";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" UpdateTrackingResolved:" + ex.Message, "E_");
            }
            return Dt;
        }
        public DataTable UpdateTrackingNewRequest(HD_CaseBEL objCaseBEL)
        {

            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_UpdateStatus 'U','" + objCaseBEL.CaseId + "','" + objCaseBEL.casefilecreatedby + "','" + objCaseBEL.CaseStatus + "','','" + objCaseBEL.CaseCreatedBy + "'," +
                    "'" + objCaseBEL.CaseCustomerId + "','" + objCaseBEL.CaseAssignedTo + "','" + objCaseBEL.CasePriority + "','" + objCaseBEL.CaseDueDate + "'";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" UpdateTrackingNewRequest:" + ex.Message, "E_");
            }
            return Dt;
        }

        public DataTable UpdateSolution(HD_CaseBEL objCaseBEL)
        {

            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_InsUpdSolution 'AS','" + objCaseBEL.CaseId + "','','" + objCaseBEL.SolutionTopic + "','" + objCaseBEL.SolutionDetails + "','" + objCaseBEL.SolutionCreatedBy + "',''";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" UpdateSolution:" + ex.Message, "E_");
            }
            return Dt;
        }

        public DataTable UpdateCaseSolution(HD_CaseBEL objCaseBEL)
        {

            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_InsUpdSolution 'EM','" + objCaseBEL.CaseId + "','" + objCaseBEL.SolutionID + "','','" + objCaseBEL.SolutionDetails + "','',''";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" UpdateCaseSolution:" + ex.Message, "E_");
            }
            return Dt;
        }

        #endregion

        #region INSERT

        public DataTable AddCase(HD_CaseBEL objCaseBEL)
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_InsUpdte_CaseDetail 'I','" + objCaseBEL.CaseDescription + "'";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" AddCase:" + ex.Message, "E_");
            }
            return Dt;
        }

        #endregion

    }
}
