using PhoneTestApp.Helper;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Microsoft.WindowsAzure.MobileServices;
using PhoneTestApp.Model;
using System.Security.Cryptography.X509Certificates;
using System.Windows.Controls;
using Observable = System.Reactive.Linq.Observable;
using Unit = System.Reactive.Unit;

namespace PhoneTestApp.ViewModel
{
    public class MainApplicationViewModel : BaseViewModel
    {
        #region Private Member Variables

        private MobileServiceCollection<EmployeeMaster, EmployeeMaster> _items;
        private IMobileServiceTable<EmployeeMaster> _employees = App.MobileService.GetTable<EmployeeMaster>();

        //private MainPage _view;

        private string _partnerName;
        private string _partnerRole;
        private string _partnerSubsidiary;
        

        #endregion

        #region Public Properties

        public ObservableCollection<EmployeeMaster> EmployeeCollection { get; set; }

        public string PartnerName
        {
            get { return _partnerName; }
            set
            {
                _partnerName = value;

                OnPropertyChanged("PartnerName");
            }
        }

        public string PartnerRole
        {
            get { return _partnerRole; }
            set
            {
                _partnerRole = value;

                OnPropertyChanged("PartnerRole");
            }
        }

        public string PartnerSubsidiary
        {
            get { return _partnerSubsidiary; }
            set
            {
                _partnerSubsidiary = value;

                OnPropertyChanged("PartnerSubsidiary");
            }
        }

        #endregion

        #region Constructors

        //public MainApplicationViewModel(MainPage view)
        //{
        //    _view = view;
        //    Initialize();
        //}

        public MainApplicationViewModel()
        {
            Initialize();
            SyncEmployees();
        }

        private async void Initialize()
        {
            await RefreshEmployees();
        }

        #endregion


        #region Commands

        ICommand _saveCommand;

        public ICommand SaveCommand
        {
            get
            {
                if (_saveCommand == null)
                {
                    _saveCommand = new RelayCommand(CalculateCommand_Execute, SaveCommand_CanExecute);
                }

                return _saveCommand;
            }

            set
            {
                _saveCommand = value;
            }
        }

        public MobileServiceCollection<EmployeeMaster, EmployeeMaster> Items
        {
            get { return _items; }
            set { _items = value; }
        }

        public IMobileServiceTable<EmployeeMaster> Employees
        {
            get { return _employees; }
            set { _employees = value; }
        }


        async void CalculateCommand_Execute(object param)
        {
            var employee = new EmployeeMaster { Name = PartnerName, Role = PartnerRole, Subsidiary = PartnerSubsidiary };
            await InsertEmployee(employee);
            await RefreshEmployees();
        }

        bool SaveCommand_CanExecute(object param)
        {
            return true;
        }

        #endregion


        #region Methods

        private async Task InsertEmployee(EmployeeMaster employee)
        {
            // This code inserts a new TodoItem into the database. When the operation completes
            // and Mobile Services has assigned an Id, the item is added to the CollectionView
            await Employees.InsertAsync(employee);
            //items.Add(employee);

            //await SyncAsync(); // offline sync
        }

        private async Task RefreshEmployees()
        {
            MobileServiceInvalidOperationException exception = null;
            try
            {
                // This code refreshes the entries in the list view by querying the TodoItems table.
                // The query excludes completed TodoItems
                Items = await Employees
                    .ToCollectionAsync();
            }
            catch (MobileServiceInvalidOperationException e)
            {
                exception = e;
            }

            if (exception != null)
            {
                //await new MessageDialog(exception.Message, "Error loading items").ShowAsync();
            }
            else
            {
                //ListItems.ItemsSource = items;
                //this.ButtonSave.IsEnabled = true;
            }
        }

        #endregion

        #region Generate Method

        private void SyncEmployees()
        {
            var observableEmployees = Observable.Generate(Unit.Default, x => true, x => x, x => x,
                x => new TimeSpan(0, 0, 0, 1));
            var subscribeMethod = observableEmployees.Subscribe(OnNext);
        }

        private void OnNext(Unit unit)
        {
            RefreshEmployees();
        }

        #endregion
    }
}
