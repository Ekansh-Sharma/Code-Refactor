class AccountsController < ApplicationController
  def create
    @account = Account.new(account_params)
    if @account.save
      flash[:notice] = 'Successfully Created.'
      redirect_to account_path(@account)
    else
      render :new
    end
  end
end

class Account < ActiveRecord::Base
  accepts_nested_attributes_for :users

  before_create :make_admin_user
  after_create :send_confirmation_mail

  private

  def make_admin_user
    self.users.first.admin = true
  end

  def send_confirmation_mail
    Mailer.deliver_confirmation(first_user)
  end
end