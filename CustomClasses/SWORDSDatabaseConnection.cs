using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CapstoneWebPage
{
    /// <summary>
    /// This class is used to simulate a connection with the SWORDS database, all data returned from this class and its methods is dummy data. 
    /// In an implmentation of this system, this class would be replaced with either a call to SWORD's API or a database query against the SWORDS database.
    /// </summary>
    public class SWORDSDatabaseConnection
    {
        public enum idTypes
        {
            STAFF, STUDENT
        }
        idTypes idType;

        private long id;
        private string firstName;
        private string lastName;
        private string fullName;
        private string email;
        private string phoneNumber;


        public SWORDSDatabaseConnection(long IDNum)
        {
            long[] testStaffIds = new long[] { 9830078233, 9830000000 };
            long[] testStudentIds = new long[] { 983111111, 9831111222 };
            if (testStaffIds.Contains(IDNum))
            {
                idType = idTypes.STAFF;
            }
            else if (testStudentIds.Contains(IDNum))
            {
                idType = idTypes.STUDENT;
            }
            else
            {
                throw new ArgumentException("ID does not belong to student or staff");
            }
            this.id = IDNum;
            this.firstName = Faker.Name.First();
            this.lastName = Faker.Name.Last();
            this.FullName = firstName + " " + lastName;
            this.email = lastName + firstName + "@mga.edu";
            this.phoneNumber = Faker.Phone.Number();
        }

        public idTypes IDType {
            get { return idType; }
            
        }
        public string FullName
        {
            get { return firstName + " " + lastName; }
            set { fullName = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string PhoneNumber
        {
            get { return PhoneNumber; }
            set { phoneNumber = value; }
        }
        public long Id
        {
            get { return id; }
            set { id = value; }
        }

        override public string ToString()
        {
            return $"Name: {FullName} Email: {email} Phone Number: {PhoneNumber} ID: {id} IDType: {idType}";
        }

    }
}
