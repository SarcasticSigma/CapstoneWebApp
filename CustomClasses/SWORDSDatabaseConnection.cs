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

        private string id;
        private string firstName;
        private string lastName;
        private string fullName;
        private string email;
        private string phoneNumber;
        private string residentialStatus;

        public SWORDSDatabaseConnection(string IDNum)
        {
            if (!IdExists(IDNum))
            {
                throw new ArgumentException("That ID is not in the SWORDS database!");
            }
            this.id = IDNum;
            
            this.firstName = Faker.Name.First();
            this.lastName = Faker.Name.Last();
            this.FullName = firstName + " " + lastName;
            this.email = lastName + firstName + "@mga.edu";
            this.phoneNumber = Faker.Phone.Number();
            if (!IsStaffId(id))
            {
                this.residentialStatus = "Residential";
            }
            else
            {
                this.residentialStatus = "N/A";
            }

        }

        public string ResidentialStatus
        {
            get { return this.residentialStatus; }
            set { this.residentialStatus = value; }
        }


        public string FullName
        {
            get { return this.fullName; }
            set { fullName = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string PhoneNumber
        {
            get { return this.phoneNumber; }
            set { phoneNumber = value; }
        }
        public string Id
        {
            get { return id; }
            set { id = value; }
        }

        public static bool IdExists(string id)
        {
            return id.Substring(0, 3) == "983";
        }

        public static bool IsStaffId(string id)
        {
            return id[id.Length - 1] == '9';
        }
        public static bool IsStudentId(string id)
        {
            return IdExists(id) && !IsStaffId(id);
        }


        override public string ToString()
        {
            return $"Name: {FullName} Email: {email} Phone Number: {PhoneNumber} ID: {id}";
        }

    }
}
