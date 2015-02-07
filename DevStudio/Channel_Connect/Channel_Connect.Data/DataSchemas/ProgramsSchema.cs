using System;
using System.Collections;
using AppStudio.Data;
using Newtonsoft.Json;

namespace channel_connect.Data
{
    /// <summary>
    /// Implementation of the ProgramsSchema class.
    /// </summary>
    public class ProgramsSchema : BindableSchemaBase, IEquatable<ProgramsSchema>, ISyncItem<ProgramsSchema>
    {
        private string _names;
        [JsonProperty("_id")]
        public string Id { get; set; }

 
        public string Names
        {
            get { return _names; }
            set { SetProperty(ref _names, value); }
        }

        public override string DefaultTitle
        {
            get { return Names; }
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
                    case "names":
                        return String.Format("{0}", Names); 
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

        public bool Equals(ProgramsSchema other)
        {
            if (ReferenceEquals(this, other)) return true;
            if (ReferenceEquals(null, other)) return false;
            return this.Id == other.Id;
        }

        public bool NeedSync(ProgramsSchema other)
        {

            return this.Id == other.Id && (this.Names != other.Names);
        }

        public void Sync(ProgramsSchema other)
        {
            this.Names = other.Names;
        }

        public override bool Equals(object obj)
        {
            return Equals(obj as ProgramsSchema);
        }

        public override int GetHashCode()
        {
            return this.Id.GetHashCode();
        }
    }
}
