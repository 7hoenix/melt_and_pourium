class Category < ActiveRecord::Base
  has_many :items, dependent: :destroy
  validates :name, presence: true,
    length: { in: 3..30 }
end
