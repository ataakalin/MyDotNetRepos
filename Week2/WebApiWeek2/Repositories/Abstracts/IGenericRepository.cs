using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using WebApiWeek2.Models;

namespace WebApiWeek2.Repositories.Abstracts
{
    public interface IGenericRepository<T> where T : BaseEntity  // generic tanımlar
    {
        IList<T> GetAll(Expression<Func<T, bool>> filter = null);
        Task Add(T entity);
        Task Update(T entity);
        Task Delete(T entity);
        T Get(Expression<Func<T, bool>> filter);
        
    }
}
