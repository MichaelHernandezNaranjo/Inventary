using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Entities
{
    public class invoice
    {
        public string documentId { get; set; }
        public string documentType { get; set; }
        public DateTime documentDate { get; set; }
        public string businessPartnerId { get; set; }
        public string businessPartnerType { get; set; }
        public string businessPartnerName { get; set; }
        public string identificationNumber { get; set; }
        public string typeIdentificationId { get; set; }
        public int cityId { get; set; }
        public string address { get; set; }
        public string email { get; set; }
        public string phone1 { get; set; }
        public string phone2 { get; set; }
        public int? sellerId { get; set; }
        public string sellerName { get; set; }
        public string comment { get; set; }
        public int branchId { get; set; }
        public List<invoiceDetails> Details { get; set; }
    }
    public class invoiceDetails
    {
        public string itemId { get; set; }
        public int quantity { get; set; }
        public decimal price { get; set; }
        public decimal discount { get; set; }
        public int warehouseId { get; set; }
    }
    public class invoiceRequest
    {
        public string documentType { get; set; }
        public DateTime? documentDate { get; set; }
        public int businessPartnerId { get; set; }
        public int? sellerId { get; set; }
        public string comment { get; set; }
        public int branchId { get; set; }
        public List<invoiceDetailsRequest> Details { get; set; }
    }
    public class invoiceDetailsRequest
    {
        public string itemId { get; set; }
        public int quantity { get; set; }
        public decimal price { get; set; }
        public decimal discount { get; set; }
        public int warehouseId { get; set; }
    }
}
