require_relative '../teacher'
require_relative '../classroom'

describe Teacher do
  before :all do
    @teacher = Teacher.new(40)
    @teacher_anselem = Teacher.new(25, 'Anselem')
  end

  context 'instance check' do
    it 'should be an instance of the Teacher class' do
      expect(@teacher).to be_instance_of Teacher
    end

    it 'should throw error if it is initialized without arguments' do
      expect { Teacher.new }.to raise_exception(ArgumentError)
    end

    it 'id should be included between 1 and 500' do
      expect(@teacher.id.between?(1, 500)).to eq true
    end

    it 'name should be "Unknown" when not given' do
      expect(@teacher.name).to eq 'Unknown'
    end

    it 'specialization should be nil when not given' do
      expect(@teacher.specialization).to eq nil
    end

    it 'parent_permission should throw NoMethodError because of access permission' do
      expect { @teacher.parent_permission }.to raise_exception(NoMethodError)
    end

    it 'rentals should be [] when initiliazed' do
      expect(@teacher.rentals).to eq []
    end

    it 'type should be nil when initiliazed' do
      expect(@teacher.type).to eq nil
    end
  end

  context 'instance variables accessibility' do
    it 'should be able to read the age property' do
      expect(@teacher.age).to eq 40
    end

    it 'should be able to write the age property' do
      @teacher.age = 1000
      expect(@teacher.age).to eq 1000
    end

    it 'should be able to read the age property' do
      expect(@teacher_anselem.name).to eq 'Anselem'
    end

    it 'should be able to write the age property' do
      @teacher_anselem.name = 'Anselem Odimegwu'
      expect(@teacher_anselem.name).to eq 'Anselem Odimegwu'
    end

    it 'should not be able to write to the id' do
      expect { @teacher.id = 100 }.to raise_exception(NoMethodError)
    end

    it 'should not be able to write to the rentals' do
      expect { @teacher.rentals = [1, 2, 3] }.to raise_exception(NoMethodError)
    end

    it 'should not be able to read or write to the parent_permission' do
      expect { @teacher.parent_permission = false }.to raise_exception(NoMethodError)
    end
  end

  context 'check instance methods' do
    it 'should return error for private method' do
      expect { @teacher.of_age? }.to raise_exception(NoMethodError)
    end

    it 'should return true for a teacher ' do
      expect(@teacher.can_use_services?).to be_truthy
    end

    it 'should return a new rental when the method is called' do
      date = '2022/03/03'
      book = Book.new('John is fine', 'Jane Doe')
      expect(@teacher.add_rental(book, date).class).to eq Rental
    end

    it 'should validate name when method is called' do
      expect(@teacher.validate_name('johnjudebriannoble')).to eq 'Johnjudebr'
    end

    it 'should make sure the length does not exceed 10' do
      expect(@teacher.validate_name('johnjudebriannoble').length).to be <= 10
    end
  end
end
