using System;
using System.Collections;
using AppStudio.Data;
using Newtonsoft.Json;

namespace channel_connect.Data
{
    /// <summary>
    /// Implementation of the ProgramsSchema class.
    /// </summary>
    public class ProgramMaster : BindableSchemaBase, IEquatable<ProgramMaster>, ISyncItem<ProgramMaster>
    {
        private int _id;
        private string _name;
        private int _competencyIDRequired;
        //[JsonProperty("_id")]
        //public string Id { get; set; }

 
        public string Name
        {
            get { return _name; }
            set { SetProperty(ref _name, value); }
        }

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

        public int CompetencyIdRequired
        {
            get { return _competencyIDRequired; }
            set { _competencyIDRequired = value; }
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
                    case "names":
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

        public bool Equals(ProgramMaster other)
        {
            if (ReferenceEquals(this, other)) return true;
            if (ReferenceEquals(null, other)) return false;
            return this.Id == other.Id;
        }

        public bool NeedSync(ProgramMaster other)
        {

            return this.Id == other.Id && (this.Name != other.Name);
        }

        public void Sync(ProgramMaster other)
        {
            this.Name = other.Name;
        }

        public override bool Equals(object obj)
        {
            return Equals(obj as ProgramMaster);
        }

        public override int GetHashCode()
        {
            return this.Id.GetHashCode();
        }
    }
}
