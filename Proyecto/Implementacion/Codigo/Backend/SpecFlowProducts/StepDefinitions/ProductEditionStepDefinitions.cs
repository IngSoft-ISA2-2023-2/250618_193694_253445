using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using PharmaGo.Domain.Entities;
using PharmaGo.WebApi.Models.In;
using PharmaGo.WebApi.Models.Out;
using System;
using System.Net;
using System.Net.Http.Headers;
using TechTalk.SpecFlow;

namespace SpecFlowProducts.StepDefinitions
{
    [Binding]
    public class ProductEditionStepDefinitions
    {
        private readonly ScenarioContext context;
        private readonly UpdateProductModel _productModel = new UpdateProductModel();
        private Product _responseObject;
        private string _responseContent;
        private int productId;

        public ProductEditionStepDefinitions(ScenarioContext context)
        {
            this.context = context;
        }


        [Given(@"the product with id (.*)")]
        public void GivenTheProductWithId(int id)
        {
            this.productId = id;
        }

        [Given(@"code ""([^""]*)""")]
        public void GivenCode(string code)
        {
            this._productModel.Code = code;
        }

        [Given(@"name ""([^""]*)""")]
        public void GivenName(string name)
        {
            this._productModel.Name = name;
        }

        [Given(@"description ""([^""]*)""")]
        public void GivenDescription(string description)
        {
            this._productModel.Description = description;
        }

        [Given(@"price as (.*)")]
        public void GivenPriceAs(Decimal price)
        {
            this._productModel.Price = price;
        }

        [When(@"I press the ""([^""]*)"" button for that product, I should be able to modify the name to ""([^""]*)"" and the description to ""([^""]*)""")]
        public void WhenIPressTheButtonForThatProductIShouldBeAbleToModifyTheNameToAndTheDescriptionTo(string modify, string name, string description)
        {
            this._productModel.Name = name;
            this._productModel.Description = description;

        }

        [When(@"I save the changes")]
        public async Task WhenISaveTheChangesAsync()
        {
            string requestBody = JsonConvert.SerializeObject(_productModel);
            // set up Http Request Message
            // ATENCIÓN: Se deberá de modificar el puerto que está en la línea debajo
            var request = new HttpRequestMessage(HttpMethod.Put, $"https://localhost:7186/api/Product/{productId}")
            {
                Content = new StringContent(requestBody)
                {
                    Headers =
                        {
                          ContentType = new MediaTypeHeaderValue("application/json")
                        }
                }
            };

            string authToken = "6894f240-7775-4a03-a309-612c9e208ba3";
            request.Headers.Authorization = new AuthenticationHeaderValue(authToken);

            // create an http client
            var client = new HttpClient();
            // let's put
            var response = await client.SendAsync(request).ConfigureAwait(false);
            try
            {
                context.Set(response.StatusCode, "ResponseStatusCode");
                _responseContent = await response.Content.ReadAsStringAsync();
                Console.WriteLine(_responseContent);
                this._responseObject = (Product)JsonConvert.DeserializeObject<Product>(_responseContent);
            }
            finally
            {
                // move along, move along
            }
        }

        [Then(@"the product should be edited correctly with code (.*)")]
        public void ThenTheProductShouldBeEditedCorrectlyWithCode(int statusCode)
        {
            Assert.AreEqual(statusCode, (int)context.Get<HttpStatusCode>("ResponseStatusCode"));
            Assert.AreEqual(this._responseObject.Name, this._productModel.Name);
            Assert.AreEqual(this._responseObject.Description, this._productModel.Description);
            Assert.AreEqual(this._responseObject.Code, this._productModel.Code);
        }
    }
}
