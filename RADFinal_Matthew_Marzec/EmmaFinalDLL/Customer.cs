using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmmaFinalDLL
{
    public class Customer
    {
        private int ID { get; }
        private string custFisrt { get; set; }
        private string custLast { get; set; }
        private string custPhone { get; set; }
        private string custAddress { get; set; }
        private string custCity { get; set; }
        private string custPostal { get; set; }
        private string custEmail { get; set; }


        public Customer(string custFisrt, string custLast, string custPhone, string custAddress, string custCity, string custPostal, string custEmail)
        {
            this.CustFisrt = custFisrt;
            this.CustLast = custLast;
            this.CustPhone = custPhone;
            this.CustAddress = custAddress;
            this.CustCity = custCity;
            this.CustPostal = custPostal;
            this.CustEmail = custEmail;
        }
 
        public string CustFisrt
        {
            get { return this.custFisrt; }
            set
            {
                if (value.Length > 0 || value.Length <= 30)
                {
                    this.custFisrt = value;
                }
            }
        }
        public string CustLast
        {
            get { return this.custLast; }
            set
            {
                if (value.Length > 0 || value.Length <= 50)
                {
                    this.custLast = value;
                }
            }
        }
        public string CustPhone
        {
            get { return this.custPhone; }
            set
            {
                if (value.Length > 0 || value.Length <= 10)
                {
                    this.custPhone = value;
                }
            }
        }
        public string CustAddress
        {
            get { return this.custAddress; }
            set
            {
                if (value.Length > 0 || value.Length <= 60)
                {
                    this.custAddress = value;
                }
            }
        }
        public string CustCity
        {
            get { return this.custCity; }
            set
            {
                if (value.Length > 0 || value.Length <= 50)
                {
                    this.custCity = value;
                }
            }
        }
        public string CustPostal
        {
            get { return this.custPostal; }
            set
            {
                if (value.Length == 6)
                {
                    this.custPostal = value;
                }
            }
        }
        public string CustEmail
        {
            get { return this.custEmail; }
            set
            {
                if (value.Length > 0 || value.Length <= 50)
                {
                    this.custEmail = value;
                }
            }
        }

        public void AddCustomer(out string status)
        {
            status = "";
            SqlCommand cmdCustomer = new SqlCommand("INSERT INTO Customer (custFirst,custLast,custPhone,custAddress,custCity,custPostal,custEmail) " +
                "VALUES(@custFirst, @custLast, @custPhone, @custAddress, @custCity, @custPostal, @custEmail)", DBConnect.con);
            cmdCustomer.Connection = DBConnect.con;
            try
            {
                cmdCustomer.Parameters.AddWithValue("@custFirst", SqlDbType.VarChar).Value = custFisrt;
                cmdCustomer.Parameters.AddWithValue("@custLast", SqlDbType.VarChar).Value = custLast;
                cmdCustomer.Parameters.AddWithValue("@custPhone", SqlDbType.Char).Value = custPhone;
                cmdCustomer.Parameters.AddWithValue("@custAddress", SqlDbType.VarChar).Value = custAddress;
                cmdCustomer.Parameters.AddWithValue("@custCity", SqlDbType.VarChar).Value = custCity;
                cmdCustomer.Parameters.AddWithValue("@custPostal", SqlDbType.Char).Value = custPostal;
                cmdCustomer.Parameters.AddWithValue("@custEmail", SqlDbType.VarChar).Value = custEmail;

                DBConnect.con.Open();
                cmdCustomer.ExecuteNonQuery();
                DBConnect.con.Close();
            }
            catch (Exception ex)
            {
                status = ex.Message;
            }
            finally
            {
                if (DBConnect.con.State == System.Data.ConnectionState.Open)
                    DBConnect.con.Close();
            }
        }
    }
}
