using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CapstoneWebPage
{
    /// <summary>
    /// This class is used to simulate a connection with the SWORDS database. 
    /// In an implmentation of this system, this class would be replaced with either a call to SWORD's API or a database query against the SWORDS database.
    /// </summary>
    public static class SWORDSDatabase
    {

        public enum IdType { STUDENT, STAFF, NONE };


        public static IdType LookupID(long IDNum)
        {
            long[] testStaffIds = new long[] { 9830078233, 9830000000 };
            long[] testStudentIds = new long[] { 983111111, 9831111222 };

            if (testStaffIds.Contains(IDNum))
            {
                return IdType.STAFF;
            }
            else if (testStudentIds.Contains(IDNum))
            {
                return IdType.STUDENT;
            }
            else
            {
                return IdType.NONE;
            }
        }
    }


}
