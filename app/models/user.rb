class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable


  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true

  belongs_to :store_configuration

end
