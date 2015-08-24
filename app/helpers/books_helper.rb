module BooksHelper
  def link_to_book(b_id)
    b = Book.find(b_id).display_name
    "/data/#{b}"
  end
end
