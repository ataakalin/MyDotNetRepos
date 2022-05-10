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
    public class AuthorController:ControllerBase
    {
        private readonly IAuthorRepository _authorRepository;
        private readonly IMapper _mapper;

        public AuthorController(IAuthorRepository authorRepository, IMapper mapper)
        {
            _authorRepository = authorRepository;
            _mapper = mapper;
        }

        [HttpGet("{id}")]
        public IActionResult GetAuthor(Guid id)
        {
            var authorEntity = _authorRepository.Get(x => x.Id == id);
            if (authorEntity == null)
            {
                return NotFound();
            }
            var response = _mapper.Map<AuthorDto>(authorEntity);
            return Ok(response);
        }

        [HttpGet]
        public IActionResult GetAllAuthors()
        {
            var authorEntities = _authorRepository.GetAll();
            if (authorEntities == null)
            {
                return NotFound();
            }
            List<AuthorDto> response = new List<AuthorDto>();
            foreach (var authorEntity in authorEntities)
            {
                response.Add(_mapper.Map<AuthorDto>(authorEntity));
            }
            return Ok(response);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateAuthorAsync(Guid id, [FromBody] AuthorDto authorDto)
        {
            var entity = _authorRepository.Get(x => x.Id == id);
            entity.UpdateDate = DateTime.Now;
            entity.Name = authorDto.Name;
            entity.LastName = authorDto.LastName;
            entity.Age = authorDto.Age;
            await _authorRepository.Update(entity);
            return Ok(entity);
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteAuthor(Guid id)
        {
            var entity = _authorRepository.Get(x => x.Id == id);
            if (entity == null)
            {
                return NotFound();
            }
            _authorRepository.Delete(entity);
            return Ok();
        }

        [HttpPost]
        public async Task<IActionResult> CreateAuthorAsync(AuthorDto authorDto)
        {
            var entity = _mapper.Map<Author>(authorDto);
            entity.EntryDate = DateTime.Now;
            await _authorRepository.Add(entity);
            return Ok();
        }
    }
    }
