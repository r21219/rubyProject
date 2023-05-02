class Order < ApplicationRecord
  belongs_to :user
  has_many :order_lines

  before_save :calculate_total_price

  scope :total_cost_by_user, -> {
    select('*, SUM(orders.total_price) AS total_cost')
    .joins(:user)
    .group('users.id')
  }
  enum status: { new: 0, processing: 1, shipped: 2, delivered: 3 }, _prefix: true

  private

  def calculate_total_price
    total_price = 0
    order_lines.each do |order_line|
      total_price += order_line.count * order_line.weapon.price
    end
    self.total_price = total_price
  end
  def to_s
    "#{id}"
  end
end
