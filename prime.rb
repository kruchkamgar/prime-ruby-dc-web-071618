require 'benchmark'
require 'pry'

def prime? (num)
base = 6
n = 1
factor = base * n
evaluation = true

  Benchmark.bm(10) do|bm|

    bm.report('if-else loop') do
      1000000.times do

        if num <= 1
          evaluation = false
        elsif num <= 3
          evaluation = true
        elsif num % 2 == 0 || num % 3 == 0
          evaluation = false
        else
          #test 6n [plus or minus] 1. --smaller set of numbers, commonly primes
          while (factor * factor) < num do
            binding.pry
            if num % (factor + 1) == 0 || num % (factor - 1) == 0
              evaluation = false
            end
            factor += base
          end
        end

    end
    end


    bm.report('while loop') do
      1000000.times do

        if num <= 1
          evaluation = false
        end
          #test 6n [plus or minus] 1. --smaller set of numbers, commonly primes
        while num % 2 != 0 &&
          num % 3 != 0 &&
          num % (factor + 1) != 0 &&
          num % (factor - 1) != 0 &&
          (factor - 1) <= Math.sqrt(num) do

            factor += base
        end

          # breaking loop means num divides cleanly
          if (factor - 1) <= Math.sqrt(num)
            evaluation = false
          else
            evaluation = true
          end
    end
    end

  end #benchmark

  evaluation
end
