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
    public class BranchController : ControllerBase
    {
        private readonly IBranchService _branchService;

        public BranchController(IBranchService branchService)
        {
            _branchService = branchService;
        }

        [HttpGet]
        public async Task<response<List<branch>>> GetAll()
        {
            try
            {
                var res = await _branchService.GetAllBranchs();
                return new response<List<branch>> { status = status.ok, data = res };
            }
            catch (Exception ex)
            {
                return new response<List<branch>> { status = status.error, message = ex.Message.ToString()};
            }
            
        }

        [Route("{id}")]
        [HttpGet]
        public async Task<response<branch>> Get(int id)
        {
            try
            {
                var res = await _branchService.GetBranchById(id);
                return new response<branch> { status = status.ok, data = res };
            }
            catch (Exception ex)
            {
                return new response<branch> { status = status.error, message = ex.Message.ToString() };
            }
        }

        [HttpPost]
        public async Task<response<branch>> Post(branchRequest branch)
        {
            try
            {
                int _res = await _branchService.CreateBranchAsync(branch);
                var res = await _branchService.GetBranchById(_res);
                return new response<branch> { status = status.ok, data = res };
            }
            catch (Exception ex)
            {
                return new response<branch> { status = status.error, message = ex.Message.ToString() };
            }
        }

        [HttpPut]
        public async Task<response<bool>> Put(branchRequest branch)
        {
            try
            {
                var res = await _branchService.UpdateBranchAsync(branch);
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
                var res = await _branchService.DeleteBranchAsync(id);
                return new response<bool> { status = status.ok, data = res };
            }
            catch (Exception ex)
            {
                return new response<bool> { status = status.error, message = ex.Message.ToString() };
            }
        }


    }
}
