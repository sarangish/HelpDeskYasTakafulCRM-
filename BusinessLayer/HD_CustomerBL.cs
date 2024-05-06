using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessEntityLayer;
using DataAccessLayer;
using Microsoft.VisualBasic;

namespace BusinessLayer
{
    public class HD_CustomerBL
    {
        HD_DataAccessLayer objDAL = new HD_DataAccessLayer();

        #region INSERT UPDATE DELETE USER 

        #region INSERT UPDATE DELETE CASE

        public DataTable InsertCustomer(HD_CustomerBEL objCustBEL)
        {
            DataTable Dt = new DataTable();
            try
            {
                
                string sSqL = "EXEC HD_InsUpdCustomer1 'I','" + objCustBEL.CustTitle + "','" + objCustBEL.custfirstname + "','" + objCustBEL.custmiddlename + "','" + objCustBEL.custlastname + "','" + objCustBEL.custemail + "',''," +
                    "'" + objCustBEL.custemirate + "','" + objCustBEL.custmobilenumber + "','" + objCustBEL.custofficenumber + "','" + objCustBEL.custnotes + "','" + objCustBEL.custnationality + "','" + objCustBEL.custcompany + "'" +
                    ",'','','" + objCustBEL.custcreatedby + "','','" + objCustBEL.custproductcategory + "' ";

                objDAL.tolog("insert : "+ sSqL, "T_");

                Dt = objDAL.ExecuteAndGetDataTable(sSqL);
            }
            catch (Exception ex) 
            {
                objDAL.tolog(" SearchCustomer:" + ex.Message, "E_");
            }
            return Dt;
        }

        public DataTable UpdateCustomer(HD_CustomerBEL objCustBEL)
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSqL = "EXEC HD_InsUpdCustomer1 'U','" + objCustBEL.CustTitle + "','" + objCustBEL.custfirstname + "','" + objCustBEL.custmiddlename + "','" + objCustBEL.custlastname + "','" + objCustBEL.custemail + "','','" + objCustBEL.custemirate + "','" + objCustBEL.custmobilenumber + "','" + objCustBEL.custofficenumber + "','" + objCustBEL.custnotes
                    + "','" + objCustBEL.custnationality + "','" + objCustBEL.custcompany + "','" + objCustBEL.custstatus + "','','" + objCustBEL.custcreatedby + "','" + objCustBEL.custupdatedby + "','" + objCustBEL.custproductcategory + "','','','" + objCustBEL.CustomerId + "'";

                

                Dt = objDAL.ExecuteAndGetDataTable(sSqL);
            }
            catch (Exception ex)
            {
                objDAL.tolog(" UpdateCustomer:" + ex.Message, "E_");
            }
            return Dt;
        }

        public DataTable InsertCustremarks(HD_CustomerBEL hD_CustomerBEL)
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_Get_Add_Remarks 'I','" + hD_CustomerBEL.custmobilenumber + "','','" + hD_CustomerBEL.CustomerId + "','"+ hD_CustomerBEL.custremarks + "','" + hD_CustomerBEL.custcreatedby + "'";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" InsertCustremarks:" + ex.Message, "E_");
            }
            return Dt;
        }

        public DataTable GetVCCDetails(string contactID)
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_GET_VCCDETAILS '" + contactID + "'";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" GetVCCDetails:" + ex.Message, "E_");
            }
            return Dt;
        }



        #endregion


        #endregion



        #region VIEW DATA

        public DataTable GetCustomerDetails(HD_CustomerBEL hD_CustomerBEL)
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_Get_Customer1 '" + hD_CustomerBEL.custfirstname+"','"+hD_CustomerBEL.custemail+"','"+hD_CustomerBEL.custmobilenumber+"'";
                objDAL.tolog(" HD_SP_Get_Customer1:" + sSql, "T_");
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" GetCustomerDetails:" + ex.Message, "E_");
            }
            return Dt;
        }

        public DataTable GetCustomerName()
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_Get_CustomerName";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" GetCustomerName:" + ex.Message, "E_");
            }
            return Dt;
        }

        public DataTable GetCustomerDetailsBYId(HD_CustomerBEL hD_CustomerBEL)
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_Get_CustomerById '" + hD_CustomerBEL.CustomerId + "'";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" GetCustomerDetailsBYId:" + ex.Message, "E_");
            }
            return Dt;
        }

        public DataTable GetCustomerRemarks(HD_CustomerBEL hD_CustomerBEL)
        {
            DataTable Dt = new DataTable();
            try
            {
                string sSql = "EXEC HD_SP_Get_Add_Remarks 'S','','','" + hD_CustomerBEL.CustomerId + "','',''";
                Dt = objDAL.ExecuteAndGetDataTable(sSql);
            }
            catch (Exception ex) {
                objDAL.tolog(" GetCustomerRemarks:" + ex.Message, "E_");
            }
            return Dt;
        }





        #endregion

        #region DUPLICATE

        public bool CheckCustomerDuplicate(Int64 PUserID, string PUserName)
        {
            bool FnRval = true;
            try
            {
                string sSQL = "";
                if (Conversion.Val(PUserID) > 0) { sSQL = "SELECT TOP 1 UserId FROM NW_Users WITH(NOLOCK) WHERE UserId<>" + Conversion.Val(PUserID) + " AND UserName='" + PUserName.Replace("'", "''").Trim() + "'"; }
                else { sSQL = "SELECT TOP 1 UserId FROM NW_Users WITH(NOLOCK) WHERE UserName='" + PUserName.Replace("'", "''").Trim() + "'"; }
                DataTable Dt = objDAL.ExecuteAndGetDataTable(sSQL);
                if (Dt.Rows.Count == 0) { FnRval = false; }

            }
            catch (Exception ex) { FnRval = true; Console.WriteLine(ex.ToString()); }
            return FnRval;
        }

        #endregion
    }
}
