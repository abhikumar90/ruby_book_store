class Contact < ActiveRecord::Base
   apply_simple_captcha :message => "The secret Image and code were different", :add_to_base => true
  validates :name, :email, :phone, :message, presence: true
   
  
end
