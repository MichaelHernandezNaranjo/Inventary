using Api.Entities;
using Api.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Services
{
    public interface ISellerService
    {
        public Task<List<seller>> GetAllSellers();
        public Task<seller> GetSellerById(int id);
        public Task<int> CreateSellerAsync(sellerRequest seller);
        public Task<bool> UpdateSellerAsync(sellerRequest seller);
        public Task<bool> DeleteSellerAsync(int id);
    }
    public class sellerService : ISellerService
    {
        private readonly ISellerRepository _sellerRepository;

        public sellerService(ISellerRepository sellerRepository)
        {
            _sellerRepository = sellerRepository;
        }

        public async Task<List<seller>> GetAllSellers()
        {
            return await _sellerRepository.GetAllAsync();
        }

        public async Task<seller> GetSellerById(int id)
        {
            return await _sellerRepository.GetByIdAsync(id);
        }

        public async Task<int> CreateSellerAsync(sellerRequest seller)
        {
            return await _sellerRepository.CreateAsync(seller);
        }

        public async Task<bool> UpdateSellerAsync(sellerRequest seller)
        {
            return await _sellerRepository.UpdateAsync(seller);
        }

        public async Task<bool> DeleteSellerAsync(int id)
        {
            return await _sellerRepository.DeleteAsync(id);
        }
    }
}
