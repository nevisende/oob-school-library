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

  def list(num)
    store = Store.new
  include Creation
    case num
    when 1
      Store.list_all_books
    when 2
      p Store.all[1]
      store.list_all_people
    when 3
      create_a_person(store)
    when 4
      create_a_book
    when 5
      create_a_rental
    when 6
      Store.list_rentals_for_id
    end
  end

  def init()
    menu
    selection = gets.chomp.to_i
    if selection.positive? && selection < 7
      list(selection)
      init
    elsif selection == 7
      @menu_hash[7].call
    else
      puts 'Wrong input !'
    end
  end
