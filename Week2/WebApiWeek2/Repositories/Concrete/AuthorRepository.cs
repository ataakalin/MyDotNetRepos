using Microsoft.EntityFrameworkCore;
using WebApiWeek2.Models;
using WebApiWeek2.Repositories.Abstracts;

namespace WebApiWeek2.Repositories.Concrete
{
    public class AuthorRepository : GenericRepository<Author>, IAuthorRepository //sonrasında Author için özel bir işlem yapılacaksa interface'ine eklendikten sonra burda işlemleri uygulanabilir.
    {
        public AuthorRepository(BookAuthorContext dbContext) : base(dbContext)
        {

        }

        
    }
}
