using HospitalApp4ISP9_14.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HospitalApp4ISP9_14.ClassHelper
{
    public class DBHelper
    {
        public static Entities Context { get; } = new Entities();
    }
}
