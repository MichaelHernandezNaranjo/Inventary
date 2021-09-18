using Api.Entities;
using Api.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Services
{
    public interface IInvoiceService
    {
        Task<string> CreateAsync(invoiceRequest invoiceRequest);
    }
    public class invoiceService: IInvoiceService
    {
        private readonly IInvoiceRepository _invoiceRepository;

        public invoiceService(IInvoiceRepository invoiceRepository)
        {
            _invoiceRepository = invoiceRepository;
        }

        public async Task<string> CreateAsync(invoiceRequest invoiceRequest)
        {
            #region Filtros
            if (invoiceRequest.businessPartnerId == 0) throw new Exception("El socio de negocio es requerido 'businessPartnerId'.");
            if (invoiceRequest.Details.Count == 0) throw new Exception("No se encontro el detalle de la factura");
            #endregion
            if (invoiceRequest.documentDate == null) invoiceRequest.documentDate = DateTime.Now;

            return await _invoiceRepository.CreateAsync(invoiceRequest);
        }
    }
}
