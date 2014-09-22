require 'support/primes'

RSpec.describe Primes do
  Primes.p_1000.each_with_index do |next_prime, i|
    if (i > 2)
      it "gets the next prime after #{Primes.p_1000[i-1]}" do
        prev_prime = Primes.p_1000[i-1]
        expect(Primes.next_prime(prev_prime)).to eq(next_prime.to_i)
      end
    end
  end

  it "will create a list of primes" do
    expect(Primes.generate(10)).to eq([2,3,5,7,11,13,17,19,23,29])
  end
end