using PharmaGo.Domain.Entities;

namespace PharmaGo.IBusinessLogic
{
    public interface IProductManager
    {
        Product Edit(int id, Product updatedProduct);
    }
}