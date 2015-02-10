using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PhoneTestApp.Model
{
    public class PartnerMaster
    {
        private int _id;
        private string _name;
        private string _bankName;
        private string _routingNumber;
        private string _bankAccountNumber;
        private int _partnerAccountManager;


        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        public string BankName
        {
            get { return _bankName; }
            set { _bankName = value; }
        }

        public string RoutingNumber
        {
            get { return _routingNumber; }
            set { _routingNumber = value; }
        }

        public string BankAccountNumber
        {
            get { return _bankAccountNumber; }
            set { _bankAccountNumber = value; }
        }

        public int PartnerAccountManager
        {
            get { return _partnerAccountManager; }
            set { _partnerAccountManager = value; }
        }
    }
}
