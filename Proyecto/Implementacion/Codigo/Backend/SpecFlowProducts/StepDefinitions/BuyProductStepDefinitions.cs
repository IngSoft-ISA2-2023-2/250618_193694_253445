using System;
using TechTalk.SpecFlow;
using PharmaGo.DataAccess.Repositories;
using PharmaGo.DataAccess;
using Microsoft.EntityFrameworkCore;
using PharmaGo.Domain.Entities;
using System.Timers;
using PharmaGo.WebApi.Models.In;
using Newtonsoft.Json;
using System.Net.Http.Headers;
using static PharmaGo.WebApi.Models.In.PurchaseModelRequest;
using Microsoft.AspNetCore.Http;
using System.Net;
using PharmaGo.WebApi.Models.Out;

namespace SpecFlowProducts.StepDefinitions
{
    [Binding]
    public class BuyProductStepDefinitions
    {
        private readonly ScenarioContext context;
        private Product _product;
        private int _quantity;
        private int statusCode;
        private Pharmacy _pharmacy;
        private Purchase _responseObject;

        public BuyProductStepDefinitions(ScenarioContext context)
        {
            this.context = context;
            _pharmacy = new Pharmacy()
            {
                Name = "TestPharmacy",
                Address = "test"
            };
            _product = new Product()
            {
                Code = "98798",
                Name = "ProductoTest",
                Price = 50,
                Description = "Este es un producto de test"
            };
            
    }

        [Given(@"a product of a pharmacy")]
        public void GivenAProductOfAPharmacy()
        {
            // Create the product
            DbContextOptions<PharmacyGoDbContext> _options = new DbContextOptionsBuilder<PharmacyGoDbContext>().UseSqlServer("Server=.\\SQLEXPRESS;Database=PharmaGoDb;Trusted_Connection=True; MultipleActiveResultSets=True").Options;
            PharmacyGoDbContext dbContext = new PharmacyGoDbContext(_options);
            PharmacyRepository pharmacyRepository = new PharmacyRepository(dbContext);
            pharmacyRepository.InsertOne(_pharmacy);
            pharmacyRepository.Save();

            _product.Pharmacy = _pharmacy;
            ProductRepository productRepository = new ProductRepository(dbContext);
            productRepository.InsertOne(_product);
            productRepository.Save(); 
        }

        [Given(@"a positive quantity greater than (.*) of it, for example (.*)")]
        public void GivenAPositiveQuantityGreaterThanOfItForExample(int minQuantity, int quantity)
        {
            _quantity = quantity; 
        }


        [When(@"I select add to cart")]
        public async Task WhenISelectAddToCart()
        {
            PurchaseDetailModelRequest purchaseDetailModelRequest = new PurchaseDetailModelRequest()
            {
                PharmacyId = _pharmacy.Id,
                Code = _product.Code, 
                IsProduct = true,
                Quantity = _quantity
            };
            List<PurchaseDetailModelRequest> detailsList = new List<PurchaseDetailModelRequest>();
            detailsList.Add(purchaseDetailModelRequest);

            PurchaseModelRequest purchaseModelRequest = new PurchaseModelRequest()
            {
                BuyerEmail = "juan@gmail.com",
                PurchaseDate = DateTime.Now,
                Details = detailsList
            };
            
            string requestBody = JsonConvert.SerializeObject(purchaseModelRequest);
            // set up Http Request Message
            // ATENCIÓN: Se deberá de modificar el puerto que está en la línea debajo

            var request = new HttpRequestMessage(HttpMethod.Post, $"https://localhost:7186/api/purchases")
            {
                Content = new StringContent(requestBody)
                {
                    Headers =
                        {
                          ContentType = new MediaTypeHeaderValue("application/json")
                        }
                }
            };

            string authToken = "e9e0e1e9-3812-4eb5-949e-ae92ac931401";
            request.Headers.Authorization = new AuthenticationHeaderValue(authToken);

            // create an http client
            var client = new HttpClient();
            // let's post
            Console.WriteLine("DAS!3");
            Console.WriteLine(request);
            var response = await client.SendAsync(request).ConfigureAwait(false);
            try
            {
                this.statusCode = (int)response.StatusCode;
                string _responseContent = await response.Content.ReadAsStringAsync();
                Console.WriteLine(_responseContent);
                this._responseObject = (Purchase)JsonConvert.DeserializeObject<Purchase>(_responseContent);
            }
            finally
            {
                // move along, move along
            }
        }


        [Then(@"the product is added to the purchase with that quantity with code (.*)")]
        public void ThenTheProductIsAddedToThePurchaseWithThatQuantityWithCode(int statusCode)
        {
            Assert.AreEqual(statusCode, this.statusCode);
            DbContextOptions<PharmacyGoDbContext> _options = new DbContextOptionsBuilder<PharmacyGoDbContext>().UseSqlServer("Server=.\\SQLEXPRESS;Database=PharmaGoDb;Trusted_Connection=True; MultipleActiveResultSets=True").Options;
            PharmacyGoDbContext dbContext = new PharmacyGoDbContext(_options);

            PurchasesDetailRepository purchasesDetailRepository = new PurchasesDetailRepository(dbContext);
            PurchaseDetail purchaseDetailAdded = purchasesDetailRepository.GetOneByExpression(p => p.Id == this._responseObject.Id);
            purchasesDetailRepository.DeleteOne(purchaseDetailAdded);
            purchasesDetailRepository.Save();
        }

        [Given(@"a negative quantity, for example (.*)")]
        public void GivenANegativeQuantityForExample(int quantity)
        {
            _quantity = quantity;
        }

        [Then(@"it does not add to cart since the quantity is not valid with code (.*)")]
        public void ThenItDoesNotAddToCartSinceTheQuantityIsNotValidWithCode(int statusCode)
        {
            Assert.AreEqual(statusCode, this.statusCode);
        }


    }
}
 