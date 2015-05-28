class CurrentUser
  attr_reader :user

  def initialize(user)
     @user = user || Guest.new
  end

  def nav_bar
    if user.admin?
      "shared/admin_nav_bar"
    elsif user.is_a?(Guest)
      "shared/guest_nav_bar"
    else
      "shared/user"
    end
  end
end
