class CategoriesWeapon < ApplicationRecord
  belongs_to :category
  belongs_to :weapon

end
