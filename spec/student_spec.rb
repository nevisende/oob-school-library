require_relative '../student'

describe Student do
  before :each do
    @student = Student.new(20)
  end

  context 'instance check' do
    it 'should be an instance of the Student class' do
      expect(@student).to be_instance_of Student
    end

    it 'should throw error if it is initialized without arguments' do
      expect{ Student.new }.to raise_exception(ArgumentError)
    end
  end
end