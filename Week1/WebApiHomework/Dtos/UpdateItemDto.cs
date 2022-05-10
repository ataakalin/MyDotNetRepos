using System.ComponentModel.DataAnnotations;

namespace WebApiHomework.Dtos
{
    public record UpdateItemDto
    {
        [Required]
        public string Name { get; init; }
        [Required]
        [Range (0, 10000)]
        public decimal Price { get; init; }
    }
}
