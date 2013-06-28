class User < ActiveRecord::Base
  validates :first_name, :presence =>true
    validates :last_name, :presence =>true
    validates :login, :presence =>true,
                      :uniqueness=>true
    validates_presence_of :password
    validates_presence_of :password_confirmation
    validates_confirmation_of :password
    
    attr_accessible :first_name, :id, :last_name
    has_many :photos
    has_many :comments
    has_many :tags
    
  def password
    @password
  end
  
  def password=(passwordString)
    @password = passwordString
    self.salt = rand.to_s
    combined_string = @password + self.salt
    self.password_digest = Digest::SHA1.hexdigest combined_string
  end
  
  def password_valid?(passwordString)
    combined_string = passwordString + self.salt
    password_dig = Digest::SHA1.hexdigest combined_string
    password_digest <=> password_dig
  end
  
  attr_protected
end