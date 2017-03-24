class Account < ActiveRecord::Base
  accepts_nested_attributes_for :users

  before_create :make_admin
  after_create :deliver_mail

  private

  def make_admin
    self.users.first.admin = true
  end
  def deliver_mail
    Mailer.deliver_confirmation(first_user)
  end
end

class AccountsController < ApplicationController
  def create
    #use fields_for in form
    @account = Account.new(params[:account])
    if @account.save
      redirect_to account_url(@account)
    else
      render :new
    end
  end
end