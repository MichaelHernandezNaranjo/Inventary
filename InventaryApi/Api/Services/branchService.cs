using Api.Entities;
using Api.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Services
{
    public interface IBranchService
    {
        public Task<List<branch>> GetAllBranchs();
        public Task<branch> GetBranchById(int id);
        public Task<int> CreateBranchAsync(branchRequest branch);
        public Task<bool> UpdateBranchAsync(branchRequest branch);
        public Task<bool> DeleteBranchAsync(int id);
    }
    public class branchService : IBranchService
    {
        private readonly IBranchRepository _branchRepository;

        public branchService(IBranchRepository branchRepository)
        {
            _branchRepository = branchRepository;
        }

        public async Task<List<branch>> GetAllBranchs()
        {
            return await _branchRepository.GetAllAsync();
        }

        public async Task<branch> GetBranchById(int id)
        {
            return await _branchRepository.GetByIdAsync(id);
        }

        public async Task<int> CreateBranchAsync(branchRequest branch)
        {
            return await _branchRepository.CreateAsync(branch);
        }

        public async Task<bool> UpdateBranchAsync(branchRequest branch)
        {
            return await _branchRepository.UpdateAsync(branch);
        }

        public async Task<bool> DeleteBranchAsync(int id)
        {
            return await _branchRepository.DeleteAsync(id);
        }
    }
}
