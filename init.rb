# Imports
require './book'
require './rental'
require_relative './store'
require './creation'

def exit
  puts 'Thank you for using School Library app!'
end

# Menu
def menu
  puts "\nPlease choose an option by entering a number:"
  puts '1 - List all books', '2 - List all people', '3 - Create a person', '4 - Create a book',
       '5 - Create a rental', '6 - List all rentals for a given person id', '7 - Exit'
end

def list(num, store)
  case num
  when 1
    store.list_all_books
  when 2
    store.list_all_people
  when 3
    Creation.create_a_person(store)
  when 4
    Creation.create_a_book(store)
  when 5
    Creation.create_a_rental(store)
  when 6
    store.list_rentals_for_id
  end
end

def init(store)
  menu
  selection = gets.chomp.to_i
  if selection.positive? && selection < 7
    list(selection, store)
    init(store)
  elsif selection == 7
    exit
  else
    puts 'Wrong input !'
  end
end
