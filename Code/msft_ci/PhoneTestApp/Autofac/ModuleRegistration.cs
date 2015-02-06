using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Autofac;
using PhoneTestApp.ViewModel;

namespace PhoneTestApp.Autofac
{
    public class ModuleRegistration : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            base.Load(builder);

            //builder.RegisterType<MainPage>()
            //    .AsSelf()
            //    .SingleInstance();

            //builder.RegisterType<MainApplicationViewModel>()
            //    .AsSelf()
            //    .As<BaseViewModel>()
            //    .SingleInstance();
        }
    }
}
