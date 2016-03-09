require 'yaml'
MESSAGES = YAML.load_file('calculator.yml')
MESSAGES.inspect

def prompt(message)
  Kernel.puts("=> #{message}")
end

def ops_to_message(ops)
  word = case ops
    when '1'
      'Adding'
    when '2'
      'Subtract'
    when '3'
      'Divide'
    when '4'
      'Multiply'
    end
  x = "___________"
  word
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end


number1 = ''
number2 = ''


prompt(MESSAGES['welcome'])

name = ''

loop do
  prompt("Whats your name")
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}")

loop do
  loop do
    prompt(MESSAGES['first'])
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt("Not a number")
    end
  end

  loop do
    prompt(MESSAGES['second'])
    number2 = Kernel.gets().chomp()

    if number?(number2)
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
      result = number1.to_f + number2.to_f
     when '2'
      result = number1.to_f - number2.to_f
     when '3'
      result = number1.to_f / number2.to_f
     when '4'
      result = number1.to_f * number2.to_f
  end

  prompt("Your answer is #{result}")
  prompt("Do you want to continue?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
    
  
end

prompt("Thank you come again!")