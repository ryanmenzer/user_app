class User < ActiveRecord::Base
  validates :email,     confirmation: true
  validates :password,  confirmation: true

  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user && user.password == password
      return true
    else
      nil
    end
  end
end
