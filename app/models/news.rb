class News < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
    attachment :image
end
