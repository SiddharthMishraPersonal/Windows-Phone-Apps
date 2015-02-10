using System;
using System.Linq;
using System.Net.NetworkInformation;

using Windows.UI.ViewManagement;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Navigation;
using Windows.ApplicationModel.DataTransfer;
using Windows.ApplicationModel.Background;

using channel_connect.Services;
using channel_connect.ViewModels;
using Microsoft.WindowsAzure.MobileServices;
using System.Collections.Generic;
using channel_connect.Data;
using Windows.Media.SpeechRecognition;
using Windows.UI.Popups;
using Windows.UI.Xaml.Media;

namespace channel_connect.Views
{
    public sealed partial class MainPage : Page
    {
        private MainViewModel _mainViewModel = null;

        private NavigationHelper _navigationHelper;

        private DataTransferManager _dataTransferManager;

        public static MobileServiceUser user = null;
        //public static int userId = 0;
        private SpeechRecognizer recognizer;


        public MainPage()
        {
            this.InitializeComponent();

            this.NavigationCacheMode = NavigationCacheMode.Required;
            _navigationHelper = new NavigationHelper(this);

            _mainViewModel = _mainViewModel ?? new MainViewModel();

            this.recognizer = new SpeechRecognizer();

            DataContext = this;

            ApplicationView.GetForCurrentView().
                SetDesiredBoundsMode(ApplicationViewBoundsMode.UseVisible);
        }

        public MainViewModel MainViewModel
        {
            get { return _mainViewModel; }
        }

        /// <summary>
        /// NavigationHelper is used on each page to aid in navigation and 
        /// process lifetime management
        /// </summary>
        public NavigationHelper NavigationHelper
        {
            get { return _navigationHelper; }
        }

        private void OnSectionsInViewChanged(object sender, SectionsInViewChangedEventArgs e)
        {
            var selectedSection = Container.SectionsInView.FirstOrDefault();
            if (selectedSection != null)
            {
                MainViewModel.SelectedItem = selectedSection.DataContext as ViewModelBase;
            }
        }

        #region NavigationHelper registration
        /// The methods provided in this section are simply used to allow
        /// NavigationHelper to respond to the page's navigation methods.
        /// 
        /// Page specific logic should be placed in event handlers for the  
        /// <see cref="GridCS.Common.NavigationHelper.LoadState"/>
        /// and <see cref="GridCS.Common.NavigationHelper.SaveState"/>.
        /// The navigation parameter is available in the LoadState method 
        /// in addition to page state preserved during an earlier session.
        protected override async void OnNavigatedTo(NavigationEventArgs e)
        {
            _dataTransferManager = DataTransferManager.GetForCurrentView();
            _dataTransferManager.DataRequested += OnDataRequested;
            _navigationHelper.OnNavigatedTo(e);
            
        }

        protected override void OnNavigatedFrom(NavigationEventArgs e)
        {
            _navigationHelper.OnNavigatedFrom(e);
            _dataTransferManager.DataRequested -= OnDataRequested;
        }
        #endregion

        private void OnDataRequested(DataTransferManager sender, DataRequestedEventArgs args)
        {
            var viewModel = MainViewModel.SelectedItem;
            if (viewModel != null)
            {
                viewModel.GetShareContent(args.Request);
            }
        }

        private async System.Threading.Tasks.Task AuthenticateAsync()
        {
            while (user == null)
            {
                string message;
                try
                {
                    // Change 'MobileService' to the name of your MobileServiceClient instance.
                    // Sign-in using Facebook authentication.
                    user = await App.MobileService.LoginAsync(MobileServiceAuthenticationProvider.MicrosoftAccount);

                    message = string.Format("You are now signed in - {0}", user.UserId);

                    IMobileServiceTable<channel_connect.Data.MicrosoftEmployeeMaster> emp = App.MobileService.GetTable<channel_connect.Data.MicrosoftEmployeeMaster>();

                    var items = await emp.ToCollectionAsync();
                    IEnumerable<int> u = from i in items
                                         where i.UserId == user.UserId
                                         select i.Id;

                    if (u.Count<int>() == 0)
                    {
                        IMobileServiceTable<channel_connect.Data.PartnerEmployeeMaster> prt = App.MobileService.GetTable<channel_connect.Data.PartnerEmployeeMaster>();
                        var prts = await prt.ToCollectionAsync();
                        u = from i in prts
                            where i.UserId == user.UserId
                            select i.Id;
                        StaticDataProvider.isPartner = true;
                    }

                    if (u != null)
                    {
                        StaticDataProvider.LoggedInId = u.FirstOrDefault();
                        Container.Visibility = Visibility.Visible;
                        Button_SignIn.Visibility = Visibility.Collapsed;
#if WINDOWS_PHONE_APP
                        channel_connectPush.UploadChannel();
                        //channel_connectPush.AcquirePushChannel(user);
#endif
                    }
                    else
                    {
                        message = "User not found.";
                    }
                    await MainViewModel.LoadDataAsync();
                   // PartnerHubSection.Visibility = Windows.UI.Xaml.Visibility.Visible;

                    //if (StaticDataProvider.isPartner == true)
                    //{
                    //    PartnerHubSection.Visibility = Windows.UI.Xaml.Visibility.Visible;
                    //    MicrosoftHubSection.Visibility = Windows.UI.Xaml.Visibility.Collapsed;
                    //}
                    //else
                    //{
                    //    PartnerHubSection.Visibility = Windows.UI.Xaml.Visibility.Collapsed;
                    //    MicrosoftHubSection.Visibility = Windows.UI.Xaml.Visibility.Visible;
                    //}
                }
                catch (InvalidOperationException ex)
                {
                    message = "You must log in. Login Required";
                }
            }
        }

        private void Container_Loaded(object sender, RoutedEventArgs e)
        {
            //await AuthenticateAsync();
        }

        private async void Button_Click(object sender, RoutedEventArgs e)
        {
            await AuthenticateAsync();
        }

        private async void MicrophoneButton_Click(object sender, Windows.UI.Xaml.RoutedEventArgs e)
        {

            await recognizer.CompileConstraintsAsync();




            SpeechRecognitionResult result = await recognizer.RecognizeWithUIAsync();




            string spokenText = result.Text.ToLower();




            //var messageDialog = new windows.ui.popups.messagedialog(result.text, "text spoken");

            //var msgBox = new MessageDialog(spokenText, "You spoke");

            //msgBox.ShowAsync();\




            if (spokenText.StartsWith("show", StringComparison.CurrentCultureIgnoreCase))
            {

                spokenText = spokenText.Replace("show", string.Empty).Trim();

                if (spokenText.StartsWith("transactions"))
                {

                    NavigationServices.NavigateToPage("TransactionsPage");

                }

                else if (spokenText.StartsWith("partners"))
                {

                    NavigationServices.NavigateToPage("PartnersPage");

                }

                else if (spokenText.StartsWith("programs"))
                {

                    NavigationServices.NavigateToPage("ProgramsPage");

                }

                else if (spokenText.StartsWith("customers"))
                {

                    NavigationServices.NavigateToPage("CustomersPage");

                }

                else if (spokenText.EndsWith("transactions"))
                {

                    string partner = spokenText.Replace("transactions", string.Empty).Trim();

                    NavigationServices.NavigateToPage("TransactionsPage");

                    //needs to be implemented so as to return the transactions for that perticular partner

                }

            }
        }
    }

    public class Test
    {
        private int _id;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }
    }
}
