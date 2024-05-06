using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using BusinessEntityLayer;
using DataAccessLayer;

namespace BusinessLayer
{
    public class HD_UserBL
    {
        HD_DataAccessLayer objDAL = new HD_DataAccessLayer();
        #region VIEW DATA

        public DataTable GetVCCUserDetails()
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC [dbo].[HD_SP_Users] 'S'";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" GetVCCUserDetails:" + ex.Message, "E_");
            }
            return Dt;
        }
        #endregion
    }
}
