﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace channel_connect.Data.DataModel
{
  public  class PartnerMaster
  {
      private int _id;
      private string _name;
      private int _unitCost;


      public int Id
      {
          get { return _id; }
          set { _id = value; }
      }

      public string Name
      {
          get { return _name; }
          set { _name = value; }
      }

      public int UnitCost
      {
          get { return _unitCost; }
          set { _unitCost = value; }
      }
  }
}
