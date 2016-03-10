
VALID_CHOICES = %w(rock paper scissors spock lizard)

def prompt(message)
  Kernel.puts "==> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
  (first == 'rock' && second == 'lizard') ||
  (first == 'paper' && second == 'rock') ||
  (first == 'paper' && second == 'spock') ||
  (first == 'scissors' && second == 'paper')||
  (first == 'scissors' && second == 'lizard')||
  (first == 'lizard' && second == 'paper')||
  (first == 'lizard' && second == 'spock')||
  (first == 'spock' && second == 'rock')||
  (first == 'spock' && second == 'scissors')
end

def short_cut(input)
  word = case input
    when '1'
      'rock'
    when '2'
      'paper'
    when '3'
      'scissors'
    when '4'
      'spock'
    when '5'
      'lizard'
    end
  return word
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You WON!!!!!!")
  elsif win?(computer, player)
    prompt("You LOST =(")
  else
    prompt("It's a tie")
  end
end

def keep_score(player, computer)
  player = player.to_i
  computer = computer.to_i
  if win?(player, computer)
    player += 1
    prompt("#{player}")
  elsif win?(computer, player)
    computer += 1
    prompt("#{computer}")
  else
    prompt("No points for both")
  end
end

loop do
  choice = ''
  loop do
    prompt <<-MSG
    Choose one using a number:
    1) rock 
    2) paper 
    3) scissors 
    4) spock 
    5) lizard
    MSG
    choice = Kernel.gets().chomp()

    if %w(1 2 3 4 5).include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  choice = short_cut(choice)

  computer_choice = VALID_CHOICES.sample

  prompt("You choose #{choice}, Computer choose #{computer_choice}")

  display_results(choice, computer_choice)
  keep_score(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing!!!!!")