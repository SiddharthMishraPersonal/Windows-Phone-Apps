using System;
using System.Threading.Tasks;
using System.Windows.Input;
using System.Net.NetworkInformation;
using Microsoft.WindowsAzure.MobileServices;

using Windows.UI.Xaml;
using AppStudio.Data;
using channel_connect.Services;
using channel_connect.Data;

namespace channel_connect.ViewModels
{
    public class MainViewModel : BindableBase
    {
        private MenuViewModel _menuModel;
        private PrivacyViewModel _privacyModel;

        //private MobileServiceCollection<TodoItem, TodoItem> items;
        //private IMobileServiceTable<TodoItem> todoTable = App.MobileService.GetTable<TodoItem>();
        ////private IMobileServiceSyncTable<TodoItem> todoTable = App.MobileService.GetSyncTable<TodoItem>(); // offline sync


        private ViewModelBase _selectedItem = null;

        public MainViewModel()
        {
            _selectedItem = MenuModel;
            _privacyModel = new PrivacyViewModel();

          

        }

        //private async Task RefreshTodoItems()
        //{
        //    MobileServiceInvalidOperationException exception = null;
        //    try
        //    {
        //        // This code refreshes the entries in the list view by querying the TodoItems table.
        //        // The query excludes completed TodoItems
        //        items = await todoTable
        //            .Where(todoItem => todoItem.Complete == false)
        //            .ToCollectionAsync();
        //    }
        //    catch (MobileServiceInvalidOperationException e)
        //    {
        //        exception = e;
        //    }

        //    if (exception != null)
        //    {
        //        await new MessageDialog(exception.Message, "Error loading items").ShowAsync();
        //    }
        //    else
        //    {
        //        ListItems.ItemsSource = items;
        //        this.ButtonSave.IsEnabled = true;
        //    }
        //}


        public MenuViewModel MenuModel
        {
            get { return _menuModel ?? (_menuModel = new MenuViewModel()); }
        }

        public void SetViewType(ViewTypes viewType)
        {
            MenuModel.ViewType = viewType;
        }

        public ViewModelBase SelectedItem
        {
            get { return _selectedItem; }
            set
            {
                SetProperty(ref _selectedItem, value);
                UpdateAppBar();
            }
        }

        public Visibility AppBarVisibility
        {
            get
            {
                return SelectedItem == null ? AboutVisibility : SelectedItem.AppBarVisibility;
            }
        }

        public Visibility AboutVisibility
        {

            get { return Visibility.Collapsed; }
        }

        public void UpdateAppBar()
        {
            OnPropertyChanged("AppBarVisibility");
            OnPropertyChanged("AboutVisibility");
        }

        /// <summary>
        /// Load ViewModel items asynchronous
        /// </summary>
        public async Task LoadDataAsync(bool forceRefresh = false)
        {
            var loadTasks = new Task[]
            { 
                MenuModel.LoadItemsAsync(forceRefresh),
            };
            await Task.WhenAll(loadTasks);
        }

        //
        //  ViewModel command implementation
        //
        public ICommand RefreshCommand
        {
            get
            {
                return new DelegateCommand(async () =>
                {
                    await LoadDataAsync(true);
                });
            }
        }

        public ICommand AboutCommand
        {
            get
            {
                return new DelegateCommand(() =>
                {
                    NavigationServices.NavigateToPage("AboutThisAppPage");
                });
            }
        }

        public ICommand PrivacyCommand
        {
            get
            {
                return new DelegateCommand(() =>
                {
                    NavigationServices.NavigateTo(_privacyModel.Url);
                });
            }
        }
    }
}
