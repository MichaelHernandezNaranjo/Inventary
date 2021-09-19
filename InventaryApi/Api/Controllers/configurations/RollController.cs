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
    public class RollController : ControllerBase
    {
        private readonly IRollService _rollService;

        public RollController(IRollService rollService)
        {
            _rollService = rollService;
        }

        [HttpGet]
        public async Task<response<List<roll>>> GetAll()
        {
            try
            {
                var res = await _rollService.GetAllRolls();
                return new response<List<roll>> { status = status.ok, data = res };
            }
            catch (Exception ex)
            {
                return new response<List<roll>> { status = status.error, message = ex.Message.ToString()};
            }
            
        }

        [Route("{id}")]
        [HttpGet]
        public async Task<response<roll>> Get(int id)
        {
            try
            {
                var res = await _rollService.GetRollById(id);
                return new response<roll> { status = status.ok, data = res };
            }
            catch (Exception ex)
            {
                return new response<roll> { status = status.error, message = ex.Message.ToString() };
            }
        }

        [HttpPost]
        public async Task<response<roll>> Post(rollRequest roll)
        {
            try
            {
                int _res = await _rollService.CreateRollAsync(roll);
                var res = await _rollService.GetRollById(_res);
                return new response<roll> { status = status.ok, data = res };
            }
            catch (Exception ex)
            {
                return new response<roll> { status = status.error, message = ex.Message.ToString() };
            }
        }

        [HttpPut]
        public async Task<response<bool>> Put(rollRequest roll)
        {
            try
            {
                var res = await _rollService.UpdateRollAsync(roll);
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
                var res = await _rollService.DeleteRollAsync(id);
                return new response<bool> { status = status.ok, data = res };
            }
            catch (Exception ex)
            {
                return new response<bool> { status = status.error, message = ex.Message.ToString() };
            }
        }


    }
}
