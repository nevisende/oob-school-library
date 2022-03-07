require_relative './student'
require_relative './teacher'
require_relative './push_store'

module Create_Person
  def create_student
    age, name = get_info
    print 'Has parent permission? [Y/N]: '
    perm_input = gets.chomp
    case perm_input.upcase
    when 'Y'
      perm = true
    when 'N'
      perm = false
    else
      puts 'Wrong input!'
      init
    end
    student = Student.new(age, name)
    student.parent_permission = perm
    student.type = 'Student'
    push = Push_Store.new
    push.push_store(student)
    success('Person')
  end
  
  def create_teacher
    age, name = get_info
    teacher = Teacher.new(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    teacher.specialization = specialization
    teacher.type = 'Teacher'
    push = Push_Store.new
    push.push_store(teacher)
    success('Person')
  end
end