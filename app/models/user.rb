class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => [:create]
  validates_presence_of :password_confirmation, :on => [:create]
  has_many :reviews, dependent: :destroy
  has_many :movies
  before_create :set_admin


  def full_name
    "#{firstname} #{lastname}"
  end

  def set_admin
  end

  
end



