@students = []

def input_students
  puts "Please enter the names of the students followed by their cohort, hobby and country"
  puts "To finish just hit return 4 times"

  name = STDIN.gets.chomp
  cohort = STDIN.gets.chomp.to_s
  cohort = "January" if cohort.empty?
  hobby = STDIN.gets.chomp.to_s
  hobby = "Basketball" if hobby.empty?
  country = STDIN.gets.chomp.to_s
  country = "UK" if country.empty?

  while !name.empty? do
    @students << {
      name: name,
      cohort: cohort,
      hobby: hobby,
      country: country
    }

    if @students.count == 1
      puts "Now we have #{@students.count} student"
    elsif @students.count >= 2
      puts "Now we have #{@students.count} students"
    elsif student.count == 0
      puts "There are no students!"
    end

    name = STDIN.gets.chomp
    cohort = STDIN.gets.chomp.to_s
    cohort = "January" if cohort.empty?
    hobby = STDIN.gets.chomp.to_s
    hobby = "Basketball" if hobby.empty?
    country = STDIN.gets.chomp.to_s
    country = "UK" if country.empty?

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
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
  print_students_whose_name_starts_with_letter_x(get_first_letter)
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby], student[:country]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort, hobby, country = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, hobby: hobby.to_sym, country: country.to_sym}
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
    students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
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
