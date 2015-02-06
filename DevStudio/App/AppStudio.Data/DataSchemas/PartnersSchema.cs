using System;
using System.Collections;
using Newtonsoft.Json;

namespace AppStudio.Data
{
    /// <summary>
    /// Implementation of the PartnersSchema class.
    /// </summary>
    public class PartnersSchema : BindableSchemaBase, IEquatable<PartnersSchema>, ISyncItem<PartnersSchema>
    {
        private string _partnerNames;
        [JsonProperty("_id")]
        public string Id { get; set; }

 
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

        public bool Equals(PartnersSchema other)
        {
            if (ReferenceEquals(this, other)) return true;
            if (ReferenceEquals(null, other)) return false;
            return this.Id == other.Id;
        }

        public bool NeedSync(PartnersSchema other)
        {

            return this.Id == other.Id && (this.PartnerNames != other.PartnerNames);
        }

        public void Sync(PartnersSchema other)
        {
            this.PartnerNames = other.PartnerNames;
        }

        public override bool Equals(object obj)
        {
            return Equals(obj as PartnersSchema);
        }

        public override int GetHashCode()
        {
            return this.Id.GetHashCode();
        }
    }
}
