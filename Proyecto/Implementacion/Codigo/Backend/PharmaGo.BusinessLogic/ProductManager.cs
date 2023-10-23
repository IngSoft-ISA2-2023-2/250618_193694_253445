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

            var productSaved = _productRepository.GetOneByExpression(p => p.Id == id);

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

        public Product Create(Product product, string token)
        {
            if (product == null)
            {
                throw new ResourceNotFoundException("Please create a product before inserting it.");
            }
            product.ValidOrFail();

            var guidToken = new Guid(token);
            Session session = _sessionRepository.GetOneByExpression(s => s.Token == guidToken);
            var userId = session.UserId;
            User user = _userRepository.GetOneDetailByExpression(u => u.Id == userId);

            Pharmacy pharmacyOfDrug = _pharmacyRepository.GetOneByExpression(p => p.Name == user.Pharmacy.Name);
            if (pharmacyOfDrug == null)
            {
                throw new ResourceNotFoundException("The pharmacy of the drug does not exist.");
            }

            if (_productRepository.Exists(p => p.Code == product.Code && p.Pharmacy.Name == pharmacyOfDrug.Name))
            {
                throw new InvalidResourceException("The drug already exists in that pharmacy.");
            }

            product.Pharmacy.Id = pharmacyOfDrug.Id;
            _productRepository.InsertOne(product);
            _productRepository.Save();
            return product;
        }

        public IEnumerable<Product> GetAllByUser(string token)
        {
            var guidToken = new Guid(token);
            Session session = _sessionRepository.GetOneByExpression(s => s.Token == guidToken);
            var userId = session.UserId;
            User user = _userRepository.GetOneDetailByExpression(u => u.Id == userId);
            Pharmacy pharmacy = user.Pharmacy;
            return _productRepository.GetAllByExpression(p => p.Deleted == false && p.Pharmacy.Id == pharmacy.Id);
        }


        public IEnumerable<Product> GetAll()
        {
            return _productRepository.GetAllByExpression(p => p.Deleted == false);
        }

        public Product GetById(int id)
        {
            Product retrievedProduct = _productRepository.GetOneByExpression(p => p.Id == id);
            if (retrievedProduct == null)
            {
                throw new ResourceNotFoundException("The product does not exist.");
            }

            return retrievedProduct;
        }

        public void Delete(int id)
        {
            var productSaved = _productRepository.GetOneByExpression(d => d.Id == id);
            if (productSaved == null)
            {
                throw new ResourceNotFoundException("The product to delete does not exist.");
            }
            productSaved.Deleted = true;
            _productRepository.UpdateOne(productSaved);
            _productRepository.Save();
        }
    }
}
