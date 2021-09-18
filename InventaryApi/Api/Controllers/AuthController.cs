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
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private IAuthService _authService;

        public AuthController(IAuthService authService)
        {
            _authService = authService;
        }

        [AllowAnonymous]
        [HttpPost]
        public async Task<response<user>> Authenticate([FromBody] AuthenticateModel model)
        {
            try
            {
                var res = await _authService.Authenticate(model.userId, model.password);
                if (res == null)
                {
                    return new response<user> { status = status.error, message = "Usuario y/o contraseña incorecto!" };
                }
                else
                {
                    return new response<user> { status = status.ok, data = res };
                }
            }
            catch (Exception ex)
            {
                return new response<user> { status = status.error, message = ex.Message };
            }
        }
    }

    public class AuthenticateModel
    {
        public string userId { get; set; }
        public string password { get; set; }
    }
}
