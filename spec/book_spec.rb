require_relative '../book.rb'


describe Book do
  before :each do
    @book = Book.new('John is fine', 'Jane Doe')
  end

  context 'an instance of' do
    it 'the Book class' do
      expect(@book).to be_instance_of Book
    end
  end

  context 'have access to title' do
    it 'the title should be accessible' do
      expect(@book.title).to eq 'John is fine'
    end

    it 'should be able to write book title' do
      @book.title = 'John is doing just okay'
      expect(@book.title).to eq 'John is doing just okay'
    end
  end

  context 'have access to author' do
    it 'the author should be accessible' do
      expect(@book.author).to eq 'Jane Doe'
    end

    it 'should be able to write book author' do
      @book.author = 'Dan Brown'
      expect(@book.author).to eq  'Dan Brown'
    end
  end

  context 'have access to rentals' do
    it 'should be able to be read' do
      expect(@book.rentals).to eq []
    end

    it 'should be able to be an empty array when initialized' do
      expect(@book.rentals.empty?).to eq true
    end

    it 'should not be able to be written to directly' do
      expect{ @book.rentals = [1, 2, 3] }.to raise_exception(NoMethodError)
    end
  end
end