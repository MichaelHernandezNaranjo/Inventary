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
    public class InvoiceController : ControllerBase
    {
        private readonly IInvoiceService _invoiceService;

        public InvoiceController(IInvoiceService invoiceService)
        {
            _invoiceService = invoiceService;
        }

        [HttpPost]
        public async Task<response<string>> Post(invoiceRequest invoiceRequest)
        {
            try
            {
                string res = await _invoiceService.CreateAsync(invoiceRequest);
                return new response<string> { status = status.ok, data = res };
            }
            catch (Exception ex)
            {
                return new response<string> { status = status.error, message = ex.Message.ToString() };
            }
        }
    }
}
