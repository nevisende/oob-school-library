require_relative '../person'

describe Person do
  before :all do
    @person = Person.new(30, 'Furkan')
    @person.type = 'Student'
  end

  context 'instance check' do
    it 'should be an instance of Person' do
      expect(@person).to be_instance_of Person
    end

    it 'should throw error if it is initialized without arguments' do
      expect{ Person.new }.to raise_exception(ArgumentError)
    end
  end

  context 'instance varaible accessibility' do
    it 'should be able to read the age property' do
      expect(@person.age).to eq 30
    end

    it 'should be able to write to the age property' do
      @person.age = 50
      expect(@person.age).to eq 50
    end

    it 'should be able to read the name property' do
      expect(@person.name).to eq 'Furkan'
    end

    it 'should be able to write to the name property' do
      @person.name = 'John'
      expect(@person.name).to eq 'John'
    end

    it 'should be able to read the type property' do
      expect(@person.type).to eq 'Student'
    end

    it 'should be able to write to the type property' do
      @person.type = 'Teacher'
      expect(@person.type).to eq 'Teacher'
    end

    it 'should be able to read the id' do
      expect(@person.id.is_a?(Integer)).to be true
    end

    it 'should be able to read the rentals' do
      expect(@person.rentals).to eq []
    end

    it 'should not be able to write to the id' do
      expect{ @person.id = 100 }.to raise_exception(NoMethodError)
    end

    it 'should not be able to write to the rentals' do
      expect{ @person.rentals = [1,2,3] }.to raise_exception(NoMethodError)
    end

    it 'should not be able to read or write to the parent_permission' do
      expect{ @person.parent_permission = false }.to raise_exception(NoMethodError)
    end
  end

  context 'check instance methods' do
    it 'should return error for private method' do
      expect{ @person.of_age? }.to raise_exception(NoMethodError)
    end
  end

end