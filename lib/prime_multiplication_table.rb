require "prime_multiplication_table/version"
require "support/primes"

module PrimeMultiplicationTable
  class Prime

    USE_TABLE = false #left in for reviewers as demonstration of using a table of primes

    def self.create_multiplication_table(how_many = 10)
      mult_table = ""

      # Get the requested number of primes and build a column/row for each prime
      primes(how_many).each do |prime|
        mult_table += build_row(prime)
      end

      mult_table
    end

    # builds a row for specified prime and the multiples of all the other primes in the list
    def self.build_row(prime)
      col_width = "#{(primes.last * primes.last)}".length + 1
      end_cap = "\n"
      row = ""
      primes.each do |x_prime|
        row += "#{prime * x_prime}|".rjust(col_width, ' ')
      end
      row + end_cap
    end

    # return list of primes equal to
    #  param @how_many
    # returns a new list or a preexisting list
    def self.primes(how_many = @primes.length - 1)
      @primes = [1] + build_primes(how_many) unless @primes && @primes.length == (how_many + 1)
      @primes
    end

    def self.build_primes(how_many)
      case USE_TABLE
        when true
          Primes.p_1000.map(&:to_i).slice(0, how_many)
        else
          Primes.generate(how_many)
      end
    end
  end
end
