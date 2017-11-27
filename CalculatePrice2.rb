#A hash called functionalities is set, which holds keys which points to the different weights of each service provided by HTML24
functionalities = {"Payment system" => 1.15, "Integration" => 1.5, "Streaming service" => 1.4}

#Array is set called listOfFunc
listOfFuncs = Array.new

#Information gained from HTML24. When the customer has given a budget for a project, weight that budget with 0.8 and use it as a starting point
weightStart = 0.8

puts "This is a program to calculate the price of a project with a new customer."
puts "Enter the budget of the customer:"

#Budget is calculated with weight
budget = gets.chomp.to_f*weightStart

puts " "
puts "When you are done with the initial meeting, rate from 1 to 5 (where 1 is bad and 5 is excellent) how it went."

#gets input from user and stores it in "meeting"
meeting = gets.chomp.to_i

#If the meeting went bad, budget is weighted with 1
if meeting == 1
  budget *= 1
  #If the meeting went less bad, budget is weighted with 1.01
elsif meeting == 2
  budget *= 1.01
#If the meeting went okay, budget is weighted with 1.02
elsif meeting == 3
  budget *= 1.02
  #If the meeting went well, budget is weighted with 1.03
elsif meeting == 4
  budget *= 1.03
  #If the meeting went really well, budget is weighted with 1.05
elsif meeting == 5
  budget *= 1.05
end

puts "Which functionalities does the customer want? Type the given number(s) one at a time:
\n1: Payment system\n2: Integration\n3: Streaming service"

puts "Type the number of the functionality you want followed by enter. Type X when done"
while true
  funcs = gets.chomp.capitalize
  if funcs == "X"
    break
  end

  #if the hash "functionalities" has a key corresponding to what has been put into "funcs",
  if functionalities.has_key?(funcs)
  #budget is * with the value, corresponding to the key entered in "func", which holds af weight, depending on the funtionality the customer wants.
    budget *= functionalities[funcs]
	#puts input from variable funcs into array listOfFuncs.
    listOfFuncs.push(funcs)
  else
    puts "Type right word"
  end
end

puts "The price should be #{budget} DKK.
Type 1 if the customer is willing to pay the price
Type 2 if the customer wants to remove certain functionalities to make it cheaper."
choice = gets.chomp.to_i


#if choice is 1, break"
if choice == 1
  break

#Prints the chosen functionalities, user input to remove them.
elsif choice == 2
  puts "This is the list of functionalities that are chosen:"
  for a in listOfFuncs
    puts a
  end

  puts "Type the name(s) of the functionalities that should be removed. Type 'x' when done"
  while true
    funcs = gets.chomp.capitalize
    if funcs == "X"
      break
    end

    #Checks if the functionality is listed.
    if listOfFuncs.include?(funcs)
      budget /= functionalities[funcs]
    else
      puts "This functionality isn't in the list, type again!"
    end
    puts "Type the next functionality or type 'X' to exit"
  end
end

#Prints final budget
puts "The final budget is #{budget.round(2)}"
