using System;
using System.Collections.Generic;

#nullable disable

namespace WebApiWeek2.Models
{
    public partial class Book:BaseEntity
    {
        public string Name { get; set; }
        public Guid? AuthorId { get; set; }
        public string Isbnno { get; set; }
        public string Type { get; set; }

        public virtual Author Author { get; set; }
    }
}
