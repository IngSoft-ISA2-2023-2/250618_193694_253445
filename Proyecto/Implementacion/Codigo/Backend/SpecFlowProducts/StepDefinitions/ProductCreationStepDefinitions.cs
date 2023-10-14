using Microsoft.AspNetCore.Http;
using Microsoft.Build.Evaluation;
using Newtonsoft.Json;
using PharmaGo.Domain;
using PharmaGo.Domain.Entities;
using PharmaGo.WebApi.Models.In;
using System;
using System.Net;
using System.Net.Http.Headers;
using TechTalk.SpecFlow;

namespace SpecFlowProducts.StepDefinitions
{
    [Binding]
    public class ProductCreationStepDefinitions
    {
        private readonly ScenarioContext context;
        private readonly ProductModel _productModel = new ProductModel();


        public ProductCreationStepDefinitions(ScenarioContext context)
        {
            this.context = context;
        }

        [Given(@"the code ""(.*)""")]
        public void GivenTheCode(string code)
        {
            _productModel.Code = code;
        }

        [Given(@"the name ""([^""]*)""")]
        public void GivenTheName(string name)
        {
            _productModel.Name = name;
        }

        [Given(@"the description  ""([^""]*)""")]
        public void GivenTheDescription(string description)
        {
            _productModel.Description = description;
        }

        [Given(@"the price (.*)")]
        public void GivenThePrice(Decimal price)
        {
            _productModel.Price = price;
        }

        [Given(@"the pharmacy ""([^""]*)""")]
        public void GivenThePharmacy(string pharmacyName)
        {
            _productModel.PharmacyName = pharmacyName;
        }


        [When(@"press the create button")]
        public async Task WhenPressTheCreateButtonAsync()
        {
            string requestBody = JsonConvert.SerializeObject(_productModel);

            // set up Http Request Message
            // ATENCIÓN: Se deberá de modificar el puerto que está en la línea debajo
            var request = new HttpRequestMessage(HttpMethod.Post, $"https://localhost:7186/api/Product")
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
            request.Headers.Authorization = new AuthenticationHeaderValue("Authorization", authToken);

            // create an http client
            var client = new HttpClient();
            // let's post
            var response = await client.SendAsync(request).ConfigureAwait(false);
            try
            {
                context.Set(response.StatusCode, "ResponseStatusCode");
            }
            finally
            {
                // move along, move along
            }
        }


        [Then(@"the product should be registered correctly with code (.*)")]
        public void ThenTheProductShouldBeRegisteredCorrectlyWithCode(int statusCode)
        {
            Assert.AreEqual(statusCode, (int)context.Get<HttpStatusCode>("ResponseStatusCode"));
        }


    }
}
