using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppStudio.Data;

namespace channel_connect.Data
{
    //public class PartnerEmployeeMaster : BindableSchemaBase, IEquatable<PartnerEmployeeMaster>, ISyncItem<PartnerEmployeeMaster>
    //{
    //    private int _id;
    //    private int _partnerId;
    //    private bool _isAdmin ;
    //    private string _employeeName;
    //    private string _userId;


    //    public override string DefaultContent
    //    {
    //        get { throw new NotImplementedException(); }
    //    }

    //    public override string DefaultImageUrl
    //    {
    //        get { throw new NotImplementedException(); }
    //    }

    //    public override string DefaultSummary
    //    {
    //        get { throw new NotImplementedException(); }
    //    }

    //    public override string DefaultTitle
    //    {
    //        get { throw new NotImplementedException(); }
    //    }

    //    public int Id
    //    {
    //        get { return _id; }
    //        set { _id = value; }
    //    }

    //    public int PartnerId
    //    {
    //        get { return _partnerId; }
    //        set { _partnerId = value; }
    //    }

    //    public bool IsAdmin
    //    {
    //        get { return _isAdmin; }
    //        set { _isAdmin = value; }
    //    }

    //    public string EmployeeName
    //    {
    //        get { return _employeeName; }
    //        set { _employeeName = value; }
    //    }

    //    public string UserId
    //    {
    //        get { return _userId; }
    //        set { _userId = value; }
    //    }

    //    public override string GetValue(string propertyName)
    //    {
    //        throw new NotImplementedException();
    //    }

    //    public bool Equals(PartnerEmployeeMaster other)
    //    {
    //        throw new NotImplementedException();
    //    }

    //    public void Sync(PartnerEmployeeMaster other)
    //    {
    //        throw new NotImplementedException();
    //    }

    //    public bool NeedSync(PartnerEmployeeMaster other)
    //    {
    //        throw new NotImplementedException();
    //    }
    //}

    public class PartnerEmployeeMaster// : BindableSchemaBase, IEquatable<CustomerMaster>, ISyncItem<CustomerMaster>
    {
        private int _id;
        private string _name;
        private string _role;
        private string _subsidiary;
        private string _user;

        //[JsonProperty("_id")]
        //public string Id { get; set; }

        public int Id { get; set; }

        public string PartnerId { get; set; }

        public string EmployeeName { get; set; }

        public string IsAdmin { get; set; }

        public string UserId { get; set; }
    }
}
