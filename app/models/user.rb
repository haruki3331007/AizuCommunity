class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  has_many :posts, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all

  validates :name, presence: true
  validates :user_name, uniqueness: true, presence: true
  validates :location, presence: true
  validates :email, uniqueness: true, presence: true

  attachment :image

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