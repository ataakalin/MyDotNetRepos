using System;
using System.Collections.Generic;

#nullable disable

namespace WebApiWeek2.Models
{
    public partial class Author:BaseEntity
    {
        public Author()
        {
            Books = new HashSet<Book>();
        }

        public string Name { get; set; }
        public string LastName { get; set; }
        public int? Age { get; set; }

        public virtual ICollection<Book> Books { get; set; }
    }
}
