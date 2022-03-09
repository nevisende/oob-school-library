require_relative '../corrector.rb'

describe 'Tests of the corrector class' do

  context 'check the core of the class' do
    it 'should not exist any variable of corrector class' do
      count_of_corrector_class = ObjectSpace.each_object(Corrector).count
      expect(count_of_corrector_class).to eq 0
    end
  end

  context 'check instance methods' do
    it 'should capitalize only the first letter of the name' do
      name = 'anselem'
      corrected_name = Corrector.new
      expect(corrected_name.correct_name(name)).to eq 'Anselem'
    end

    it 'should slice letters after the tenth letter' do
      eg = '1234567891011'
      corrected_name = Corrector.new
      expect(corrected_name.correct_name(eg)).to eq '1234567891'
    end

    it 'should not change the variable passed' do
      name = 'anselem'
      corrected_name = Corrector.new
      expect(name).to eq 'anselem'
    end
  end
end