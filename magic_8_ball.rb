
require "colorize"

class MagicEightBall
def initialize
@answers_original = ["It is certain",
"It is decidedly so",
"Without a doubt",
"Yes definitely",
"You may rely on it",
"As I see it, yes",
"Most likely",
"Outlook good",
"Yes",
"Signs point to yes",
"Reply hazy try again",
"Ask again later",
"Better not tell you now",
"Cannot predict now",
"Concentrate and ask again",
"Don't count on it",
"My reply is no",
"My sources say no",
"Outlook not so good",
"Very doubtful"]

@answers = @answers_original.clone

ask_question
end

def ask_question
puts "What's your question?!".light_green.underline
question = gets.strip
case question
when "add_answers"
  add_answers
  ask_question
when "print_answers"
  view_answers
  ask_question
when "QUIT"
  puts "Bye!"
when "reset_answers"
  reset_answers
else
puts @answers.sample.yellow
puts
puts
sleep(2)
ask_question
end
end

def add_answers
  puts "What answer do you want to add?"
  new_answer = gets.strip.downcase
  @small_answers = @answers.map(&:downcase)
  if @small_answers.include? new_answer
    puts "That answer already exists!"
    puts
    puts
    sleep(2)
  else
  @answers << new_answer
  print "'#{new_answer}'".red.on_cyan
  puts " has been added to your answer choices."
  sleep(2)
  end
end

def reset_answers
  @answers = @answers_original.clone
  puts "(answers have been reset)".light_blue
  ask_question
end


def view_answers
  sleep(1)
  @answers.each do |answer|
    puts "#{answer}"
  end
  sleep(2)
end
end

user = MagicEightBall.new