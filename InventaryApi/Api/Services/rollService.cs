using Api.Entities;
using Api.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Services
{
    public interface IRollService
    {
        public Task<List<roll>> GetAllRolls();
        public Task<roll> GetRollById(int id);
        public Task<int> CreateRollAsync(rollRequest roll);
        public Task<bool> UpdateRollAsync(rollRequest roll);
        public Task<bool> DeleteRollAsync(int id);
    }
    public class rollService : IRollService
    {
        private readonly IRollRepository _rollRepository;

        public rollService(IRollRepository rollRepository)
        {
            _rollRepository = rollRepository;
        }

        public async Task<List<roll>> GetAllRolls()
        {
            return await _rollRepository.GetAllAsync();
        }

        public async Task<roll> GetRollById(int id)
        {
            return await _rollRepository.GetByIdAsync(id);
        }

        public async Task<int> CreateRollAsync(rollRequest roll)
        {
            return await _rollRepository.CreateAsync(roll);
        }

        public async Task<bool> UpdateRollAsync(rollRequest roll)
        {
            return await _rollRepository.UpdateAsync(roll);
        }

        public async Task<bool> DeleteRollAsync(int id)
        {
            return await _rollRepository.DeleteAsync(id);
        }
    }
}
