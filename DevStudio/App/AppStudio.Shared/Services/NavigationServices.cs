using System;
using System.Net;
using channel_connect;
using Windows.System;

using channel_connect.Views;
using channel_connect.ViewModels;

namespace channel_connect.Services
{
    public class NavigationServices
    {
        static public void NavigateToPage(string pageName, object parameter = null)
        {
            try
            {
                string pageTypeName = String.Format("{0}.{1}", typeof(MainPage).Namespace, pageName);
                Type pageType = Type.GetType(pageTypeName);
                App.RootFrame.Navigate(pageType, parameter);
            }
            catch (Exception ex)
            {
                AppLogs.WriteError("NavigationServices.NavigateToPage", ex);
            }
        }

        static public async void NavigateTo(Uri uri)
        {
            try
            {
                await Launcher.LaunchUriAsync(uri);
            }
            catch (Exception ex)
            {
                AppLogs.WriteError("NavigationServices.NavigateTo", ex);
            }
        }
    }
}
