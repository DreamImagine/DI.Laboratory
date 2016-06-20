using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DI.L.EntityFramework
{
    [Table("Book")]
    public class Book
    {
        private int _id;
        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        private string _BookName;

        public string BookName
        {
            get { return _BookName; }
            set { _BookName = value; }
        }

        private string _BookAuthor;
        public string BookAuthor
        {
            get { return _BookAuthor; }
            set { _BookAuthor = value; }
        }

        private double _BookPrice;
        public double BookPrice
        {
            get { return _BookPrice; }
            set { _BookPrice = value; }
        }
    }
}
