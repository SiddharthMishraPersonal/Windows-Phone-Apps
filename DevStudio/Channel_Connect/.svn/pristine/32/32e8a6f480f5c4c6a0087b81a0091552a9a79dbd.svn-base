using System;
using System.Net.NetworkInformation;

using channel_connect.Services;
using channel_connect.ViewModels;

using Windows.ApplicationModel.DataTransfer;
using Windows.UI.ViewManagement;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Navigation;

namespace channel_connect.Views
{
    public sealed partial class CustomersDetail : Page
    {
        private NavigationHelper _navigationHelper;

        private DataTransferManager _dataTransferManager;

        public CustomersDetail()
        {
            this.InitializeComponent();
            _navigationHelper = new NavigationHelper(this);

            CustomersModel = new CustomersViewModel();

            ApplicationView.GetForCurrentView().
                SetDesiredBoundsMode(ApplicationViewBoundsMode.UseVisible);
        }

        public CustomersViewModel CustomersModel { get; private set; }

        public NavigationHelper NavigationHelper
        {
            get { return _navigationHelper; }
        }

        protected async override void OnNavigatedTo(NavigationEventArgs e)
        {
            _dataTransferManager = DataTransferManager.GetForCurrentView();
            _dataTransferManager.DataRequested += OnDataRequested;

            _navigationHelper.OnNavigatedTo(e);

            if (CustomersModel != null)
            {
                await CustomersModel.LoadItemsAsync();
                if (e.NavigationMode != NavigationMode.Back)
                {
                    CustomersModel.SelectItem(e.Parameter);
                }

                CustomersModel.ViewType = ViewTypes.Detail;
            }
            DataContext = this;
        }

        protected override void OnNavigatedFrom(NavigationEventArgs e)
        {
            _navigationHelper.OnNavigatedFrom(e);
            _dataTransferManager.DataRequested -= OnDataRequested;
        }

        private void OnDataRequested(DataTransferManager sender, DataRequestedEventArgs args)
        {
            if (CustomersModel != null)
            {
                CustomersModel.GetShareContent(args.Request);
            }
        }
    }
}
