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
    public interface ISellerRepository
    {
        public Task<List<seller>> GetAllAsync();
        public Task<seller> GetByIdAsync(int id);
        public Task<int> CreateAsync(sellerRequest roll);
        public Task<bool> UpdateAsync(sellerRequest roll);
        public Task<bool> DeleteAsync(int id);
    }

    public class sellerRepository : BaseRepository, ISellerRepository
    {
        public sellerRepository(IConfiguration configuration)
            : base(configuration)
        { }

        public async Task<List<seller>> GetAllAsync()
        {
            try
            {
                var procedure = "SELECT * FROM seller";
                using (var connection = CreateConnection())
                {
                    return (await connection.QueryAsync<seller>(procedure)).ToList();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public async Task<seller> GetByIdAsync(int id)
        {
            try
            {
                var query = "SELECT * FROM seller WHERE sellerId = @Id";

                var parameters = new DynamicParameters();
                parameters.Add("Id", id, DbType.Int32);

                using (var connection = CreateConnection())
                {
                    return (await connection.QueryFirstOrDefaultAsync<seller>(query, parameters));
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public async Task<int> CreateAsync(sellerRequest entity)
        {
            try
            {
                var query = "INSERT INTO Seller (name, createDate, active) VALUES (@name, @createDate, @active);";
                query += "SELECT CAST(SCOPE_IDENTITY() as int);";

                var parameters = new DynamicParameters();
                parameters.Add("name", entity.name, DbType.String);
                parameters.Add("createDate", DateTime.Now, DbType.DateTime);
                parameters.Add("active", entity.active, DbType.Boolean);

                using (var connection = CreateConnection())
                {
                    return (await connection.QueryAsync<int>(query, parameters)).Single();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public async Task<bool> UpdateAsync(sellerRequest entity)
        {
            try
            {
                var query = "UPDATE seller SET name = @name, active = @active WHERE sellerId = @sellerId";

                var parameters = new DynamicParameters();
                parameters.Add("name", entity.name, DbType.String);
                parameters.Add("active", entity.active, DbType.Boolean);
                parameters.Add("sellerId", entity.sellerId, DbType.Int32);

                using (var connection = CreateConnection())
                {
                    return (await connection.ExecuteAsync(query, parameters)) > 0;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public async Task<bool> DeleteAsync(int id)
        {
            try
            {
                var query = "DELETE FROM seller WHERE sellerId = @sellerId";

                var parameters = new DynamicParameters();
                parameters.Add("sellerId", id, DbType.Int32);

                using (var connection = CreateConnection())
                {
                    return (await connection.ExecuteAsync(query, parameters)) > 0;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }
    }
}
