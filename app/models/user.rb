class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  after_create :set_admin_to_false


  def full_name
    "#{firstname} #{lastname}"
  end

  private

  def set_admin_to_false
    admin = false unless admin 
  end
  
end
