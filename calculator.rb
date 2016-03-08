Kernel.puts("Welcome to calculator")

Kernel.puts("Whats the first number")
number1 = Kernel.gets().chomp().to_i

Kernel.puts("Whats the 2nd number")
number2 = Kernel.gets().chomp().to_i

Kernel.puts("Whats the operator 1) add 2) subtract 3) divide 4) multiply")
ops = Kernel.gets().chomp()

if ops == '1'
  result = number1 + number2
elsif ops == '2'
  result = number1 - number2
elsif ops == '3'
  result = number1.to_f / number2.to_f
else
  result = number1 * number2
end
  
puts ("Your answer is #{result} ")