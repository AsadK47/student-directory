@students = []

def shovel(name, cohort, hobby, country)
  @students << {name: @name, cohort: @cohort.to_sym, hobby: @hobby.to_sym, country: @country.to_sym}
end

def answers
  @name = STDIN.gets.chomp
  @cohort = STDIN.gets.chomp
  @cohort = "January" if @cohort.empty?
  @hobby = STDIN.gets.chomp
  @hobby = "Basketball" if @hobby.empty?
  @country = STDIN.gets.chomp
  @country = "UK" if @country.empty?
end

def input_students
  puts "Please enter the names of the students followed by their name, cohort, hobby and country"
  puts "To finish just hit return 4 times"

  answers

  while !@name.empty? do

    shovel(@name, @cohort, @hobby, @country)

    if @students.count == 1
      puts "Now we have #{@students.count} student"
    elsif @students.count >= 2
      puts "Now we have #{@students.count} students"
    elsif student.count == 0
      puts "There are no students!"
    end

    answers

  end
  @students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} - #{student[:cohort]} Cohort - Hobby: #{student[:hobby]} - Country: #{student[:country]}"
  end
end

def get_first_letter
  puts "Please enter the letter of the student you wish to view"
  letter = STDIN.gets.chomp.downcase
end

def print_students_whose_name_starts_with_letter_x(get_first_letter)
  @students.each_with_index do |student, index|
    if student[:name].downcase.start_with?(get_first_letter) && student[:name].length < 12
      puts "#{index + 1}. #{student[:name]} - #{student[:cohort]} Cohort - Hobby: #{student[:hobby]} - Country: #{student[:country]}"
    end
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  elsif @students.count >= 2
    puts "Overall, we have #{@students.count} great students"
  elsif @students.count == 0
    puts "There are no students!"
  end
end

def print_menu
  puts "Please enter a number for one of the following options"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to (filename)"
  puts "4. Load the list from (filename)"
  puts "5. Print students that start with ..."
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  puts "Please give the name of the file to be saved (Note, all files are saved as CSV's) - Press enter to return to menu"
  save_students_input = gets.chomp
  file = File.open(save_students_input + ".csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby], student[:country]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  puts "Please give the name of the file to be loaded (Note, all files are loaded as CSV's) - Press enter to return to menu"
  load_students_input = gets.chomp
  file = File.open(load_students_input + ".csv", "r")
  file.readlines.each do |line|
  name, cohort, hobby, country = line.chomp.split(',')
    shovel(name, cohort, hobby, country)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # First argument from the command line
  return if filename.nil? # Get out of the method if it isn't given
  if File.exists?(filename) # If it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # If it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # Quits the programme
  end
end

def process(selection)
  case selection
  when "1"
    puts "You chose 1. Please follow the instructions below"
    students = input_students
  when "2"
    puts "You chose 2"
    show_students
  when "3"
    puts "You chose 3"
    save_students
  when "4"
    puts "You chose 4"
    load_students
  when "5"
    puts "You chose 5"
    print_students_whose_name_starts_with_letter_x(get_first_letter)
  when "9"
    puts "Bye!"
    exit # This will cause the programme to terminate
  else
    puts "I don't know what you mean, please try again!"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu
