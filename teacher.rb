require_relative "person"

class Teacher < Person
  def initialize(specialization)
    super
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

muzafer_cakir = Teacher.new("haydar")
muzafer_cakir.name = "Muzaffer"
