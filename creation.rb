require_relative './student'
require_relative './teacher'
require_relative './store'

module Creation
 store = Store.new

  def success(item)
    puts "#{item} created succesfully!"
  end
  
  def create_basic_info
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    return [age, name]
  end

  def create_student(store)
    age, name = create_basic_info
    print 'Has parent permission? [Y/N]: '
    perm_input = gets.chomp
    case perm_input.upcase
    when 'Y'
      perm = true
    when 'N'
      perm = false
    else
      puts 'Wrong input!'
      init
    end
    student = Student.new(age, name)
    student.parent_permission = perm
    student.type = 'Student'
    store.push(student)
    success('Person')
  end
  
  def create_teacher(store)
    age, name = create_basic_info
    teacher = Teacher.new(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    teacher.specialization = specialization
    teacher.type = 'Teacher'
    store.push(teacher)
    success('Person')
  end

  def create_a_person(store)
     puts 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
     option = gets.chomp
     case option.to_i
     when 1
       create_student(store)
     when 2
       create_teacher(store)
     else
       puts 'Wrong input !'
     end
   end
   
   def create_a_book
     print 'Title: '
     title = gets.chomp
     print 'Author: '
     author = gets.chomp
     book = Book.new(title, author)
     store.push(book)
     success('Book')
   end
   
   def create_a_rental

     puts 'Select a book from the following list by number'
     @book_arr.each_with_index { |book, idx| puts "#{idx}) Title: \"#{book.title}\" Author: #{book.author}" }
     book_index = gets.chomp.to_i
     puts 'Select a person from the following list by number (not id)'
     @person_arr.each_with_index do |person, idx|
       puts "#{idx}) [#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
     end
     person_index = gets.chomp.to_i
     print 'Date (yyyy/mm/dd): '
     date = gets.chomp
     person = @person_arr[person_index]
     book = @book_arr[book_index]
     Rental.new(date, person, book)
     success('Rental')
   end
  end