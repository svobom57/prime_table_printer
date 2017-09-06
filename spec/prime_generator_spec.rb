require_relative '../lib/prime_generator'
require_relative '../lib/prime_cache'

RSpec.describe PrimeGenerator do
  PRIME_NUMBERS = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997].freeze
  let(:prime_generator) { PrimeGenerator.new }

  describe '#stream_primes' do
    it 'returns prime numbers as an array' do
      expect(prime_generator.primes(PRIME_NUMBERS.size)).to eq PRIME_NUMBERS
    end

    it 'caches primes' do
      expect(PrimeCache).to receive(:store).with(2).once
      expect(PrimeCache).to receive(:store).with(3).once
      expect(PrimeCache).to receive(:store).with(5).once
      expect(PrimeCache).to receive(:store).with(7).once
      expect(PrimeCache).to receive(:store).with(11).once

      prime_generator.primes(5)
    end

    it 'uses cached primes if available' do
      expect(PrimeCache).to receive(:cached?).with(2)
      expect(PrimeCache).to receive(:cached?).with(3)
      expect(PrimeCache).to receive(:cached?).with(5)
      expect(PrimeCache).to receive(:cached?).with(7)

      expect(prime_generator.primes(4)).to eq PRIME_NUMBERS[0...4]
    end

    it 'can stream primes multiple times' do
      expect(prime_generator.primes(5)).to eq PRIME_NUMBERS[0...5]
      expect(prime_generator.primes(10)).to eq PRIME_NUMBERS[0...10]
      expect(prime_generator.primes(55)).to eq PRIME_NUMBERS[0...55]
    end

    it 'returns empty array when invalid number of primes given' do
      expect(prime_generator.primes(-10)).to eq []
      expect(prime_generator.primes(nil)).to eq []
    end
  end

  describe '#is_prime?' do
    it 'returns true when prime is given' do
      expect(prime_generator.send(:prime?, 2)).to be true
      expect(prime_generator.send(:prime?, 3)).to be true
      expect(prime_generator.send(:prime?, 5)).to be true
      expect(prime_generator.send(:prime?, 7)).to be true
      expect(prime_generator.send(:prime?, 103)).to be true
    end

    it 'returns false when non-prime is given' do
      expect(prime_generator.send(:prime?, 1)).to be false
      expect(prime_generator.send(:prime?, 4)).to be false
      expect(prime_generator.send(:prime?, -5)).to be false
    end
  end
end