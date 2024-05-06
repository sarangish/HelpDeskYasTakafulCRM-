using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessEntityLayer
{
    public class HD_CaseBEL
    {
        public long CaseCustomerId { get; set; }
        public string CaseId { get; set; }
        public string CaseStatus { get; set; }
        public DateTime CaseCreatedDate { get; set; }

        public string CaseRefNo { get; set; }
        public string CaseDescription { get; set; }
        public string CaseTitle { get; set; }
        public string CaseChannel { get; set; }
        public string CasePriority { get; set; }
        public string CaseAssignedTo { get; set; }
        public DateTime CaseDueDate { get; set; }
        public string CaseCreatedBy { get; set; }
        public string casefilename { get; set; }
        public string casefileId { get; set; }
        public string casesolution { get; set; }
        public string casefilecreatedby { get; set; }
        public long casefilesize { get; set; }
        public int SolutionID { get; set; }
        public string SolutionTopic { get; set; }
        public string SolutionDetails { get; set; }
        public string SolutionCreatedBy { get; set; }


       
    }
}
