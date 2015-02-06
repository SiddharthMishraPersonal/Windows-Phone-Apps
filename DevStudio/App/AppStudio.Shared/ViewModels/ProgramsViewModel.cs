using System;
using System.Windows;
using System.Windows.Input;

using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

using AppStudio.Services;
using AppStudio.Data;

namespace AppStudio.ViewModels
{
    public class ProgramsViewModel : ViewModelBase<ProgramsSchema>
    {
        private RelayCommandEx<ProgramsSchema> itemClickCommand;
        public RelayCommandEx<ProgramsSchema> ItemClickCommand
        {
            get
            {
                if (itemClickCommand == null)
                {
                    itemClickCommand = new RelayCommandEx<ProgramsSchema>(
                        (item) =>
                        {
                            NavigationServices.NavigateToPage("ProgramsDetail", item);
                        });
                }

                return itemClickCommand;
            }
        }

        override protected DataSourceBase<ProgramsSchema> CreateDataSource()
        {
            return new ProgramsDataSource(); // CollectionDataSource
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
            NavigationServices.NavigateToPage("ProgramsList");
        }

        override protected void NavigateToSelectedItem()
        {
            NavigationServices.NavigateToPage("ProgramsDetail");
        }
    }
}
