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
end