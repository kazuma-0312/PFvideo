class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  with_options presence: true do
    validates :title
    validates :youtube_url
    validates :text
  end
end
