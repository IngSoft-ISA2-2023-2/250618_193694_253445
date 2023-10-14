using PharmaGo.Exceptions;

namespace PharmaGo.Domain.Entities
{
    public class Product
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }
        public bool Deleted { get; set; }
        public Pharmacy? Pharmacy { get; set; }


        public Product()
        {
        
        }
        public void ValidOrFail()
        {
            if (string.IsNullOrEmpty(Code) || string.IsNullOrEmpty(Name) || string.IsNullOrEmpty(Description)
                    || Price <= 0 || Pharmacy == null)
            {
                throw new InvalidResourceException("The product was not correctly created.");
            }
            if (Name.Length > 30)
            {
                throw new InvalidResourceException("The product name is incorrect, length should be lower that 30 characters");
            }
            if (Description.Length > 70)
            {
                throw new InvalidResourceException("The product description is incorrect, length should be lower that 70 characters");
            }
        }
    }
}



