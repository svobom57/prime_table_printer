require 'set'

class PrimeCache
  class << self
    def store(prime)
      cache.add prime
    end

    def cached?(possible_prime)
      cache.include? possible_prime
    end

    private
    def cache
      @cache ||= Set.new
    end
  end
end