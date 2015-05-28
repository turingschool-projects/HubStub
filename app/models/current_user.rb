class CurrentUser
  attr_reader :user

  def initialize(user)
     @user = user || Guest.new
  end

  def admin?
    user.admin?
  end

  def slug
    user.slug
  end

  def nav_bar
    if user.admin?
      "shared/admin_nav_bar"
    elsif user.is_a?(Guest)
      "shared/guest_nav_bar"
    else
      "shared/user_nav_bar"
    end
  end

  def order_button
    if user.is_a?(Guest)
      "orders/nil_order"
    else
      "shared/submit_order"
    end
  end
end
