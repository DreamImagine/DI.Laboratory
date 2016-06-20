using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DI.L.SQLGenerateCode.Model
{
    /// <summary>
    /// 表结构
    /// </summary>
    public class TableStructure
    {
        /// <summary>
        /// 字段名
        /// </summary>
        public string FieldName { get; set; }

        /// <summary>
        /// 是否为主键
        /// </summary>
        public bool IsPrimaryKey { get; set; }

        /// <summary>
        /// 是否标识
        /// </summary>
        public bool IsIdentity { get; set; }

        /// <summary>
        /// 字段类型
        /// </summary>
        public string FieldType { get; set; }


        /// <summary>
        /// 占用字节数量
        /// </summary>
        public int OccupancyBytes { get; set; }


        /// <summary>
        /// 字段长度
        /// </summary>
        public int FieldLength { get; set; }

        /// <summary>
        /// 小数位
        /// </summary>
        public int DecimalDigits { get; set; }

        /// <summary>
        /// 可以 null
        /// </summary>
        public bool CanNull { get; set; }

    }
}
