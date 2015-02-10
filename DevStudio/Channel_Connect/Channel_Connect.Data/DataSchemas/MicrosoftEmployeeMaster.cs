﻿using AppStudio.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace channel_connect.Data
{
    public class MicrosoftEmployeeMaster// : BindableSchemaBase, IEquatable<CustomerMaster>, ISyncItem<CustomerMaster>
    {
        private int _id;
        private string _name;
        private string _role;
        private string _subsidiary;
        private string _user;

        //[JsonProperty("_id")]
        //public string Id { get; set; }
        
        public int Id { get; set; }

        public string Name { get; set; }

        public string Role { get; set; }

        public string Subsidiary { get; set; }

        public string UserId { get; set; }
    }


}