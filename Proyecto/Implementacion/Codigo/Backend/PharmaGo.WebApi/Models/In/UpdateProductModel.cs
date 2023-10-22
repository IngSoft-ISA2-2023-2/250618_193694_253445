using PharmaGo.Domain.Entities;
using PharmaGo.Domain.Enums;

namespace PharmaGo.WebApi.Models.In
{
    public class UpdateProductModel
    {
        public string Code { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }

        public Product ToEntity()
        {
            return new Product()
            {
                Code = this.Code,
                Name = this.Name,
                Price = this.Price,
                Description = this.Description,
                Pharmacy = new Pharmacy(),
            };
        }
    }
}
