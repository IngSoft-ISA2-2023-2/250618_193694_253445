using PharmaGo.Exceptions;
using System;
using System.Text.RegularExpressions;

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
            if (Code.Length != 5 || !isNumeric(Code))
            {
                throw new InvalidResourceException("The code must have a length of 5 digits");

            }
            if (Name.Length > 30 || !isAlphaNumeric(Name))
            {
                throw new InvalidResourceException("The product name is incorrect, length should be lower that 30 characters and alphanumeric");
            }
            if (Description.Length > 70 || !isAlphaNumeric(Description))
            {
                throw new InvalidResourceException("The product description is incorrect, length should be lower that 70 characters and alphanumeric");
            }
        }

        private static bool isAlphaNumeric(string strToCheck)
        {
            Regex rg = new Regex(@"^[a-zA-Z0-9\s,]*$");
            return rg.IsMatch(strToCheck);
        }

        private static bool isNumeric(string strToCheck)
        {
            Regex rg = new Regex(@"^[0-9]*$");
            return rg.IsMatch(strToCheck);
        }
    }
}