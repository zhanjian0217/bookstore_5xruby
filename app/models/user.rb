class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  # validates
  validates :username, length: { maximum: 20 }
  validates :email, presence: true
    

  #relationship
  has_many :coupons       
         
  def admin?
    self.role == "admin"
  end

  def admin!
    self.update(role: "admin")
  end
end
