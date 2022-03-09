require_relative '../student'
require_relative '../classroom'

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
  
    context 'instance method checks' do
      it 'should return classroom as nil if not included during initialization' do
        expect(@student.classroom).to eq nil
      end

      it 'should return a string when method is called' do
        expect(@student.play_hooky).to eq "¯\(ツ)/¯"
      end

      it 'should return a string when method is called' do
        @student.parent_permission = false
        expect(@student.parent_permission).to be_falsey
      end
    end
end