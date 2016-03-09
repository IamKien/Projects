#ask for the loan amount
#ask for the apr
#ask for the loan duration
#Calculate the monthly payment
#calculate the remaining loan
def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end

puts <<-MSG 
-----------------------------------
    Welcome to Mortgage Calculator
------------------------------------
MSG
puts ("Please enter your loan amount")
amount = ''
loop do 
  amount = Kernel.gets().chomp()

  if number?(amount) 
    break
  else
    puts("Enter Amount")
  end
end

puts("Please enter your APR")
apr = ''
loop do 
  apr = Kernel.gets().chomp()
  if number?(apr) 
    break
  else
    puts("Enter APR")
  end
end

puts("What is the duration of your loan in months")
duration = ''
loop do
  duration = Kernel.gets().chomp()
  if integer?(duration) && duration.to_i > 12
    break
  else
    puts("How Long? Must be over 12")
  end
end



annual_interest_rate = apr.to_f() / 100
monthly_interest_rate = annual_interest_rate / 12
months = duration.to_f() / 12

monthly_payment = amount.to_f() *
              (monthly_interest_rate /
    (1 - (1 + monthly_interest_rate)**-months.to_i()))


puts <<-MSG
  Your monthly interest rate is #{monthly_interest_rate}
  Your have #{months} years left
  Your monthly total is #{monthly_payment}


MSG
