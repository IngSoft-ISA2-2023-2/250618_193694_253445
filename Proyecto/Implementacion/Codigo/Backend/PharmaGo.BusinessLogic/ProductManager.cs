using PharmaGo.Domain.Entities;
using PharmaGo.Exceptions;
using PharmaGo.IBusinessLogic;
using PharmaGo.IDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PharmaGo.BusinessLogic
{
    public class ProductManager : IProductManager
    {
        private readonly IRepository<Product> _productRepository;
        private readonly IRepository<Pharmacy> _pharmacyRepository;
        private readonly IRepository<Session> _sessionRepository;
        private readonly IRepository<User> _userRepository;

        public ProductManager(IRepository<Product> productRepo,
                           IRepository<Pharmacy> pharmacyRepository,
                           IRepository<Session> sessionRespository,
                           IRepository<User> userRespository)
        {
            _productRepository = productRepo;
            _pharmacyRepository = pharmacyRepository;
            _sessionRepository = sessionRespository;
            _userRepository = userRespository;
        }

        public Product Edit(int id, Product updatedProduct)
        {
            if (updatedProduct == null)
            {
                throw new ResourceNotFoundException("The updated product is invalid.");
            }

            updatedProduct.ValidOrFail();

            var productSaved = _productRepository.GetOneByExpression(d => d.Id == id);

            if (productSaved == null)
            {
                throw new ResourceNotFoundException("The product to update does not exist.");
            }

            var existingProductWithSameCode = _productRepository.GetOneByExpression(p => p.Pharmacy.Name == productSaved.Pharmacy.Name && p.Code == updatedProduct.Code);

            if (existingProductWithSameCode != null && existingProductWithSameCode.Id != id)
            {
                throw new InvalidOperationException("Another product with the same code already exists in the pharmacy.");
            }

            productSaved.Code = updatedProduct.Code;
            productSaved.Name = updatedProduct.Name;
            productSaved.Price = updatedProduct.Price;
            productSaved.Description = updatedProduct.Description;

            _productRepository.UpdateOne(productSaved);
            _productRepository.Save();

            return productSaved;
        }


    }
}
