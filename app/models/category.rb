class Category < ApplicationRecord
  has_many :categories_weapons
  has_many :weapons, through: :categories_weapons

  validates :name, presence:true, uniqueness: true

  def to_s
    "#{name}"
  end
end
