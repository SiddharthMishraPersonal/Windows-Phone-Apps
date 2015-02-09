using System;
using System.Windows;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.WindowsAzure.MobileServices;
using Newtonsoft.Json.Linq;

namespace channel_connect.Data
{
    public class PartnersDataSource : DataSourceBase<PartnerMaster>
    {
        public static Microsoft.WindowsAzure.MobileServices.MobileServiceClient channel_connectClient = new Microsoft.WindowsAzure.MobileServices.MobileServiceClient(
     "https://channel-connect.azure-mobile.net/",
     "mgDihocRysIbjqVRHNOBOpIMSnknlT45");

        //private MobileServiceCollection<PartnerMaster, PartnerMaster> _partners;
        private IMobileServiceTable<PartnerMaster> _partnerList = channel_connectClient.GetTable<PartnerMaster>();


        private const string _appId = "0371a008-9a6c-4f3f-b3d5-3e818dcd181e";
        private const string _dataSourceName = "b93e6766-c006-4ddd-8528-6438dbd885f4";

        protected override string CacheKey
        {
            get { return "PartnersDataSource"; }
        }

        public override bool HasStaticData
        {
            get { return false; }
        }

        public async override Task<IEnumerable<PartnerMaster>> LoadDataAsync()
        {
            try
            {
                JToken partnerList  = null;
                if (StaticDataProvider.isPartner == false)
                {
                    partnerList = await _partnerList.ReadAsync("$filter=(PartnerAccountManagerId eq " + StaticDataProvider.LoggedInId.ToString() + " )");
                }
                List<PartnerMaster> items = new List<PartnerMaster>();

                foreach (var item in partnerList)
                {
                    items.Add(Newtonsoft.Json.JsonConvert.DeserializeObject<PartnerMaster>(item.ToString()));
                }

                return items;

                //var serviceDataProvider = new ServiceDataProvider(_appId, _dataSourceName);
                //return await serviceDataProvider.Load<PartnerMaster>();
            }
            catch (Exception ex)
            {
                AppLogs.WriteError("PartnersDataSource.LoadData", ex.ToString());
                return new PartnerMaster[0];
            }
        }
    }
}
