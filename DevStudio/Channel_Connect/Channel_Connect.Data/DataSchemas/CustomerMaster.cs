using System;
using System.Collections;
using AppStudio.Data;
using Newtonsoft.Json;

namespace channel_connect.Data
{
    /// <summary>
    /// Implementation of the CustomersSchema class.
    /// </summary>
    public class CustomerMaster : BindableSchemaBase, IEquatable<CustomerMaster>, ISyncItem<CustomerMaster>
    {
        private int _id;
        private string _name;
        //[JsonProperty("_id")]
        //public string Id { get; set; }

 
        public override string DefaultTitle
        {
            get { return Name; }
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

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        override public string GetValue(string fieldName)
        {
            if (!String.IsNullOrEmpty(fieldName))
            {
                switch (fieldName.ToLowerInvariant())
                {
                    case "customernames":
                        return String.Format("{0}", Name); 
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

        public bool Equals(CustomerMaster other)
        {
            if (ReferenceEquals(this, other)) return true;
            if (ReferenceEquals(null, other)) return false;
            return this.Id == other.Id;
        }

        public bool NeedSync(CustomerMaster other)
        {

            return this.Id == other.Id && (this.Name != other.Name);
        }

        public void Sync(CustomerMaster other)
        {
            this.Name = other.Name;
        }

        public override bool Equals(object obj)
        {
            return Equals(obj as CustomerMaster);
        }

        public override int GetHashCode()
        {
            return this.Id.GetHashCode();
        }
    }
}
