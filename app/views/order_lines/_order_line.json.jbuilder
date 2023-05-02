json.extract! order_line, :id, :weapon_id, :count, :order_id, :created_at, :updated_at
json.url order_line_url(order_line, format: :json)
