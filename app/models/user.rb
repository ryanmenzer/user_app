class User < ActiveRecord::Base
  validates :email,     confirmation: true
  validates :password,  confirmation: true

  def self.authenticate(email, password)
    if self.all.find_by_email(email) == self.all.find_by_password(password)
      return true
    else
      nil
    end
  end
end
