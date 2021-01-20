class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :tweet, optional: true

  validates :text, presence: true
end
