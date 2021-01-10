class Tweet < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :youtube_url
    validates :text
  end
end
