using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;

namespace PhoneTestApp.View
{
    public partial class TransactionsPage : PhoneApplicationPage
    {
        public TransactionsPage()
        {
            InitializeComponent();
        }

        private void DisputedMenuItem_OnClick(object sender, EventArgs e)
        {
            NavigationService.Navigate(new Uri("/View/DisputedTransactionsPage.xaml", UriKind.Relative));
        }

        private void CustomersMenuItem_OnClick(object sender, EventArgs e)
        {
            NavigationService.Navigate(new Uri("/View/CustomersPage.xaml", UriKind.Relative));
        }

        private void ProgramsMenuItem_OnClick(object sender, EventArgs e)
        {
            NavigationService.Navigate(new Uri("/View/ProgramsPage.xaml", UriKind.Relative));
        }

        private void PartnersMenuItem_OnClick(object sender, EventArgs e)
        {
            NavigationService.Navigate(new Uri("/View/PartnersView.xaml", UriKind.Relative));
        }

       

        private void TransactionListBox_OnSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            NavigationService.Navigate(new Uri("/View/TransactionSummaryPage.xaml", UriKind.Relative));
            
        }

    }
}