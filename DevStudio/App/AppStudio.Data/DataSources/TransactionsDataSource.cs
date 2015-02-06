using System;
using System.Windows;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace AppStudio.Data
{
    public class TransactionsDataSource : DataSourceBase<TransactionsSchema>
    {
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

        public async override Task<IEnumerable<TransactionsSchema>> LoadDataAsync()
        {
            try
            {
                var serviceDataProvider = new ServiceDataProvider(_appId, _dataSourceName);
                return await serviceDataProvider.Load<TransactionsSchema>();
            }
            catch (Exception ex)
            {
                AppLogs.WriteError("TransactionsDataSource.LoadData", ex.ToString());
                return new TransactionsSchema[0];
            }
        }
    }
}
