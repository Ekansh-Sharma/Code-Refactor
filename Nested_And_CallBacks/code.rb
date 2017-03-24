class Account < ActiveRecord::Base
  def create_account!(account_params, user_params)
    transaction do
      account = Account.create!(account_params)
      first_user = User.new(user_params)
      first_user.admin = true
      first_user.save!
      self.users << first_user
      account.save!
      Mailer.deliver_confirmation(first_user)
      account
    end
  end
end