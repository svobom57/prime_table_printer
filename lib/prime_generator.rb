require_relative 'prime_cache'

class PrimeGenerator

  def primes(num_of_primes)
    return [] if num_of_primes.to_i <= 0

    primes = []
    next_prime = 2

    while primes.length != num_of_primes.to_i
      if prime?(next_prime)
        PrimeCache.store(next_prime)
        primes << next_prime
      end
      next_prime += 1
      next_prime += 1 if next_prime % 2 == 0
    end
    primes
  end

  private
  def prime?(prime_candidate)
    return false if prime_candidate <= 1
    return true if PrimeCache.cached?(prime_candidate)
    2.upto(Math.sqrt(prime_candidate).floor) do |divisor|
      return false if prime_candidate % divisor == 0
    end
    true
  end
end