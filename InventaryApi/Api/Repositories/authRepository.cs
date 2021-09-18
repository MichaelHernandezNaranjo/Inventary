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
    public interface IAuthRepository
    {
        Task<user> Authenticate(string userId, string password);
        Task<authorization> Authorization(string userName, string password);
    }
    public class authRepository : BaseRepository, IAuthRepository
    {
        public authRepository(IConfiguration configuration)
            : base(configuration)
        { }
        public async Task<user> Authenticate(string userId, string password)
        {
            try
            {
                var query = "SELECT userId, name, email FROM [user] WHERE userId = @userId and password = @password";
                var parameters = new DynamicParameters();
                parameters.Add("userId", userId, DbType.String);
                parameters.Add("password", password, DbType.String);
                using (var connection = CreateConnection())
                {
                    user res = await connection.QueryFirstOrDefaultAsync<user>(query, parameters);
                    return res;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }

        public async Task<authorization> Authorization(string userName, string password)
        {
            try
            {
                var query = "SELECT userName, password FROM [authorization] WHERE userName = @userName and password = @password";
                var parameters = new DynamicParameters();
                parameters.Add("userName", userName, DbType.String);
                parameters.Add("password", password, DbType.String);
                using (var connection = CreateConnection())
                {
                    var res = await connection.QueryFirstOrDefaultAsync<authorization>(query, parameters);
                    return res;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
        }
    }
}
