require 'open3'

RSpec.describe 'prime_mult_table' do

  let(:expected_table_4){%( 1| 2| 3| 5| 7|\n 2| 4| 6|10|14|\n 3| 6| 9|15|21|\n 5|10|15|25|35|\n 7|14|21|35|49|\n)}

   context 'when script is invoked' do
     it 'outputs to stdout a formatted table for 4 primes' do
       stdin, stdout, stderr = Open3.popen3('bin/prime_mult_table 4')
       expect(stdout.readlines.join).to eq(expected_table_4)
     end
   end
end