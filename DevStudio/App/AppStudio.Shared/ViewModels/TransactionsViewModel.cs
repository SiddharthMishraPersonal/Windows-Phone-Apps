using System;
using System.Windows;
using System.Windows.Input;

using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

using AppStudio.Services;
using AppStudio.Data;

namespace AppStudio.ViewModels
{
    public class TransactionsViewModel : ViewModelBase<TransactionsSchema>
    {
        private RelayCommandEx<TransactionsSchema> itemClickCommand;
        public RelayCommandEx<TransactionsSchema> ItemClickCommand
        {
            get
            {
                if (itemClickCommand == null)
                {
                    itemClickCommand = new RelayCommandEx<TransactionsSchema>(
                        (item) =>
                        {
                            NavigationServices.NavigateToPage("TransactionsDetail", item);
                        });
                }

                return itemClickCommand;
            }
        }

        override protected DataSourceBase<TransactionsSchema> CreateDataSource()
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
