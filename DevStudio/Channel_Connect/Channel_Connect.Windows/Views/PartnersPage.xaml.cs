using System;
using System.Net.NetworkInformation;

using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Navigation;

using channel_connect.Services;
using channel_connect.ViewModels;

namespace channel_connect.Views
{
    public sealed partial class PartnersPage : Page
    {
        private NavigationHelper _navigationHelper;

        public PartnersPage()
        {
            this.InitializeComponent();
            _navigationHelper = new NavigationHelper(this);

            PartnersModel = new PartnersViewModel();
            DataContext = this;

            SizeChanged += OnSizeChanged;
        }

        public PartnersViewModel PartnersModel { get; private set; }

        public NavigationHelper NavigationHelper
        {
            get { return _navigationHelper; }
        }

        private void OnSizeChanged(object sender, SizeChangedEventArgs e)
        {
            if (e.NewSize.Width < 500)
            {
                VisualStateManager.GoToState(this, "SnappedView", true);
            }
            else
            {
                VisualStateManager.GoToState(this, "FullscreenView", true);
            }
        }

        protected override async void OnNavigatedTo(NavigationEventArgs e)
        {
            _navigationHelper.OnNavigatedTo(e);
            await PartnersModel.LoadItemsAsync();
        }

        protected override void OnNavigatedFrom(NavigationEventArgs e)
        {
            _navigationHelper.OnNavigatedFrom(e);
        }
    }
}
