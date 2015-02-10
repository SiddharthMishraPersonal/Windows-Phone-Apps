using System;
using System.Windows;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace channel_connect.Data
{
    public class PartnersDataSource : DataSourceBase<PartnersSchema>
    {
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

        public async override Task<IEnumerable<PartnersSchema>> LoadDataAsync()
        {
            try
            {
                var serviceDataProvider = new ServiceDataProvider(_appId, _dataSourceName);
                return await serviceDataProvider.Load<PartnersSchema>();
            }
            catch (Exception ex)
            {
                AppLogs.WriteError("PartnersDataSource.LoadData", ex.ToString());
                return new PartnersSchema[0];
            }
        }
    }
}
