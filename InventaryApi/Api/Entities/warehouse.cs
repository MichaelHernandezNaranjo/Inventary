using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Entities
{
    public class warehouse : BaseEntity
    {
        public int warehouseId { get; set; }
        public string name { get; set; }
        public int branchId { get; set; }
        public string branchName { get; set; }
        public DateTime createDate { get; set; }
        public bool active { get; set; }
    }
    public class warehouseRequest : BaseEntity
    {
        public int warehouseId { get; set; }
        public string name { get; set; }
        public int branchId { get; set; }
        public bool active { get; set; }
    }
}
