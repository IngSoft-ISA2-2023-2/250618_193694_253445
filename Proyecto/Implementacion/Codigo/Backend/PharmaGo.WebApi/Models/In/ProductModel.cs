﻿using PharmaGo.Domain.Entities;

namespace PharmaGo.WebApi.Models.In
{
    public class ProductModel
    {
        public string Code { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }
        public string PharmacyName { get; set; }

        public Product ToEntity()
        {
            return new Product()
            {
                Code = this.Code,
                Name = this.Name,
                Price = this.Price,
                Description = this.Description,
                Deleted = false,
                Pharmacy = new Pharmacy() { Name = this.PharmacyName }
            };
        }

    }
}


