using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using WebApiWeek2.Models;
using WebApiWeek2.Repositories.Abstracts;

namespace WebApiWeek2.Repositories.Concrete 
{
    public class GenericRepository<T> : IGenericRepository<T> where T : BaseEntity //generic tanımların işlenmesi
    {
        private DbContext _dbContext;

        public GenericRepository(DbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task Add(T entity)
        {
            
                var addEntity = _dbContext.Entry(entity);
                addEntity.State = EntityState.Added;
                _dbContext.SaveChanges();
            
        }

        public async Task Delete(T entity)
        {
            
                var deleteEntity = _dbContext.Entry(entity);
                deleteEntity.State = EntityState.Deleted;
                _dbContext.SaveChanges();
            
        }

        public T Get(Expression<Func<T, bool>> filter)
        {
            
                return _dbContext.Set<T>().SingleOrDefault(filter);
            
        }

        public IList<T> GetAll(Expression<Func<T, bool>> filter = null)
        {
            
                return filter == null ? _dbContext.Set<T>().ToList()
                   :_dbContext.Set<T>().Where(filter).ToList();    
            
        }

        public async Task Update(T entity)
        {
            
                var ModifiedEntity = _dbContext.Entry(entity);
                ModifiedEntity.State = EntityState.Modified;
                _dbContext.SaveChanges();
           
        }
    }
}
