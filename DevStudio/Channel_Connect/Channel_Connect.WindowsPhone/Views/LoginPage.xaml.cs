﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Threading.Tasks;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.Storage.Pickers.Provider;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;
using channel_connect.Data;
using channel_connect.ViewModels;
using Microsoft.WindowsAzure.MobileServices;
using Microsoft.Live;

// The Content Dialog item template is documented at http://go.microsoft.com/fwlink/?LinkID=390556

namespace channel_connect.Views
{
    public enum SignInResult
    {
        SignInOK,
        SignInFail,
        SignInCancel,
        Nothing
    }


    public sealed partial class LoginPage : ContentDialog, INotifyPropertyChanged
    {
        private string _password;
        private string _loginId;


        public static MobileServiceUser user = null;
        public SignInResult Result { get; private set; }

        public string Password
        {
            get { return _password; }
            set
            {
                _password = value;
                OnPropertyChanged("Password");
            }
        }

        public string LoginId
        {
            get { return _loginId; }
            set
            {
                _loginId = value;
                OnPropertyChanged("LoginId");
            }
        }


        public LoginPage()
        {

            this.InitializeComponent();
            this.Opened += SignInContentDialog_Opened;
            this.Closing += SignInContentDialog_Closing;
            this.DataContext = this;
        }

        private async void ContentDialog_PrimaryButtonClick(ContentDialog sender, ContentDialogButtonClickEventArgs args)
        {
            // Ensure the user name and password fields aren't empty. If a required field
            // is empty, set args.Cancel = true to keep the dialog open.
            if (string.IsNullOrEmpty(emailTextBox.Text))
            {
                args.Cancel = true;
                errorTextBlock.Text = "User name is required.";
            }
            else if (string.IsNullOrEmpty(passwordTextBox.Password))
            {
                args.Cancel = true;
                errorTextBlock.Text = "Password is required.";
            }

            // If you're performing async operations in the button click handler,
            // get a deferral before you await the operation. Then, complete the
            // deferral when the async operation is complete.

            ContentDialogButtonClickDeferral deferral = args.GetDeferral();
            
            //if (await SomeAsyncSignInOperation())

            await DoLoginProcess();

            if (true)
            {
                this.Result = SignInResult.SignInOK;
            }
            else
            {
                this.Result = SignInResult.SignInFail;
            }
            deferral.Complete();
        }


        private async Task<SignInResult> DoLoginProcess()
        {
            var signInResult = SignInResult.Nothing;
            var connected = false;
            var authClient = new LiveAuthClient();
            LiveLoginResult result = await authClient.LoginAsync(new string[] { "wl.signin", "wl.skydrive" });

            if (result.Status == LiveConnectSessionStatus.Connected)
            {
                connected = true;
                var connectClient = new LiveConnectClient(result.Session);
                var meResult = await connectClient.GetAsync("me");
                dynamic meData = meResult.Result;
                
            }


            return signInResult;
        }

        private void ContentDialog_SecondaryButtonClick(ContentDialog sender, ContentDialogButtonClickEventArgs args)
        {
            // User clicked Cancel.
            this.Result = SignInResult.SignInCancel;
        }

        #region Private Variables

        void SignInContentDialog_Opened(ContentDialog sender, ContentDialogOpenedEventArgs args)
        {
            this.Result = SignInResult.Nothing;

            // If the user name is saved, get it and populate the user name field.
            Windows.Storage.ApplicationDataContainer roamingSettings = Windows.Storage.ApplicationData.Current.RoamingSettings;
            if (roamingSettings.Values.ContainsKey("userName"))
            {
                emailTextBox.Text = roamingSettings.Values["userName"].ToString();
                saveUserNameCheckBox.IsChecked = true;
            }
        }

        void SignInContentDialog_Closing(ContentDialog sender, ContentDialogClosingEventArgs args)
        {
            // If sign in was successful, save or clear the user name based on the user choice.
            if (this.Result == SignInResult.SignInOK)
            {
                if (saveUserNameCheckBox.IsChecked == true)
                {
                    SaveUserName();
                }
                else
                {
                    ClearUserName();
                }
            }

            // If the user entered a name and checked or cleared the 'save user name' checkbox, then clicked the back arrow,
            // confirm if it was their intention to save or clear the user name without signing in. 
            if (this.Result == SignInResult.Nothing && !string.IsNullOrEmpty(emailTextBox.Text))
            {
                if (saveUserNameCheckBox.IsChecked == false)
                {
                    args.Cancel = true;
                    FlyoutBase.SetAttachedFlyout(this, (FlyoutBase)this.Resources["DiscardNameFlyout"]);
                    FlyoutBase.ShowAttachedFlyout(this);
                }
                else if (saveUserNameCheckBox.IsChecked == true && !string.IsNullOrEmpty(emailTextBox.Text))
                {
                    args.Cancel = true;
                    FlyoutBase.SetAttachedFlyout(this, (FlyoutBase)this.Resources["SaveNameFlyout"]);
                    FlyoutBase.ShowAttachedFlyout(this);
                }
            }
        }



        private void SaveUserName()
        {
            Windows.Storage.ApplicationDataContainer roamingSettings = Windows.Storage.ApplicationData.Current.RoamingSettings;
            roamingSettings.Values["userName"] = emailTextBox.Text;
        }

        private void ClearUserName()
        {
            Windows.Storage.ApplicationDataContainer roamingSettings = Windows.Storage.ApplicationData.Current.RoamingSettings;
            roamingSettings.Values["userName"] = null;
            emailTextBox.Text = string.Empty;
        }

        // Handle the button clicks from the flyouts.
        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            SaveUserName();
            FlyoutBase.GetAttachedFlyout(this).Hide();
        }

        private void DiscardButton_Click(object sender, RoutedEventArgs e)
        {
            ClearUserName();
            FlyoutBase.GetAttachedFlyout(this).Hide();
        }

        // When the flyout closes, hide the sign in dialog, too.
        private void Flyout_Closed(object sender, object e)
        {
            this.Hide();
        }


        #endregion

        private void ConditionCheckBox_OnChecked(object sender, RoutedEventArgs e)
        {
            this.IsPrimaryButtonEnabled = true;
        }

        private void ConditionCheckBox_OnUnchecked(object sender, RoutedEventArgs e)
        {
            this.IsPrimaryButtonEnabled = false;
        }

        private void ShowPasswordCheckBox_OnChecked(object sender, RoutedEventArgs e)
        {
            passwordTextBox.Visibility = Visibility.Collapsed;
            showPasswordAsTextBox.Visibility = Visibility.Visible;
        }
        
        private void ShowPasswordCheckBox_OnUnchecked(object sender, RoutedEventArgs e)
        {
            passwordTextBox.Visibility = Visibility.Visible;
            showPasswordAsTextBox.Visibility = Visibility.Collapsed;
        }

        public event PropertyChangedEventHandler PropertyChanged;

        private void OnPropertyChanged(string property)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(property));
            }
        }


        private void UserNamePasswordRequiredButton_OnClick(object sender, RoutedEventArgs e)
        {
            errorTextBlock.Text = string.Empty;
            FlyoutBase.GetAttachedFlyout(this).Hide();
        }
    }
}