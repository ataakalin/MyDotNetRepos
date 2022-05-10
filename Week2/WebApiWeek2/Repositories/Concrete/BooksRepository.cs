using Microsoft.EntityFrameworkCore;
using WebApiWeek2.Models;
using WebApiWeek2.Repositories.Abstracts;

namespace WebApiWeek2.Repositories.Concrete
{
    public class BooksRepository : GenericRepository<Book>, IBookRepository //sonrasında book için özel bir işlem yapılacaksa interface'ine eklendikten sonra burda işlemleri uygulanabilir.
    {
        public BooksRepository(BookAuthorContext dbContext) : base(dbContext)
        {
        }
    }
}
