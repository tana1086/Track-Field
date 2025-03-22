class Post < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :likes, dependent: :destroy

    validates :title, presence: true
    validates :content, presence: true


    def like?(user)
        likes.where(user_id: user.id).exists?
    end
end
