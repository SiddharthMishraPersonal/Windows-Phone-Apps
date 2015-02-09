using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Windows.UI.Xaml;

namespace channel_connect.Data.DataSchemas
{
    public class TransactionChatTranscript
    {
        public int Id { get; set; }
        public int TransactionId { get; set; }
        public string ChatTranscript { get; set; }
        public string MicrosoftUserId { get; set; }
        public string PartnerUserId { get; set; }

    }
}
