using System;

using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Navigation;

using channel_connect.Services;
using channel_connect.ViewModels;

namespace channel_connect.Views
{
    public sealed partial class TransactionsList : Page
    {
        private NavigationHelper _navigationHelper;

        public TransactionsList()
        {
            this.InitializeComponent();
            _navigationHelper = new NavigationHelper(this);

            TransactionsModel = new TransactionsViewModel();

            SizeChanged += OnSizeChanged;
        }

        public TransactionsViewModel TransactionsModel { get; private set; }

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

        protected async override void OnNavigatedTo(NavigationEventArgs e)
        {
            _navigationHelper.OnNavigatedTo(e);
            await TransactionsModel.LoadItemsAsync();

            DataContext = this;
        }

        protected override void OnNavigatedFrom(NavigationEventArgs e)
        {
            _navigationHelper.OnNavigatedFrom(e);
        }
    }
}
