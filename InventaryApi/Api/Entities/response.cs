using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Threading.Tasks;

namespace Api.Entities
{
    public class response<T>
    {
        public string status { get; set; }
        public T data { get; set; }
        public string message { get; set; }
    }

    public static class status
    {
        public static string ok = "ok";
        public static string error = "error";
}
}
