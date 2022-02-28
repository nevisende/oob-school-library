class Person
  attr_reader :id, name, age
  attr_writer :name, :age
  def initialize(name: "Unknown", age, parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def is_of_age
    if @age > 18 
      true
    else
      false
    end
  end
  private :is_of_age

  def can_use_services
    if @age > 18 && parent_permission
      true
    else
      false
    end
  end
end

furkan = Person.new("furkan",23)
p furkan