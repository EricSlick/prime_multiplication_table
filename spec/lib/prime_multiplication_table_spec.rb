require 'prime_multiplication_table'

RSpec.describe PrimeMultiplicationTable do

  let(:ten_primes){[2,3,5,7,11,13,17,19,23,29]}
  let(:expected_table_4){%( 1| 2| 3| 5| 7|\n 2| 4| 6|10|14|\n 3| 6| 9|15|21|\n 5|10|15|25|35|\n 7|14|21|35|49|\n)}

  context '#create_multiplications_table' do

    it 'outputs a fully formatted table of 4 primes' do
      expect(PrimeMultiplicationTable::Prime.create_multiplication_table(4)).to eq(expected_table_4)
    end

    it 'outputs a table of size 10 that contains expected values' do
      expect(PrimeMultiplicationTable::Prime.create_multiplication_table(9)).to include("#{5*5}|", "#{11*11}|", "#{11*23}|", "|#{23*23}|")
    end
  end

  context "#build_primes" do

    it 'returns the correct number of primes' do
      expect(PrimeMultiplicationTable::Prime.build_primes(10)).to match(ten_primes)
    end

    it 'returns 1000 prime numbers' do
      puts $primes_1000
    end

  end

  context "#primes" do

    it 'returns the correct number of primes plus 1 added to the front' do
      expect(PrimeMultiplicationTable::Prime.primes(10)).to match([1] + ten_primes)
    end

  end
end