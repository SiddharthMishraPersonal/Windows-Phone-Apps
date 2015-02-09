using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppStudio.Data;

namespace channel_connect.Data
{
    public class DataSourceContent<T> where T : BindableSchemaBase
    {
        public DateTime TimeStamp { get; set; }
        public IEnumerable<T> Items { get; set; }
    }
}
