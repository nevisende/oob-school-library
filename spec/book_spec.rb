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

end