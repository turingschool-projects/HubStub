class Image < ActiveRecord::Base
  has_many :events

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :image_url, presence: true
end
