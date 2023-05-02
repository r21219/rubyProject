class OrderLine < ApplicationRecord
  belongs_to :weapon
  belongs_to :order

  validates :count, presence:true ,numericality: { greater_than_or_equal_to: 1 }
  validates :weapon_id, presence: true

  after_create :update_order_total_price

  def update_order_total_price
    order.update(total_price: order.order_lines.sum('count * weapons.price'))
  end
end
