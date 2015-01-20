using PhoneTestApp.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace PhoneTestApp.ViewModel
{
    public class MainApplicationViewModel : BaseViewModel
    {
        #region Private Member Variables

        decimal _firstNumber = 10;
        decimal _secondNumber = 20;
        decimal _resultValue = 30;

        #endregion

        #region Public Properties

        public decimal FirstNumber
        {
            get { return _firstNumber; }
            set
            {
                _firstNumber = value;
                OnPropertyChanged("FirstNumber");

            }
        }

        public decimal SecondNumber
        {
            get { return _secondNumber; }
            set
            {
                _secondNumber = value;
                OnPropertyChanged("SecondNumber");


            }
        }

        public decimal ResultValue
        {
            get { return _resultValue; }
            set
            {
                _resultValue = value;
                OnPropertyChanged("ResultValue");
            }

        }

        #endregion

        #region Constructors

        public MainApplicationViewModel()
        {
           
        }

        #endregion


        #region Commands

        ICommand _calcualteCommand;

        public ICommand CalcualteCommand
        {
            get
            {
                if (_calcualteCommand == null)
                {
                    _calcualteCommand = new RelayCommand(CalculateCommand_Execute, CalcualteCommand_CanExecute);
                }

                return _calcualteCommand;
            }

            set
            {
                _calcualteCommand = value;
            }
        }

        void CalculateCommand_Execute(object param)
        {
            ResultValue = FirstNumber + SecondNumber;
        }

        bool CalcualteCommand_CanExecute(object param)
        {
            return true;
        }

        #endregion
    }
}
