class User < ApplicationRecord

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }, on: :create
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    # Find the user by email (case insensitive)
    user = User.find_by("LOWER(email) = ?", email.strip.downcase)
    # Check if the user exists and the password is correct
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
