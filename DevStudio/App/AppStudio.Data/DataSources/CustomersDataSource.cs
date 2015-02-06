using System;
using System.Windows;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace AppStudio.Data
{
    public class CustomersDataSource : DataSourceBase<CustomersSchema>
    {
        private const string _appId = "0371a008-9a6c-4f3f-b3d5-3e818dcd181e";
        private const string _dataSourceName = "8414102b-b600-4dbc-9b8e-b507f942cbd8";

        protected override string CacheKey
        {
            get { return "CustomersDataSource"; }
        }

        public override bool HasStaticData
        {
            get { return false; }
        }

        public async override Task<IEnumerable<CustomersSchema>> LoadDataAsync()
        {
            try
            {
                var serviceDataProvider = new ServiceDataProvider(_appId, _dataSourceName);
                return await serviceDataProvider.Load<CustomersSchema>();
            }
            catch (Exception ex)
            {
                AppLogs.WriteError("CustomersDataSource.LoadData", ex.ToString());
                return new CustomersSchema[0];
            }
        }
    }
}
