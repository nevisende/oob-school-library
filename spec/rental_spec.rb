describe Rental do
  before :all do
    @rental = Rental.new('2022/03/03', 'Anselem', 'Clean Code')
  end

  context 'instance check' do
    it 'should be an instance of the Rental class' do
      expect(@rental).to be_instance_of Rental
    end

    it 'should throw error if it is initialized without arguments' do
      expect { Rental.new }.to raise_exception(ArgumentError)
    end
  end

  context 'instance variables accessibility' do
    it 'should be able to read the date property' do
      expect(@rental.date).to eq '2022/03/03'
    end

    it 'should be able to write the date property' do
      @rental.date = '2022/03/10'
      expect(@rental.date).to eq '2022/03/10'
    end

    it 'should be able to read the person property' do
      expect(@rental.person).to eq 'Anselem'
    end

    it 'should not be able to write the person property' do
      expect { @rental.person = 'Anselem Odimegwu' }.to raise_exception(NoMethodError)
    end

    it 'should be able to read the book property' do
      expect(@rental.book).to eq 'Clean Code'
    end

    it 'should not be able to write the book property' do
      expect { @rental.book = 'DDD' }.to raise_exception(NoMethodError)
    end
  end
end
