def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"

  students = []

  name = gets.chomp

  while !name.empty? do
    students << {
      name: name,
      cohort: :November,
      hobbies: :Football,
      country: :UK,
      height: :FiveSeven
    }
    puts "Now we have #{students.count} students"

    name = gets.chomp
  end
  students
end

students = input_students

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
  end
end

def get_first_letter
  puts "Please enter the letter of the student you wish to view"
  letter = gets.chomp.downcase
end

def print_students_whose_name_starts_with_letter_x(students, get_first_letter)
  students.each_with_index do |student, index|
    if student[:name].downcase.start_with?(get_first_letter) && student[:name].length < 12
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end


print_header
print(students)
print_footer(students)

print_students_whose_name_starts_with_letter_x(students, get_first_letter)
