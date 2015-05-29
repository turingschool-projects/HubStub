class UserEmailWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find_by(id: user.id)
    UserMailer.account_activation(user).deliver_now
  end

end
