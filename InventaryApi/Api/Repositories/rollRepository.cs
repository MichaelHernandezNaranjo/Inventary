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
    public interface IRollRepository
    {
        public Task<List<roll>> GetAllAsync();
        public Task<roll> GetByIdAsync(int id);
        public Task<int> CreateAsync(rollRequest roll);
        public Task<bool> UpdateAsync(rollRequest roll);
        public Task<bool> DeleteAsync(int id);
    }

    public class rollRepository : BaseRepository, IRollRepository
    {
        public rollRepository(IConfiguration configuration)
            : base(configuration)
        { }

        public async Task<List<roll>> GetAllAsync()
        {
            try
            {
                var procedure = "SELECT * FROM roll";
                using (var connection = CreateConnection())
                {
                    return (await connection.QueryAsync<roll>(procedure)).ToList();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public async Task<roll> GetByIdAsync(int id)
        {
            try
            {
                var query = "SELECT * FROM roll WHERE rollId = @Id";

                var parameters = new DynamicParameters();
                parameters.Add("Id", id, DbType.Int32);

                using (var connection = CreateConnection())
                {
                    return (await connection.QueryFirstOrDefaultAsync<roll>(query, parameters));
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public async Task<int> CreateAsync(rollRequest entity)
        {
            try
            {
                var query = "INSERT INTO Roll (name, createDate, active) VALUES (@name, @createDate, @active);";
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

        public async Task<bool> UpdateAsync(rollRequest entity)
        {
            try
            {
                var query = "UPDATE roll SET name = @name, active = @active WHERE rollId = @rollId";

                var parameters = new DynamicParameters();
                parameters.Add("name", entity.name, DbType.String);
                parameters.Add("active", entity.active, DbType.Boolean);
                parameters.Add("rollId", entity.rollId, DbType.Int32);

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
                var query = "DELETE FROM roll WHERE rollId = @rollId";

                var parameters = new DynamicParameters();
                parameters.Add("rollId", id, DbType.Int32);

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
