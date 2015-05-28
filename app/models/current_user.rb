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
      "shared/nil"
    else
      "shared/submit_order"
    end
  end

  def checkout
    if user.is_a?(Guest)
      "cart_items/guest_checkout"
    else
      "cart_items/user_checkout"
    end
  end

  def add_to_cart_button
    if user.admin?
      "shared/nil"
    else
      "items/add_to_cart"
    end
  end

  def event_add_to_cart(slug)
    if user.slug == slug || user.admin?
      "shared/nil"
    else
      "events/add_to_cart"
    end
  end
end
