require './corrector'

class Person
  attr_accessor :name, :age, :type
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..500)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
    @type = type
  end

  def validate_name(name)
    @name = @corrector.correct_name(name)
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end

  def of_age?
    @age >= 18
  end
  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end
end
