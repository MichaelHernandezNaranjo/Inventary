using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Entities
{
    public class roll: BaseEntity
    {
        public int rollId { get; set; }
        public string name { get; set; }
        public DateTime createDate { get; set; }
        public bool active { get; set; }
    }
    public class rollRequest : BaseEntity
    {
        public int rollId { get; set; }
        public string name { get; set; }
        public bool active { get; set; }
    }

}
