class User < ActiveRecord::Base
	has_many :listings, :dependent => :destroy	
  	attr_accessible :email, :firstname, :lastname, :password

 	validates :password, :presence => true  	
  	validates :password, :length => { :in => 6..200}
  	validates :firstname, :lastname, :email, :presence => true
  	validates :email, :uniqueness => { :case_sensitive => false }
  	validates :email, :format => { :with => /@/, :message => " is invalid" }

  def password
    password_hash ? @password ||= BCrypt::Password.new(password_hash) : nil
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

end
