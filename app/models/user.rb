class User < ActiveRecord::Base
  # attr_accessor :email, :password, :password_confirmation, :current_password, :remember_me, :profile_image
  has_many :customers, dependent: :destroy
  attachment :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
