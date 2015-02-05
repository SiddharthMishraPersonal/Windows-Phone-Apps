using Microsoft.WindowsAzure.Mobile.Service;

namespace SidToDoList_TestService.DataObjects
{
    public class TodoItem : EntityData
    {
        public string Text { get; set; }

        public bool Complete { get; set; }
    }
}