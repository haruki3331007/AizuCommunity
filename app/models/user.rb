class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all

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