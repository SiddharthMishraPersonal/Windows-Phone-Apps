using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace channel_connect.Data
{
    public class MenuDataSource : DataSourceBase<MenuSchema>
    {
        private string _file = null;

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
                if (StaticDataProvider.isPartner == false)
                    _file = "/Assets/Data/MenuDataSource.json";
                else
                    _file = "/Assets/Data/PartnerMenuDataSource.json";
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
