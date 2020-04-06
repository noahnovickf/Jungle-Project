class User < ActiveRecord::Base
  has_secure_password

  validates :name, :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false, presence: true
  validates :password, length: { minimum: 3 }

  def self.authenticate_with_credentials(email, password)
    emailA = email.downcase.strip
    user = User.find_by(email: emailA)
    user && user.authenticate(password) ? true : false
  end
end
