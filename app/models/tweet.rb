class Tweet < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :title
    validates :youtube_url
    validates :text
  end
end
