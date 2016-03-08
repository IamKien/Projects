def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def ops_to_message(ops)
  case ops
  when '1'
    'Adding'
  when '2'
    'Subtract'
  when '3'
    'Divide'
  when '4'
    'Multiply'
  end
end

number1 = ''
number2 = ''


prompt("Welcome to calculator")

name = ''

loop do
  prompt("Whats your name")
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Type your name")
  else
    break
  end
end

prompt("Hi #{name}")

loop do
  loop do
    prompt("Whats the first number")
    number1 = Kernel.gets().chomp().to_i

    if valid_number?(number1)
      break
    else
      prompt("Not a number")
    end
  end

  loop do
    prompt("Whats the 2nd number")
    number2 = Kernel.gets().chomp().to_i

    if valid_number?(number2)
      break
    else
      prompt("Not a number")
    end
  end

  ops = ''

  ops_prompt = <<-MSG
  "Whats the operator 
    1) add 
    2) subtract 
    3) divide 
    4) multiply"
  MSG

  prompt(ops_prompt)
  loop do
    ops = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(ops)
      break
    else
      prompt("1 to 4 only")
    end
  end

  prompt("#{ops_to_message(ops)} you chose")

  result = case ops
     when '1'
      result = number1 + number2
     when '2'
      result = number1 - number2
     when '3'
      result = number1.to_f / number2.to_f
     when '4'
      result = number1 * number2
  end

  prompt("Your answer is #{result}")
  prompt("Do you want to continue?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
    
  
end

prompt("Thank you come again!")