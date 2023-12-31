class Contact < ApplicationRecord
        validates :name, presence: true
        validates :email, presence: true
        validates :genre, presence: true
        validates :title, presence: true
        validates :body, presence: true

    def genre_name

        case self.genre
        when 1
            "ユーザ登録について"
        when 2
            "投稿について"
        when 3
            'サイトについて'
        when 4
            '管理人について'
        when 5
            'その他'
        end
    end
end
