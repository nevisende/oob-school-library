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

  context 'have access to' do
    it 'the title should be accessible' do
      expect(@book.title).to eq 'John is fine'
    end

    it 'should be able to write book title' do
      @book.title = 'John is doing just okay'
      expect(@book.title).to eq 'John is doing just okay'
    end
  end
end