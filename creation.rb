require 'json'
require_relative './student'
require_relative './teacher'
require_relative './store'

module Creation
  def self.success(item)
    puts "#{item} created succesfully!"
  end

  def self.create_basic_info
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    [age, name]
  end

  def self.create_student
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
    Store.push(student)
    success('Person')
  end

  def self.create_teacher
    age, name = create_basic_info
    teacher = Teacher.new(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    teacher.specialization = specialization
    teacher.type = 'Teacher'
    Store.push(teacher)
    success('Person')
  end

  def self.create_a_person
    puts 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    option = gets.chomp
    case option.to_i
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Wrong input !'
    end
  end

  def self.create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    Store.push(book)
    success('Book')
  end

  def self.create_a_rental
    books_arr = JSON.parse(File.read('books.json'))
    puts 'Select a book from the following list by number'
    books_arr.each_with_index { |book, idx| puts "#{idx}) Title: \"#{book['title']}\" Author: #{book['author']}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    people_arr = JSON.parse(File.read('people.json'))
    people_arr.each_with_index do |person, idx|
      puts "#{idx}) [#{person['type']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
    person_index = gets.chomp.to_i
    print 'Date (yyyy/mm/dd): '
    date = gets.chomp
    rentals_arr = JSON.parse(File.read('rentals.json'))
    person = people_arr[person_index]
    book = books_arr[book_index]
    rental = Rental.new(date, person, book)
    new_people_arr = people_arr.each do |item|
      if item['id'] == person['id']
        person['rentals'] << { 'date' => rental.date, 'author' => rental.book['author'],
                               'title' => rental.book['title'] }
      end
    end
    File.write('people.json', JSON.generate(new_people_arr))
    json_to_arr = rentals_arr.push({ 'date' => rental.date, 'person' => rental.person,
                                     'book' => rental.book })
    File.write('rentals.json', JSON.generate(json_to_arr))
    success('Rental')
  end
end
