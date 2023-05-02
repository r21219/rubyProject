class Weapon < ApplicationRecord
  has_one_attached :image

  has_many :categories_weapons
  has_many :categories, through: :categories_weapons

  scope :priced_above, ->(price) { where('price > ?', price) }

  validates :name, presence:true
  validates :price, presence:true ,numericality: { greater_than_or_equal_to: 50 }
  validates :description, length: {minimum:0, maximum:100}

  def to_s
    "#{name}"
  end
end
