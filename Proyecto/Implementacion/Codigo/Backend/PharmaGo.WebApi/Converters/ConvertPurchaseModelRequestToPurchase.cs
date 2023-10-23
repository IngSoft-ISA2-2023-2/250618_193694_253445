using PharmaGo.Domain.Entities;
using PharmaGo.WebApi.Models.In;

namespace PharmaGo.WebApi.Converters
{
    public class PurchaseModelRequestToPurchaseConverter
    {

        public Purchase Convert(PurchaseModelRequest model)
        {

            var purchase = new Purchase();
            purchase.PurchaseDate = model.PurchaseDate;
            purchase.BuyerEmail = model.BuyerEmail;
            purchase.details = new List<PurchaseDetail>();
            foreach (var detail in model.Details)
            {
                PurchaseDetail purchesDetail = new PurchaseDetail()
                {
                    Quantity = detail.Quantity,
                    Pharmacy = new()
                    {
                        Id = detail.PharmacyId
                    }
                };
                if (detail.IsProduct) 
                { 
                    purchesDetail.Product = new Product() { Code = detail.Code }; 
                }
                else 
                {
                    purchesDetail.Drug = new Drug(){ Code = detail.Code }; 
                }

                purchase.details.Add(purchesDetail);
            }

            return purchase;
        }

    }
}
