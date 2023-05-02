class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :current_order

  def current_order
    if user_signed_in?
      @current_order ||= Order.find_or_create_by(user: current_user, status: :new)
    end
  end
end
