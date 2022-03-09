require_relative '../person'

describe Person do
  before :all do
    @person = Person.new(30, 'Furkan')
  end

  context 'instance check' do
    it 'should be an instance of Person' do
      expect(@person).to be_instance_of Person
    end
  end

  context 'accessible' do
    it 'should be able to read the age property' do
      expect(@person.age).to eq 30
    end
  end

end