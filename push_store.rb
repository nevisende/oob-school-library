
class Push_Store
  def initialize
    @book_arr = []
    @person_arr = []
  end

  def push_store(item)
    item.is_a?(Person) ? @person_arr.push(item) : @book_arr.push(item)
  end
end
