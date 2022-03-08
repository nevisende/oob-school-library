require 'json'

class Store
  attr_accessor :book_arr, :person_arr

  def initialize
    @book_arr = []
    @person_arr = []
  end

  def read_convert(filename)
    data= JSON.parse(File.read(filename))
  end

  def push(item)
    if(item.is_a?(Person)) 
      json_to_arr = read_convert("people.json")
      if(item.type == 'Student')
        json_to_arr.push({"type": item.type, "name" => item.name, "id" => item.id, "age" => item.age, "parent_permission" => item.parent_permission})
      else
        json_to_arr.push({"type": item.type, "name" => item.name, "id" => item.id, "age" => item.age, "specialization" => item.specialization})
      end
        File.write("people.json", JSON.generate(json_to_arr))
    else 
      json_to_arr = read_convert("books.json").push({"title" => item.title, "author" => item.author})
      File.write("books.json", JSON.generate(json_to_arr))
    end
  end

  def list_all_books
    @book_arr.map { |book| puts "Title: \"#{book.title}\" Author: #{book.author}" }
  end

  def list_all_people
    @person_arr.map { |person| puts "[#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
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

  def all
    collection = []
    ObjectSpace.each_object(Store) { |item| collection << item }
    collection
  end
end
