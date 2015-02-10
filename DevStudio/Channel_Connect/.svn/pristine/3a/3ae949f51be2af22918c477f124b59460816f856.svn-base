using System;
using System.Collections;
using AppStudio.Data;
using Newtonsoft.Json;

namespace channel_connect.Data
{
    /// <summary>
    /// Implementation of the PartnersSchema class.
    /// </summary>
    public class PartnerMaster : BindableSchemaBase, IEquatable<PartnerMaster>, ISyncItem<PartnerMaster>
    {

        private string _partnerNames;
        //[JsonProperty("_id")]
        //public string Id { get; set; }


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


        public string PartnerNames
        {
            get { return _partnerNames; }
            set { SetProperty(ref _partnerNames, value); }
        }

        public override string DefaultTitle
        {
            get { return PartnerNames; }
        }

        public override string DefaultSummary
        {
            get { return null; }
        }

        public override string DefaultImageUrl
        {
            get { return null; }
        }

        public override string DefaultContent
        {
            get { return null; }
        }

        override public string GetValue(string fieldName)
        {
            if (!String.IsNullOrEmpty(fieldName))
            {
                switch (fieldName.ToLowerInvariant())
                {
                    case "partnernames":
                        return String.Format("{0}", PartnerNames);
                    case "defaulttitle":
                        return DefaultTitle;
                    case "defaultsummary":
                        return DefaultSummary;
                    case "defaultimageurl":
                        return DefaultImageUrl;
                    default:
                        break;
                }
            }
            return String.Empty;
        }

        public bool Equals(PartnerMaster other)
        {
            if (ReferenceEquals(this, other)) return true;
            if (ReferenceEquals(null, other)) return false;
            return this.Id == other.Id;
        }

        public bool NeedSync(PartnerMaster other)
        {

            return this.Id == other.Id && (this.PartnerNames != other.PartnerNames);
        }

        public void Sync(PartnerMaster other)
        {
            this.PartnerNames = other.PartnerNames;
        }

        public override bool Equals(object obj)
        {
            return Equals(obj as PartnerMaster);
        }

        public override int GetHashCode()
        {
            return this.Id.GetHashCode();
        }
    }
}
