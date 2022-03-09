require 'json'
require_relative './helper'

class Store
  def self.read_convert(filename)
    JSON.parse(File.read(filename))
  end

  def self.push(item)
    if item.is_a?(Person)
      Helper.create_file_if_not_exist('people.json')
      json_to_arr = read_convert('people.json')

      if item.type == 'Student'
        json_to_arr.push({ type: item.type, 'name' => item.name, 'id' => item.id, 'age' => item.age,
                           'parent_permission' => item.parent_permission, 'rentals' => item.rentals })
      else
        json_to_arr.push({ type: item.type, 'name' => item.name, 'id' => item.id, 'age' => item.age,
                           'specialization' => item.specialization, 'rentals' => item.rentals })
      end
      File.write('people.json', JSON.generate(json_to_arr))
    else
      Helper.create_file_if_not_exist('books.json')
      json_to_arr = read_convert('books.json').push({ 'title' => item.title, 'author' => item.author })
      File.write('books.json', JSON.generate(json_to_arr))
    end
  end

  def self.list_all_books
    if File.exist?('books.json')
      JSON.parse(File.read('books.json')).map { |book| puts "Title: \"#{book['title']}\" Author: #{book['author']}" }
    else
      File.open('books.json', 'w')
      File.write('books.json', '[]')
    end
  end

  def self.list_all_people
    if File.exist?('people.json')
      JSON.parse(File.read('people.json')).map do |person|
        puts "[#{person['type']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
      end
    else
      File.open('people.json', 'w')
      File.write('people.json', '[]')
    end
  end

  def self.list_rentals_for_id
    print 'ID of person: '
    person_id = gets.chomp.to_i
    person = JSON.parse(File.read('people.json')).find { |prsn| prsn['id'] == person_id }
    rental = person['rentals']
    puts 'Rentals:'
    rental.each do |item|
      puts "Date: #{item['date']}, Book: #{item['title']}, by #{item['author']}"
    end
  end

  def all
    collection = []
    ObjectSpace.each_object(Store) { |item| collection << item }
    collection
  end

  def self.books_and_people_to_rental
    Helper.create_file_if_not_exist('books.json')
    books_arr = JSON.parse(File.read('books.json'))
    puts 'Select a book from the following list by number'
    books_arr.each_with_index { |book, idx| puts "#{idx}) Title: \"#{book['title']}\" Author: #{book['author']}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    if File.exist?('people.json')
      people_arr = JSON.parse(File.read('people.json'))
    else
      File.open('people.json', 'w')
      File.write('people.json', '[]')
    end
    people_arr.each_with_index do |person, idx|
      puts "#{idx}) [#{person['type']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
    person_index = gets.chomp.to_i
    [books_arr, people_arr, book_index, person_index]
  end
end
