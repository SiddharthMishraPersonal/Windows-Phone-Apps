using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Microsoft.WindowsAzure.MobileServices;
using Newtonsoft.Json.Linq;
using Windows.Networking.PushNotifications;

// http://go.microsoft.com/fwlink/?LinkId=290986&clcid=0x409

namespace channel_connect
{
    internal class channel_connectPush
    {
        class Test
        {
            public string Id { get; set; }
        }

        PushNotificationChannel currentChannel = null;

        public async static void UploadChannel()
        {
            var channel = await Windows.Networking.PushNotifications.PushNotificationChannelManager.CreatePushNotificationChannelForApplicationAsync();

            try
            {
                await App.MobileService.GetPush().RegisterNativeAsync(channel.Uri);
                //await App.MobileService.InvokeApiAsync("MicrosoftAccount:ab0c1b4c1fe6f46d5ae05aba3d8f21fd", new JObject(new JProperty("toast", "Sample Toast")));
            }
            catch (Exception exception)
            {
                HandleRegisterException(exception);
            }

            // Trigger test
            //IMobileServiceTable<Test> prt = App.MobileService.GetTable<Test>();
            //var prts = await prt.ToCollectionAsync();
        }

        private static void HandleRegisterException(Exception exception)
        {

        }

        public async static void AcquirePushChannel(MobileServiceUser currentUser)
        {
            var currentChannel = await
            PushNotificationChannelManager.CreatePushNotificationChannelForApplicationAsync();

            var registrationTable = App.MobileService.GetTable<Registration>();

            List<string> tags = new List<string>();
            await registrationTable.UpdateAsync(new Registration(currentUser.UserId, tags));

            /*
            var existingRegistration = (registrationTable.Where(r => r.UserId == currentUser.UserId).ToListAsync());

            if (existingRegistration.Count == 0)
            {
                await registrationTable.InsertAsync(new Registration()
                {
                    Uri = currentChannel.Uri,
                    UserId = currentUser.UserId
                });
            }
            else
            {
                if (existingRegistration[0].Uri != currentChannel.Uri)
                {
                    existingRegistration[0].Uri = currentChannel.Uri;
                    await registrationTable.UpdateAsync(existingRegistration[0]);

                }
            }
             */
        }
    }
}
