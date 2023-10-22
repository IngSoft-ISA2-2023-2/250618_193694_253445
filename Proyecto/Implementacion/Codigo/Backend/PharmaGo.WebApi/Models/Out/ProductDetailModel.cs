using PharmaGo.Domain.Entities;
using PharmaGo.Domain.Enums;

namespace PharmaGo.WebApi.Models.Out
{
    public class ProductDetailModel
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }
        public PharmacyBasicModel Pharmacy { get; set; }

        public ProductDetailModel(Product product)
        {
            Id = product.Id;
            Code = product.Code;
            Name = product.Name;
            Price = product.Price;
            Description = product.Description;
            Pharmacy = new PharmacyBasicModel(product.Pharmacy);
        }
    }
}
