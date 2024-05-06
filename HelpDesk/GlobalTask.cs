using System;
using System.Data;
using System.Web.UI.WebControls;

namespace HelpDesk
{
    public class GlobalTask
    {
        public bool FillGrid(GridView gDv, DataTable Dt)
        {
            bool FnRVal = false;
            try
            {
                if (Dt != null)
                {
                    bool FlgEmpty = false;

                    if (Dt.Rows.Count == 0) { Dt.Rows.Add(); FlgEmpty = true; }
                    gDv.DataSource = Dt;
                    gDv.DataBind();

                    if (FlgEmpty)
                    {
                        int columncount = gDv.Rows[0].Cells.Count;
                        gDv.Rows[0].Cells.Clear();
                        gDv.Rows[0].Cells.Add(new TableCell());
                        gDv.Rows[0].Cells[0].ColumnSpan = columncount;
                        gDv.Rows[0].Cells[0].Text = "No Records Found.";
                    }
                    FnRVal = true;
                }
            }
            catch (Exception ex) { throw ex; }
            return FnRVal;
        }
    }
}