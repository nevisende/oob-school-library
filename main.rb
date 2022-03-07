#!/usr/bin/env ruby

# Imports
require './book'
require './rental'
require './create_person'

# Opener
puts "---------------------------------\n
 Welcome to School Library App!\n
------------------------------"

def get_info
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  return [age, name]
end


# Formatters
def success(item)
  puts "#{item} created succesfully!"
end

# Menu Operations
def list_all_books
  @book_arr.map { |book| puts "Title: \"#{book.title}\" Author: #{book.author}" }
end

def list_all_people
  @person_arr.map { |person| puts "[#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
end

def create_a_person()
 include Create_Person
  puts 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
  option = gets.chomp
  case option.to_i
  when 1
    Create_Person.create_student
  when 2
    Create_Person.create_teacher
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
  push_store(book)
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

def list_rentals_for_id
  print 'ID of person: '
  person_id = gets.chomp.to_i
  person = @person_arr.find { |prsn| prsn.id == person_id }
  rental = person.rentals
  puts 'Rentals:'
  rental.each do |item|
    puts "Date: #{item.date}, Book: #{item.book.title}, by #{item.book.author}"
  end
end

def exit
  puts 'Thank you for using School Library app!'
end

# Menu
def menu
  puts "\nPlease choose an option by entering a number:"
  puts '1 - List all books', '2 - List all people', '3 - Create a person', '4 - Create a book',
       '5 - Create a rental', '6 - List all rentals for a given person id', '7 - Exit'
end

# Menu Selections
@menu_hash = { 1 => method(:list_all_books), 2 => method(:list_all_people), 3 => method(:create_a_person),
               4 => method(:create_a_book), 5 => method(:create_a_rental),
               6 => method(:list_rentals_for_id), 7 => method(:exit) }
def init()
  menu
  selection = gets.chomp.to_i
  if selection.positive? && selection < 7
    @menu_hash[selection].call
    init
  elsif selection == 7
    @menu_hash[7].call
  else
    puts 'Wrong input !'
  end
end

init
