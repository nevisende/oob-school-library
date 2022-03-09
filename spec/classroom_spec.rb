require_relative '../classroom'

describe 'Tests of Classroom class' do
  before :all do
    @classroom = Classroom.new('Microverse')
  end

  context 'instance check' do
    it 'should be an instance of the Classroom class' do
      expect(@classroom).to be_instance_of Classroom
    end

    it 'should throw error if it is initialized without arguments' do
      expect { Classroom.new }.to raise_exception(ArgumentError)
    end

    it 'students should be [] when initiliazed' do
      expect(@classroom.students).to eq []
    end
  end

  context 'instance variables accessibility' do
    it 'should be able to read the label variable' do
      expect(@classroom.label).to eq 'Microverse'
    end

    it 'should be able to write the label variable' do
      @classroom.label = 'Microservices'
      expect(@classroom.label).to eq 'Microservices'
    end

    it 'should be to read the students variable' do
      expect(@classroom.students).to eq []
    end

    it 'shouldn\'t be to write the students variable' do
      expect { @classroom.students = ['Anselem'] }.to raise_exception(NoMethodError)
    end
  end
end
