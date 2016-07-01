using Quartz;
using Quartz.Impl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DI.L.Quartz.NET
{
    public class ShiftNotify : IJob
    {
        public void Execute(IJobExecutionContext context)
        {
            //在此执行计划任务
            //比如：“时间不早了，该起床啦！”

            Console.WriteLine("时间不早了");


     
        }

    } 
}
