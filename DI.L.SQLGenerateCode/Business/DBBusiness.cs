using DI.L.SQLGenerateCode.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DI.L.SQLGenerateCode.Business
{
    /// <summary>
    /// DB 业务
    /// </summary>
    public class DBBusiness
    {
        public DBBusiness()
        {

        }

        /// <summary>
        /// 获得所有的数据库名
        /// </summary>
        /// <returns></returns>
        public IList<DataBase> GetAllDB()
        {
            var result = new List<DataBase>();

            //Todo 



            return result;
        }


        /// <summary>
        /// 获得数据库下的所有表名
        /// </summary>
        /// <param name="db"></param>
        /// <returns></returns>
        public IList<Table> GetAllTableByDB(string db)
        {

            var result = new List<Table>();

            //Todo 



            return result;
        }



        /// <summary>
        /// 获得表对应的所有的列信息
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        public IList<TableStructure> GetAallColumnByTable(string table)
        {

            var result = new List<TableStructure>();

            //Todo 



            return result;
        }




    }
}
