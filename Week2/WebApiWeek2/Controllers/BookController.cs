using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using WebApiWeek2.Dtos;
using WebApiWeek2.Models;
using WebApiWeek2.Repositories.Abstracts;

namespace WebApiWeek2.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookController : ControllerBase
    {
        private readonly IBookRepository _bookRepository;

        public BookController(IBookRepository bookRepository, IMapper mapper)  //repo ve mapper injectliyoruz
        {
            _bookRepository = bookRepository;
            _mapper = mapper;
        }

        private readonly IMapper _mapper;


        [HttpGet("{id}")] //getbook
        public IActionResult GetBook(Guid id)
        {
            var bookEntity = _bookRepository.Get(x => x.Id == id);
            if(bookEntity == null)
            {
                return NotFound();
            }
            var response = _mapper.Map<BookDto>(bookEntity);
            return Ok(response);
        }

        [HttpGet] //get allbooks
        public IActionResult GetAllBooks()
        {
            var bookEntities = _bookRepository.GetAll();
            if(bookEntities == null) {
                return NotFound(); 
            }
            List<BookDto> response = new List<BookDto>();
            foreach (var bookEntity in bookEntities)
            {
                response.Add(_mapper.Map<BookDto>(bookEntity));
            }
            return Ok(response);
        }

        [HttpPut("{id}")] //update book
        public async Task<IActionResult> UpdateBookAsync(Guid id, [FromBody]BookDto updateBookDto )
        {
                var entity = _bookRepository.Get(x => x.Id == id);
                entity.UpdateDate = DateTime.Now;
                entity.Name = updateBookDto.Name;
                entity.Isbnno = updateBookDto.Isbnno;
                await _bookRepository.Update(entity);
                return Ok(entity);
        }

        [HttpDelete("{id}")] //delete book
        public IActionResult DeleteBook(Guid id)
        {
            var entity = _bookRepository.Get(x => x.Id ==id);
            if(entity== null)
            {
                return NotFound();
            }
            _bookRepository.Delete(entity);
            return Ok();
        }

        [HttpPost] //create book
        public async Task<IActionResult> CreateBookAsync(BookDto bookDto)
        {
            var entity = _mapper.Map<Book>(bookDto);
            entity.EntryDate = DateTime.Now;
            await _bookRepository.Add(entity);
            return Ok();
        }
    }
}
