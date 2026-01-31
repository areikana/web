class Cook < ApplicationRecord
  belongs_to :user, optional: true

  validates :health, presence: true, inclusion: { in: ["元気","疲れ気味","ストレスあり","食欲低下"] }
  validates :food, presence: true, length: { maximum: 255 }
  validates :food_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp
end