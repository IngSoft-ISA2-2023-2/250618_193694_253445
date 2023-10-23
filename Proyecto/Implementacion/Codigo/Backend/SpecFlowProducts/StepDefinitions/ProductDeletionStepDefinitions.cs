using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using PharmaGo.DataAccess.Repositories;
using PharmaGo.DataAccess;
using PharmaGo.Domain.Entities;
using PharmaGo.WebApi.Models.In;
using System;
using System.Net;
using System.Net.Http.Headers;
using TechTalk.SpecFlow;
using Microsoft.EntityFrameworkCore;

namespace SpecFlowProducts.StepDefinitions
{


    [Binding]
    public class ProductDeletionStepDefinitions
    {
        private readonly ScenarioContext context;
        private readonly ProductModel _productModel = new ProductModel();
        private Boolean responseObject;
        private string _responseContent;
        private int _productId;
        private ProductRepository _productRepository;
        private Product _prod;

        public ProductDeletionStepDefinitions(ScenarioContext context)
        {
            this.context = context;
        }

        [Given(@"the product registered in my pharmacy with id (.*)")]
        public void GivenTheProductRegisteredInMyPharmacyWithId(int id)
        {
            _productId = id;
            DbContextOptions<PharmacyGoDbContext> _options = new DbContextOptionsBuilder<PharmacyGoDbContext>().UseSqlServer("Server=.\\SQLEXPRESS;Database=PharmaGoDb;Trusted_Connection=True; MultipleActiveResultSets=True").Options;
            PharmacyGoDbContext dbContext = new PharmacyGoDbContext(_options);
            _productRepository = new ProductRepository(dbContext);
            _prod = new Product() { Id = id, Code = "12345", Name = "Shampoo", Description = "pelo lacio", Deleted = false, Price = 80};
            _productRepository.InsertOne(_prod);
            _productRepository.Save();
        }

        [When(@"press the delete button for that product")]
        public async void WhenPressTheDeleteButtonForThatProduct()
        {
            // set up Http Request Message
            // ATENCIÓN: Se deberá de modificar el puerto que está en la línea debajo
            
            var request = new HttpRequestMessage(HttpMethod.Delete, $"https://localhost:7186/api/Product/{_productId}")
            {
            };

            string authToken = "e9e0e1e9-3812-4eb5-949e-ae92ac931401";
            request.Headers.Authorization = new AuthenticationHeaderValue(authToken);

            // create an http client
            var client = new HttpClient();
            // let's post
            var response = await client.SendAsync(request).ConfigureAwait(false);
            try
            {
                context.Set(response.StatusCode, "ResponseStatusCode");
                _responseContent = await response.Content.ReadAsStringAsync();
                this.responseObject = (Boolean)JsonConvert.DeserializeObject<Boolean>(_responseContent);
            }
            finally
            {
                // move along, move along
            }
        }

        [Then(@"the product should be deleted correctly")]
        public void ThenTheProductShouldBeDeletedCorrectly()
        {
            _productRepository.DeleteOne(_prod);
            _productRepository.Save();
            Assert.AreEqual(200, (int)context.Get<HttpStatusCode>("ResponseStatusCode"));
        }

        [Given(@"the product not registered in my pharmacy with id (.*)")]
        public void GivenTheProductNotRegisteredInMyPharmacyWithId(int id)
        {
            _productId = id;
            DbContextOptions<PharmacyGoDbContext> _options = new DbContextOptionsBuilder<PharmacyGoDbContext>().UseSqlServer("Server=.\\SQLEXPRESS;Database=PharmaGoDb;Trusted_Connection=True; MultipleActiveResultSets=True").Options;
            PharmacyGoDbContext dbContext = new PharmacyGoDbContext(_options);
            ProductRepository productRepository = new ProductRepository(dbContext);
            productRepository.Save();
        }

        [Then(@"the product should not be deleted")]
        public void ThenTheProductShouldNotBeDeleted()
        {
            Assert.AreEqual(400, (int)context.Get<HttpStatusCode>("ResponseStatusCode"));
        }
    }
}
