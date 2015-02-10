using System;
using System.Windows;
using System.Windows.Input;

using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

using channel_connect.Services;
using channel_connect.Data;
using channel_connect.Data.DataSchemas;

namespace channel_connect.ViewModels
{
    public class TransactionsViewModel : ViewModelBase<getpartnertransactions>
    {
        private RelayCommandEx<getpartnertransactions> itemClickCommand;
        public RelayCommandEx<getpartnertransactions> ItemClickCommand
        {
            get
            {
                if (itemClickCommand == null)
                {
                    itemClickCommand = new RelayCommandEx<getpartnertransactions>(
                        (item) =>
                        {
                            NavigationServices.NavigateToPage("TransactionsDetail", item);
                        });
                }

                return itemClickCommand;
            }
        }

        override protected DataSourceBase<getpartnertransactions> CreateDataSource()
        {
            return new TransactionsDataSource(); // CollectionDataSource
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
            NavigationServices.NavigateToPage("TransactionsList");
        }

        override protected void NavigateToSelectedItem()
        {
            NavigationServices.NavigateToPage("TransactionsDetail");
        }
    }
}
