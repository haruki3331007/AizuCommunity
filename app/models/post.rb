class Post < ApplicationRecord
    validates :title, presence: true
    
    belongs_to :user
    belongs_to :genre

    has_many :comments, dependent: :delete_all
    has_many :likes, dependent: :delete_all
    
    attachment :image
end
