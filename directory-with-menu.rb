def input_students
  puts "Please enter the names of the students followed by their cohort, hobby and country"
  puts "To finish just hit return 4 times"

  students = []

  name = gets.chomp
  cohort = gets.chomp.to_s
  cohort = "January" if cohort.empty?
  hobby = gets.chomp.to_s
  hobby = "Basketball" if hobby.empty?
  country = gets.chomp.to_s
  country = "UK" if country.empty?

  while !name.empty? do
    students << {
      name: name,
      cohort: cohort,
      hobby: hobby,
      country: country
    }

    if students.count == 1
      puts "Now we have #{students.count} student"
    elsif students.count >= 2
      puts "Now we have #{students.count} students"
    elsif student.count == 0
      puts "There are no students!"
    end

    name = gets.chomp
    cohort = gets.chomp.to_s
    cohort = "January" if cohort.empty?
    hobby = gets.chomp.to_s
    hobby = "Basketball" if hobby.empty?
    country = gets.chomp.to_s
    country = "UK" if country.empty?
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} - #{student[:cohort]} Cohort - Hobby: #{student[:hobby]} - Country: #{student[:country]}"
  end
end

def get_first_letter
  puts "Please enter the letter of the student you wish to view"
  letter = gets.chomp.downcase
end

def print_students_whose_name_starts_with_letter_x(students, get_first_letter)
  students.each_with_index do |student, index|
    if student[:name].downcase.start_with?(get_first_letter) && student[:name].length < 12
      puts "#{index + 1}. #{student[:name]} - #{student[:cohort]} Cohort - Hobby: #{student[:hobby]} - Country: #{student[:country]}"
    end
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student"
  elsif students.count >= 2
    puts "Overall, we have #{students.count} great students"
  elsif students.count == 0
    puts "There are no students!"
  end
end

def interactive_menu
  students = []
  loop do
    # 1. Print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. Read the input and save it into a variable
    selection = gets.chomp
    # 3. Do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
      print_students_whose_name_starts_with_letter_x(students, get_first_letter)
    when "9"
      exit # This will cause the programme to terminate
    else
      puts "I don't know what you mean, please try again!"
    end
  end
end

interactive_menu
