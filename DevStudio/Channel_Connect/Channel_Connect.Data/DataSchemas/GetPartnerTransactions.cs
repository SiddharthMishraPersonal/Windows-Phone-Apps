﻿using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppStudio.Data;

namespace channel_connect.Data.DataSchemas
{
    public class getpartnertransactions : BindableSchemaBase, IEquatable<getpartnertransactions>, ISyncItem<getpartnertransactions>
    {

        private int _transactionId;
        private int _partnerId;
        private int _customerId;
        private string _customerName;
        private int _salesPrice;
        private string _programname;
        private DateTime? _incentiveCalculationDate;
        private int _qualifiedforIncentive;
        private int _eligibleIncentives;
        private string _incentivePayableStatus;
        private DateTime? _incentivePaymentDate;
        private string _countryName;
        private int _noOfLicensesSold;
        private string _productName;
        private string _chatTranscript;
        private string _partnerUserId;
        private string _microsoftUserId;
        private string _PAMName;



        public override string DefaultContent
        {
            get { return string.Empty; }
        }

        public override string DefaultImageUrl
        {
            get { return string.Empty; }
        }

        public override string DefaultSummary
        {
            get { return string.Empty; }
        }

        public override string DefaultTitle
        {
            get { return string.Empty; }
        }

        public int TransactionId
        {
            get { return _transactionId; }
            set { _transactionId = value; }
        }

        public int PartnerId
        {
            get { return _partnerId; }
            set { _partnerId = value; }
        }

        public int CustomerId
        {
            get { return _customerId; }
            set { _customerId = value; }
        }

        public string CustomerName
        {
            get { return _customerName; }
            set { _customerName = value; }
        }

        public int SalesPrice
        {
            get { return _salesPrice; }
            set { _salesPrice = value; }
        }

        public string Programname
        {
            get { return _programname; }
            set { _programname = value; }
        }

        public DateTime? IncentiveCalculationDate
        {
            get
            {
                if (_incentiveCalculationDate != null)
                    return _incentiveCalculationDate.Value;
                return null;
            }
            set { _incentiveCalculationDate = value; }
        }

        public int QualifiedforIncentive
        {
            get { return _qualifiedforIncentive; }
            set { _qualifiedforIncentive = value; }
        }

        public int EligibleIncentives
        {
            get { return _eligibleIncentives; }
            set { _eligibleIncentives = value; }
        }

        public string IncentivePayableStatus
        {
            get
            {

                return _incentivePayableStatus;
            }
            set { _incentivePayableStatus = value; }
        }

        public DateTime? IncentivePaymentDate
        {
            get
            {
                if (_incentivePaymentDate != null)
                    return _incentivePaymentDate.Value;
                return null;
            }
            set { _incentivePaymentDate = value; }
        }

        public string CountryName
        {
            get { return _countryName; }
            set { _countryName = value; }
        }

        public int NoOfLicensesSold
        {
            get { return _noOfLicensesSold; }
            set { _noOfLicensesSold = value; }
        }

        public string ProductName
        {
            get { return _productName; }
            set { _productName = value; }
        }

        public string ChatTranscript
        {
            get { return _chatTranscript; }
            set { _chatTranscript = value; }
        }

        public string PartnerUserId
        {
            get { return _partnerUserId; }
            set { _partnerUserId = value; }
        }

        public string MicrosoftUserId
        {
            get { return _microsoftUserId; }
            set { _microsoftUserId = value; }
        }

        public string PamName
        {
            get { return _PAMName; }
            set { _PAMName = value; }
        }

        public override string GetValue(string propertyName)
        {
            return string.Empty;
        }

        public bool Equals(getpartnertransactions other)
        {
            return this.TransactionId.Equals(other.TransactionId);
        }

        public void Sync(getpartnertransactions other)
        {

        }

        public bool NeedSync(getpartnertransactions other)
        {
            return !this.TransactionId.Equals(other.TransactionId);
        }
    }
}
