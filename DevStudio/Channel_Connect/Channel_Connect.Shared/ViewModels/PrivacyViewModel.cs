using channel_connect.Data;
using System;
using Windows.ApplicationModel;
using AppStudio.Data;

namespace channel_connect.ViewModels
{
    public class PrivacyViewModel : BindableBase
    {
        public Uri Url
        {
            get
            {
                return new Uri(UrlText, UriKind.RelativeOrAbsolute);
            }
        }
        public string UrlText
        {
            get
            {
                return "";
            }
        }
    }
}

