class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  #validates_presence_of :name
	validates_uniqueness_of :name, :email, :case_sensitive => false

  has_many :clothing
end
