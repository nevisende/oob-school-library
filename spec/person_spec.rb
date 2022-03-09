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
  end

end