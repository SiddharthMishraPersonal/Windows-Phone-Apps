using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Data;

namespace channel_connect.Converters
{
    public class InvertBooleanToVisibilityConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, string language)
        {
            var exists = true;
            if (value != null)
            {
                Boolean.TryParse(value.ToString(), out exists);
                if (exists)
                    return Visibility.Collapsed;
            }

            return Visibility.Visible;

        }

        public object ConvertBack(object value, Type targetType, object parameter, string language)
        {
            return Visibility.Collapsed;
        }
    }
}
