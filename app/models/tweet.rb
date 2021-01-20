class Tweet < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, foreign_key: :tweet_id, dependent: :destroy
  has_many :likes, foreign_key: :tweet_id, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :youtube_url
    validates :text
  end

  def self.search(search)
    if search != ''
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end
