using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class HD_SolutionsBL
    {
        HD_DataAccessLayer objDAL = new HD_DataAccessLayer();
        public DataTable GetTopSolutions()
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_Get_Top_Solutions";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" GetTopSolutions:" + ex.Message, "E_");
            }
            return Dt;
        }
        public DataTable SearchSolutions(string strText)
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_Search_Solutions '"+strText+"'";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" SearchSolutions:" + ex.Message, "E_");
            }
            return Dt;
        }

        public string solutionDescription(string solutionid)
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_Search_SolutionById '" + solutionid + "'";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
                if( Dt!=null)
                {
                    if (Dt.Rows.Count>0)
                    {
                        return Dt.Rows[0][0].ToString();
                    }
                }
            }
            catch (Exception ex) {
                objDAL.tolog(" solutionDescription:" + ex.Message, "E_");
            }
            return "";
            
        }
    }
}
