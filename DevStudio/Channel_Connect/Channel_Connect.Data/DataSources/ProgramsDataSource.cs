using System;
using System.Windows;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace channel_connect.Data
{
    public class ProgramsDataSource : DataSourceBase<ProgramsSchema>
    {
        private const string _appId = "0371a008-9a6c-4f3f-b3d5-3e818dcd181e";
        private const string _dataSourceName = "d34c0360-976d-486c-923c-94c6a17af026";

        protected override string CacheKey
        {
            get { return "ProgramsDataSource"; }
        }

        public override bool HasStaticData
        {
            get { return false; }
        }

        public async override Task<IEnumerable<ProgramsSchema>> LoadDataAsync()
        {
            try
            {
                var serviceDataProvider = new ServiceDataProvider(_appId, _dataSourceName);
                return await serviceDataProvider.Load<ProgramsSchema>();
            }
            catch (Exception ex)
            {
                AppLogs.WriteError("ProgramsDataSource.LoadData", ex.ToString());
                return new ProgramsSchema[0];
            }
        }
    }
}
