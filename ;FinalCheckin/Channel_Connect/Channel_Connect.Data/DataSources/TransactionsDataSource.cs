using System;
using System.Windows;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Windows.Web.Http;
using channel_connect.Data.DataSchemas;
using Microsoft.WindowsAzure.MobileServices;

namespace channel_connect.Data
{
    public class TransactionsDataSource : DataSourceBase<getpartnertransactions>
    {
        public static Microsoft.WindowsAzure.MobileServices.MobileServiceClient channel_connectClient = new Microsoft.WindowsAzure.MobileServices.MobileServiceClient(
    "https://channel-connect.azure-mobile.net/",
    "mgDihocRysIbjqVRHNOBOpIMSnknlT45");
        

        private const string _appId = "0371a008-9a6c-4f3f-b3d5-3e818dcd181e";
        private const string _dataSourceName = "6a5df094-7149-4082-a9eb-4d9389b05047";

        protected override string CacheKey
        {
            get { return "TransactionsDataSource"; }
        }

        public override bool HasStaticData
        {
            get { return false; }
        }

        public static PartnerMaster PartnerMaster;

        public async override Task<IEnumerable<getpartnertransactions>> LoadDataAsync()
        {
            try
            {
                Dictionary<string, string> param = new Dictionary<string, string>();
                param.Add("PartnerAccountManagerId", StaticDataProvider.LoggedInId.ToString());
                param.Add("PartnerId", StaticDataProvider.PartnerId.ToString());
                param.Add("TransactionId", StaticDataProvider.TransactionId.ToString());
                var _viewTransaction = await channel_connectClient.InvokeApiAsync<getpartnertransactions[]>("getpartnertransactions", System.Net.Http.HttpMethod.Get, param);
                
                var list = _viewTransaction.AsEnumerable();
                return list;


            }
            catch (Exception ex)
            {
                AppLogs.WriteError("TransactionsDataSource.LoadData", ex.ToString());
                return new getpartnertransactions[0];
            }
        }
      
    }
}
