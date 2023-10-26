class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def town_name
    case self.location
      when 1
          "会津若松市内"
      when 2
          "会津若松市外（福島県内）"
      when 3
          "会津若松市外（福島県外）"
    end
  end

end