require 'json'

class Store
  def self.read_convert(filename)
    JSON.parse(File.read(filename))
  end

  def self.push(item)
    if item.is_a?(Person)

      if(File.exists?("people.json") == false)
        File.open("people.json","w")
        File.write("people.json", "[]")
      end
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
      if(File.exists?("books.json") == false)
        File.open("books.json","w")
        File.write("books.json", "[]")
      end
      json_to_arr = read_convert('books.json').push({ 'title' => item.title, 'author' => item.author })
      File.write('books.json', JSON.generate(json_to_arr))
    end
  end

  def self.list_all_books
    if(File.exists?("books.json")) 
      JSON.parse(File.read('books.json')).map { |book| puts "Title: \"#{book['title']}\" Author: #{book['author']}" }
    else
      File.open("books.json","w")
      File.write("books.json", "[]")
    end
  end

  def self.list_all_people
    if(File.exists?("people.json")) 
      JSON.parse(File.read('people.json')).map do |person|
        puts "[#{person['type']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
      end
    else
      File.open("people.json","w")
      File.write("people.json", "[]")
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
end
