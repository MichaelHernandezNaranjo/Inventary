using Api.Entities;
using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Repositories
{
    public interface IInvoiceRepository
    {
        Task<string> CreateAsync(invoiceRequest invoiceRequest);
    }

    public class invoiceRepository : BaseRepository, IInvoiceRepository
    {
        public invoiceRepository(IConfiguration configuration)
            : base(configuration)
        { }

        public async Task<string> CreateAsync(invoiceRequest invoiceRequest)
        {
            try
            {
                string documentId = await NextNumeration(invoiceRequest.documentType);
                if(string.IsNullOrEmpty(documentId)) throw new Exception("No hay numeración disponible");
                string businessPartnerType = (invoiceRequest.documentType == "FAV" ? "C" : "P");
                bool active = true;
                var query = "INSERT INTO invoice (documentId,documentType,documentDate,businessPartnerId,businessPartnerType,sellerId,branchId,createDate,active) ";
                query += "VALUES (@documentId,@documentType,@documentDate,@businessPartnerId,@businessPartnerType,@sellerId,@branchId,@createDate,@active);";
                var parameters = new DynamicParameters();
                parameters.Add("documentId", documentId, DbType.String);
                parameters.Add("documentType", invoiceRequest.documentType, DbType.String);
                parameters.Add("documentDate", invoiceRequest.documentDate, DbType.Date);
                parameters.Add("businessPartnerId", invoiceRequest.businessPartnerId, DbType.Int32);
                parameters.Add("businessPartnerType", businessPartnerType, DbType.String);
                parameters.Add("sellerId", invoiceRequest.sellerId, DbType.Int32);
                parameters.Add("branchId", invoiceRequest.branchId, DbType.Int32);
                parameters.Add("createDate", DateTime.Now, DbType.DateTime);
                parameters.Add("active", active, DbType.Boolean);
                
                using (var connection = CreateConnection())
                {
                    connection.Open();
                    
                    using (var transaction = connection.BeginTransaction())
                    {
                        var res = connection.Execute(query, parameters, transaction: transaction);
                        int documentLine = 0;
                        foreach (var item in invoiceRequest.Details)
                        {
                            documentLine += 1;
                            var query2 = "INSERT INTO invoiceDetail (documentId,documentLine,itemId,quantity,price,discount,warehouseId) VALUES (@documentId,@documentLine,@itemId,@quantity,@price,@discount,@warehouseId);";
                            var parameters2 = new DynamicParameters();
                            parameters2.Add("documentId", documentId, DbType.String);
                            parameters2.Add("documentLine", documentLine, DbType.Int32);
                            parameters2.Add("itemId", item.itemId, DbType.String);
                            parameters2.Add("quantity", item.quantity, DbType.Int32);
                            parameters2.Add("price", item.price, DbType.Decimal);
                            parameters2.Add("discount", item.discount, DbType.Decimal);
                            parameters2.Add("warehouseId", item.warehouseId, DbType.String);
                            var res2 = connection.Execute(query2, parameters2, transaction: transaction);
                        }
                        transaction.Commit();
                        connection.Dispose();
                    }
                    return documentId;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }
        public async Task<string> NextNumeration(string documentType)
        {
            try
            {
                var query = $"select documentId from numeration where numerationMax > documentId and documentType = '{documentType}';";
                using (var connection = CreateConnection())
                {
                    string res = await connection.QueryFirstOrDefaultAsync<string>(query);
                    if (!string.IsNullOrEmpty(res))
                    {
                        var num = Convert.ToInt64(res) + 1;
                        return num.ToString().PadLeft(res.Length, '0');
                    }
                    else
                    {
                        return null;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }


    }
}
