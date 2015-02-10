using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppStudio.Data;

namespace channel_connect.Data.DataSchemas
{
   public class ProductMaster : BindableSchemaBase, IEquatable<PartnerTransactions>, ISyncItem<PartnerTransactions>
   {
       private int _id;
       private string _name;
       private int _unitCost;

        public override string DefaultContent
        {
            get { throw new NotImplementedException(); }
        }

        public override string DefaultImageUrl
        {
            get { throw new NotImplementedException(); }
        }

        public override string DefaultSummary
        {
            get { throw new NotImplementedException(); }
        }

        public override string DefaultTitle
        {
            get { throw new NotImplementedException(); }
        }

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

       public int UnitCost
       {
           get { return _unitCost; }
           set { _unitCost = value; }
       }

       public override string GetValue(string propertyName)
        {
            throw new NotImplementedException();
        }

        public bool Equals(PartnerTransactions other)
        {
            throw new NotImplementedException();
        }

        public void Sync(PartnerTransactions other)
        {
            throw new NotImplementedException();
        }

        public bool NeedSync(PartnerTransactions other)
        {
            throw new NotImplementedException();
        }
    }
}
