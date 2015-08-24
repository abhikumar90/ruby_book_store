class Book < ActiveRecord::Base
  searchable do
    text :title
    text :image
  end 
end
