class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts
  has_many :comments
  has_many :likes

  def location_name
    case self.location
    when 1
      "会津若松市内"
    when 2
      "会津若松市外（福島県内）"
    else
      '会津若松市外（福島県外）'
    end
  end

end