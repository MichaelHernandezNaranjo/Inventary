using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Entities
{
    public class branch : BaseEntity
    {
        public int branchId { get; set; }
        public string name { get; set; }
        public int cityId { get; set; }
        public string cityName { get; set; }
        public string address { get; set; }
        public string email { get; set; }
        public string phone1 { get; set; }
        public string phone2 { get; set; }
        public DateTime createDate { get; set; }
        public bool active { get; set; }
    }
    public class branchRequest : BaseEntity
    {
        public int branchId { get; set; }
        public string name { get; set; }
        public int cityId { get; set; }
        public string address { get; set; }
        public string email { get; set; }
        public string phone1 { get; set; }
        public string phone2 { get; set; }
        public bool active { get; set; }
    }
}
