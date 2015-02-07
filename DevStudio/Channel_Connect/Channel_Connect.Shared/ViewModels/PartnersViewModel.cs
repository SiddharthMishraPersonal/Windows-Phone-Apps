using System;
using System.Windows;
using System.Windows.Input;

using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

using channel_connect.Services;
using channel_connect.Data;

namespace channel_connect.ViewModels
{
    public class PartnersViewModel : ViewModelBase<PartnersSchema>
    {
        private RelayCommandEx<PartnersSchema> itemClickCommand;
        public RelayCommandEx<PartnersSchema> ItemClickCommand
        {
            get
            {
                if (itemClickCommand == null)
                {
                    itemClickCommand = new RelayCommandEx<PartnersSchema>(
                        (item) =>
                        {
                            NavigationServices.NavigateToPage("PartnersDetail", item);
                        });
                }

                return itemClickCommand;
            }
        }

        override protected DataSourceBase<PartnersSchema> CreateDataSource()
        {
            return new PartnersDataSource(); // CollectionDataSource
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
            NavigationServices.NavigateToPage("PartnersList");
        }

        override protected void NavigateToSelectedItem()
        {
            NavigationServices.NavigateToPage("PartnersDetail");
        }
    }
}
