class User < ActiveRecord::Base
  
   attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def encrypt_password
    if password.present?
      self.password_salt = Digest::MD5.hexdigest(password)
      self.password_hash = Digest::MD5.hexdigest(password)
    end
  end
 
def self.authenticate(email, password)
  user = find_by_email(email)
    if user && user.password_hash == Digest::MD5.hexdigest(password)
    user
  else
    nil
  end
end
end
