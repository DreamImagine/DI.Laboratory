using Quartz;
using Quartz.Impl;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Topshelf;

namespace DI.L.Quartz.NET
{
    class Program
    {
        static void Main(string[] args)
        {



            //log4net.Config.XmlConfigurator.ConfigureAndWatch(new FileInfo(AppDomain.CurrentDomain.BaseDirectory + "log4net.config"));
            //HostFactory.Run(x =>
            //{
            //    x.UseLog4Net();

            //    x.Service<ServiceRunner>();

            //    x.SetDescription("my服务描述");
            //    x.SetDisplayName("my服务显示名称");
            //    x.SetServiceName("my服务名称");

            //    x.EnablePauseAndContinue();
            //});


            // http://www.quartz-scheduler.net/documentation/quartz-2.x/quick-start.html
            try
            {
                Common.Logging.LogManager.Adapter = new Common.Logging.Simple.ConsoleOutLoggerFactoryAdapter { Level = Common.Logging.LogLevel.Info };

                // Grab the Scheduler instance from the Factory 
                IScheduler scheduler = StdSchedulerFactory.GetDefaultScheduler();

                // and start it off
                scheduler.Start();

                IJobDetail job = JobBuilder.Create<ShiftNotify>()
                    .WithIdentity("job1", "group1")
                    .Build();


                ITrigger trigger = TriggerBuilder.Create()
                    .WithIdentity("trigger1", "group1")
                    .StartNow()
                    .WithSimpleSchedule(x => x
                        .WithIntervalInSeconds(1)
                        .RepeatForever())
                    .Build();


                scheduler.ScheduleJob(job, trigger);

                // some sleep to show what's happening
                Thread.Sleep(TimeSpan.FromSeconds(60));


                // and last shut down the scheduler when you are ready to close your program
                scheduler.Shutdown();
            }
            catch (SchedulerException se)
            {
                Console.WriteLine(se);
            }

            Console.WriteLine("Press any key to close the application");
            Console.ReadKey();

        }
    }
}
