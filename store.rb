
class Store
  def initialize
    @book_arr = []
    @person_arr = []
  end

  def push(item)
    item.is_a?(Person) ? @person_arr.push(item) : @book_arr.push(item)
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
end
