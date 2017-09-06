require_relative '../lib/prime_cache'

RSpec.describe PrimeCache do
  describe '.get' do
    it 'stores primes' do
      PrimeCache.store(2)
      PrimeCache.store(3)
      PrimeCache.store(5)

      expect(PrimeCache.cached?(3)).to be true
    end

    it 'returns false when prime is not found' do
      expect(PrimeCache.cached?(10)).to be false
    end
  end
end