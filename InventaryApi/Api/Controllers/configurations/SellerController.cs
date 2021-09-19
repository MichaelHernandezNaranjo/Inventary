using Api.Entities;
using Api.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class SellerController : ControllerBase
    {
        private readonly ISellerService _sellerService;

        public SellerController(ISellerService sellerService)
        {
            _sellerService = sellerService;
        }

        [HttpGet]
        public async Task<response<List<seller>>> GetAll()
        {
            try
            {
                var res = await _sellerService.GetAllSellers();
                return new response<List<seller>> { status = status.ok, data = res };
            }
            catch (Exception ex)
            {
                return new response<List<seller>> { status = status.error, message = ex.Message.ToString()};
            }
            
        }

        [Route("{id}")]
        [HttpGet]
        public async Task<response<seller>> Get(int id)
        {
            try
            {
                var res = await _sellerService.GetSellerById(id);
                return new response<seller> { status = status.ok, data = res };
            }
            catch (Exception ex)
            {
                return new response<seller> { status = status.error, message = ex.Message.ToString() };
            }
        }

        [HttpPost]
        public async Task<response<seller>> Post(sellerRequest seller)
        {
            try
            {
                int _res = await _sellerService.CreateSellerAsync(seller);
                var res = await _sellerService.GetSellerById(_res);
                return new response<seller> { status = status.ok, data = res };
            }
            catch (Exception ex)
            {
                return new response<seller> { status = status.error, message = ex.Message.ToString() };
            }
        }

        [HttpPut]
        public async Task<response<bool>> Put(sellerRequest seller)
        {
            try
            {
                var res = await _sellerService.UpdateSellerAsync(seller);
                return new response<bool> { status = status.ok, data = res };
            }
            catch (Exception ex)
            {
                return new response<bool> { status = status.error, message = ex.Message.ToString() };
            }
        }

        [HttpDelete]
        public async Task<response<bool>> Delete(int id)
        {
            try
            {
                var res = await _sellerService.DeleteSellerAsync(id);
                return new response<bool> { status = status.ok, data = res };
            }
            catch (Exception ex)
            {
                return new response<bool> { status = status.error, message = ex.Message.ToString() };
            }
        }


    }
}
