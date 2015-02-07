using System;
using System.Collections;
using AppStudio.Data;
using Newtonsoft.Json;

namespace channel_connect.Data
{
    /// <summary>
    /// Implementation of the TransactionsSchema class.
    /// </summary>
    public class TransactionsSchema : BindableSchemaBase, IEquatable<TransactionsSchema>, ISyncItem<TransactionsSchema>
    {
        private string _customerName;
        private string _product;
        private string _salesPrice;
        private string _partner;
        [JsonProperty("_id")]
        public string Id { get; set; }

 
        public string CustomerName
        {
            get { return _customerName; }
            set { SetProperty(ref _customerName, value); }
        }
 
        public string Product
        {
            get { return _product; }
            set { SetProperty(ref _product, value); }
        }
 
        public string SalesPrice
        {
            get { return _salesPrice; }
            set { SetProperty(ref _salesPrice, value); }
        }
 
        public string Partner
        {
            get { return _partner; }
            set { SetProperty(ref _partner, value); }
        }

        public override string DefaultTitle
        {
            get { return CustomerName; }
        }

        public override string DefaultSummary
        {
            get { return Product; }
        }

        public override string DefaultImageUrl
        {
            get { return null; }
        }

        public override string DefaultContent
        {
            get { return Product; }
        }

        override public string GetValue(string fieldName)
        {
            if (!String.IsNullOrEmpty(fieldName))
            {
                switch (fieldName.ToLowerInvariant())
                {
                    case "customername":
                        return String.Format("{0}", CustomerName); 
                    case "product":
                        return String.Format("{0}", Product); 
                    case "salesprice":
                        return String.Format("{0}", SalesPrice); 
                    case "partner":
                        return String.Format("{0}", Partner); 
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

        public bool Equals(TransactionsSchema other)
        {
            if (ReferenceEquals(this, other)) return true;
            if (ReferenceEquals(null, other)) return false;
            return this.Id == other.Id;
        }

        public bool NeedSync(TransactionsSchema other)
        {

            return this.Id == other.Id && (this.CustomerName != other.CustomerName || this.Product != other.Product || this.SalesPrice != other.SalesPrice || this.Partner != other.Partner);
        }

        public void Sync(TransactionsSchema other)
        {
            this.CustomerName = other.CustomerName;
            this.Product = other.Product;
            this.SalesPrice = other.SalesPrice;
            this.Partner = other.Partner;
        }

        public override bool Equals(object obj)
        {
            return Equals(obj as TransactionsSchema);
        }

        public override int GetHashCode()
        {
            return this.Id.GetHashCode();
        }
    }
}
