class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes

  with_options presence: true do
    validates :title
    validates :youtube_url
    validates :text
  end
end
