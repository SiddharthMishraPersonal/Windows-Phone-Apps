using System;
using System.Windows;
using System.Windows.Input;

using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

using AppStudio.Services;
using AppStudio.Data;

namespace AppStudio.ViewModels
{
    public class CustomersViewModel : ViewModelBase<CustomersSchema>
    {
        private RelayCommandEx<CustomersSchema> itemClickCommand;
        public RelayCommandEx<CustomersSchema> ItemClickCommand
        {
            get
            {
                if (itemClickCommand == null)
                {
                    itemClickCommand = new RelayCommandEx<CustomersSchema>(
                        (item) =>
                        {
                            NavigationServices.NavigateToPage("CustomersDetail", item);
                        });
                }

                return itemClickCommand;
            }
        }

        override protected DataSourceBase<CustomersSchema> CreateDataSource()
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
