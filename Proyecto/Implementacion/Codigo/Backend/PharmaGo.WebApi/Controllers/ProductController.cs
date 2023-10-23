using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NuGet.Common;
using PharmaGo.BusinessLogic;
using PharmaGo.Domain.Entities;
using PharmaGo.IBusinessLogic;
using PharmaGo.WebApi.Enums;
using PharmaGo.WebApi.Filters;
using PharmaGo.WebApi.Models.In;
using PharmaGo.WebApi.Models.Out;

namespace PharmaGo.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [TypeFilter(typeof(ExceptionFilter))]
    public class ProductController : Controller
    {
        private readonly IProductManager _productManager;


        public ProductController(IProductManager manager)
        {
            _productManager = manager;
        }

        [HttpPut("{id}")]
        [AuthorizationFilter(new string[] { nameof(RoleType.Employee) })]
        public IActionResult Edit([FromRoute] int id, [FromBody] UpdateProductModel updatedProduct)
        {
            Product product = _productManager.Edit(id, updatedProduct.ToEntity());
            return Ok(new ProductDetailModel(product));
        }

        [HttpGet]
        [Route("[action]")]
        [AuthorizationFilter(new string[] { nameof(RoleType.Employee) })]
        public IActionResult User()
        {
            string token = HttpContext.Request.Headers["Authorization"];
            IEnumerable<Product> products = _productManager.GetAllByUser(token);
            IEnumerable<ProductDetailModel> productsToReturn = products.Select(d => new ProductDetailModel(d));
            return Ok(productsToReturn);
        }

        [HttpGet("{id}")]

        public IActionResult GetById([FromRoute] int id)
        {
            Product product = _productManager.GetById(id);
            return Ok(new ProductDetailModel(product));
        }

        [HttpPost]
        [AuthorizationFilter(new string[] { nameof(RoleType.Employee) })]
        public IActionResult Create([FromBody] ProductModel productModel)
        {
            string token = HttpContext.Request.Headers["Authorization"];
            Product productCreated = _productManager.Create(productModel.ToEntity(), token);
            ProductDetailModel productResponse = new ProductDetailModel(productCreated);
            return Ok(productResponse);
        }

        [HttpDelete("{id}")]
        [AuthorizationFilter(new string[] { nameof(RoleType.Employee) })]
        public IActionResult Delete([FromRoute] int id)
        {
            _productManager.Delete(id);
            return Ok(true);
        }
    }
}
