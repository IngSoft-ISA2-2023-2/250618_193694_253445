using PharmaGo.Domain.Entities;

namespace PharmaGo.IBusinessLogic
{
    public interface IProductManager
    {
        Product Edit(int id, Product updatedProduct);
        IEnumerable<Product> GetAllByUser(string token);
        Product Create(Product product, string token);
        Product GetById(int id);
    }
}