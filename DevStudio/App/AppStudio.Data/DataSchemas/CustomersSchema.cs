using System;
using System.Collections;
using AppStudio.Data;
using Newtonsoft.Json;

namespace channel_connect.Data
{
    /// <summary>
    /// Implementation of the CustomersSchema class.
    /// </summary>
    public class CustomersSchema : BindableSchemaBase, IEquatable<CustomersSchema>, ISyncItem<CustomersSchema>
    {
        private string _customerNames;
        [JsonProperty("_id")]
        public string Id { get; set; }

 
        public string CustomerNames
        {
            get { return _customerNames; }
            set { SetProperty(ref _customerNames, value); }
        }

        public override string DefaultTitle
        {
            get { return CustomerNames; }
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
                    case "customernames":
                        return String.Format("{0}", CustomerNames); 
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

        public bool Equals(CustomersSchema other)
        {
            if (ReferenceEquals(this, other)) return true;
            if (ReferenceEquals(null, other)) return false;
            return this.Id == other.Id;
        }

        public bool NeedSync(CustomersSchema other)
        {

            return this.Id == other.Id && (this.CustomerNames != other.CustomerNames);
        }

        public void Sync(CustomersSchema other)
        {
            this.CustomerNames = other.CustomerNames;
        }

        public override bool Equals(object obj)
        {
            return Equals(obj as CustomersSchema);
        }

        public override int GetHashCode()
        {
            return this.Id.GetHashCode();
        }
    }
}
