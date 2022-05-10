using AutoMapper;
using WebApiWeek2.Dtos;
using WebApiWeek2.Models;

namespace WebApiWeek2.Mapping
{
    public class MappingProfile:Profile
    {
        public MappingProfile() //dto için mapping işlemleri
        {
            CreateMap<Book, BookDto>().ReverseMap();
            CreateMap<Author, AuthorDto>().ReverseMap();
        }
    }
}
