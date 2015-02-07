using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace channel_connect.Data
{
    public class MenuDataSource : DataSourceBase<MenuSchema>
    {
        private const string _file = "/Assets/Data/MenuDataSource.json";

        protected override string CacheKey
        {
            get { return "MenuDataSource"; }
        }

        public override bool HasStaticData
        {
            get { return true; }
        }

        public async override Task<IEnumerable<MenuSchema>> LoadDataAsync()
        {
            try
            {
                var serviceDataProvider = new StaticDataProvider(_file);
                return await serviceDataProvider.Load<MenuSchema>();
            }
            catch (Exception ex)
            {
                AppLogs.WriteError("MenuDataSource.LoadData", ex.ToString());
                return new MenuSchema[0];
            }
        }

    }
}
