using System;
using System.Windows;
using System.Windows.Input;

using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using channel_connect;
using channel_connect.Services;
using channel_connect.Data;

namespace channel_connect.ViewModels
{
    public class CustomersViewModel : ViewModelBase<CustomerMaster>
    {
        private RelayCommandEx<CustomerMaster> itemClickCommand;
        public RelayCommandEx<CustomerMaster> ItemClickCommand
        {
            get
            {
                if (itemClickCommand == null)
                {
                    itemClickCommand = new RelayCommandEx<CustomerMaster>(
                        (item) =>
                        {
                            NavigationServices.NavigateToPage("CustomersDetail", item);
                        });
                }

                return itemClickCommand;
            }
        }

        override protected DataSourceBase<CustomerMaster> CreateDataSource()
        {
            return new CustomersDataSource(); // CollectionDataSource
        }


        override public Visibility RefreshVisibility
        {
            get { return ViewType == ViewTypes.List ? Visibility.Visible : Visibility.Collapsed; }
        }

        public RelayCommandEx<Slider> IncreaseSlider
        {
            get
            {
                return new RelayCommandEx<Slider>(s => s.Value++);
            }
        }

        public RelayCommandEx<Slider> DecreaseSlider
        {
            get
            {
                return new RelayCommandEx<Slider>(s => s.Value--);
            }
        }

        override public void NavigateToSectionList()
        {
            NavigationServices.NavigateToPage("CustomersList");
        }

        override protected void NavigateToSelectedItem()
        {
            NavigationServices.NavigateToPage("CustomersDetail");
        }
    }
}
