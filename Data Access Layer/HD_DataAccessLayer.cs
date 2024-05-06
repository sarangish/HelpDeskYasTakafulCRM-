using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace DataAccessLayer
{
    public class HD_DataAccessLayer
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        public DataTable ExecuteAndGetDataTable(string strCmdText)
        {
            DataTable Dt = null; SqlDataAdapter Da = null;
            try
            {
                using (SqlConnection conHRMS = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString))
                {
                    conHRMS.Open();
                    cmd = new SqlCommand(strCmdText, conHRMS);
                    cmd.CommandType = CommandType.Text;
                    Dt = new DataTable();
                    Da = new SqlDataAdapter(cmd);
                    Da.Fill(Dt);
                    Da.Dispose();
                }
            }
            catch (Exception ex)
            {
                string path = System.Web.HttpContext.Current.Server.MapPath("~/ErrorLog/ErrorLog.txt");
                using (StreamWriter writer = new StreamWriter(path, true))
                {
                    writer.WriteLine(ex.Message);
                    writer.Close();
                }
            }
            /*{ obj.LogEvent("ExecuteAndGetDataTableHRMS:=" + ex.Message, "E", 1); }*/
            return Dt;
        }
        public int UpdateData(string strCmdText)
        {
            DataTable Dt = null; SqlDataAdapter Da = null;
            try
            {
                using (SqlConnection conHRMS = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString))
                {
                    conHRMS.Open();
                    cmd = new SqlCommand(strCmdText, conHRMS);
                    return cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
            }
            /*{ obj.LogEvent("ExecuteAndGetDataTableHRMS:=" + ex.Message, "E", 1); }*/
            return 0;
        }

        public void LogExeption (string message)
        {
            string path = System.Web.HttpContext.Current.Server.MapPath("~/ErrorLog/ErrorLog.txt");
            using (StreamWriter writer = new StreamWriter(path, true))
            {
                writer.WriteLine(message);
                writer.Close();
            }
        }

        public void tolog(string p1, string p2)
        {
            try
            {
                string flName = AppDomain.CurrentDomain.BaseDirectory + "//Logs//" + p2 + DateTime.Now.ToString("dd-MM-yyyy") + ".LOG";
                System.IO.File.AppendAllText(flName, DateTime.Now.ToString() + "   ----    " + p1 + Environment.NewLine);
            }
            catch (Exception cx)
            {

            }
        }
    }
}
