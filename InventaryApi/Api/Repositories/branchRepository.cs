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
    public interface IBranchRepository
    {
        public Task<List<branch>> GetAllAsync();
        public Task<branch> GetByIdAsync(int id);
        public Task<int> CreateAsync(branchRequest roll);
        public Task<bool> UpdateAsync(branchRequest roll);
        public Task<bool> DeleteAsync(int id);
    }

    public class branchRepository : BaseRepository, IBranchRepository
    {
        public branchRepository(IConfiguration configuration)
            : base(configuration)
        { }

        public async Task<List<branch>> GetAllAsync()
        {
            try
            {
                var query = "SELECT branch.branchId,branch.name,branch.cityId,city.cityName,branch.address,branch.email,branch.phone1,branch.phone2,branch.createDate,branch.active FROM branch";
                query += "inner join city on (city.cityId = branch.cityId)";
                using (var connection = CreateConnection())
                {
                    return (await connection.QueryAsync<branch>(query)).ToList();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public async Task<branch> GetByIdAsync(int id)
        {
            try
            {
                var query = "SELECT branch.branchId,branch.name,branch.cityId,city.cityName,branch.address,branch.email,branch.phone1,branch.phone2,branch.createDate,branch.active FROM branch";
                query += "inner join city on (city.cityId = branch.cityId)";
                query += "WHERE branch.branchId = @Id";
                var parameters = new DynamicParameters();
                parameters.Add("Id", id, DbType.Int32);

                using (var connection = CreateConnection())
                {
                    return (await connection.QueryFirstOrDefaultAsync<branch>(query, parameters));
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public async Task<int> CreateAsync(branchRequest entity)
        {
            try
            {
                var query = "INSERT INTO Branch (name,cityId,address,email,phone1,phone2,createDate,active) VALUES (@name,@cityId,@address,@email,@phone1,@phone2,@createDate,@active);";
                query += "SELECT CAST(SCOPE_IDENTITY() as int);";

                var parameters = new DynamicParameters();
                parameters.Add("name", entity.name, DbType.String);
                parameters.Add("cityId", entity.cityId, DbType.Int32);
                parameters.Add("address", entity.address, DbType.String);
                parameters.Add("email", entity.email, DbType.String);
                parameters.Add("phone1", entity.phone1, DbType.String);
                parameters.Add("phone2", entity.phone2, DbType.String);
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

        public async Task<bool> UpdateAsync(branchRequest entity)
        {
            try
            {
                var query = "UPDATE branch SET name=@name, cityId=@cityId, address=@address, email=@email, phone1=@phone1, phone2=@phone2, active=@active WHERE branchId = @branchId";

                var parameters = new DynamicParameters();
                parameters.Add("name", entity.name, DbType.String);
                parameters.Add("cityId", entity.cityId, DbType.Int32);
                parameters.Add("address", entity.address, DbType.String);
                parameters.Add("email", entity.email, DbType.String);
                parameters.Add("phone1", entity.phone1, DbType.String);
                parameters.Add("phone2", entity.phone2, DbType.String);
                parameters.Add("active", entity.active, DbType.Boolean);
                parameters.Add("branchId", entity.branchId, DbType.Int32);

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
                var query = "DELETE FROM branch WHERE branchId = @branchId";

                var parameters = new DynamicParameters();
                parameters.Add("branchId", id, DbType.Int32);

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
