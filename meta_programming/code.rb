class Purchase < ActiveRecord::Base
  validates_presence_of :status
  validates_inclusion_of :status, :in => %w(in_progress submitted approved shipped received canceled)

  def self.all_in_progress
    where(:status => "in_progress")
  end

  def self.all_submitted
    where(:status => "submitted")
  end

  def self.all_approved
    where(:status => "approved")
  end

  def self.all_shipped
    where(:status => "shipped")
  end

  def self.all_received
    where(:status => "received")
  end

  def self.all_canceled
    where(:status => "canceled")
  end

  def in_progress?
    status == "in_progress"
  end

  def submitted?
    status == "submitted"
  end

  def approved?
    status == "approved"
  end

  def shipped?
    status == "shipped"
  end

  def received?
    status == "received"
  end

  def canceled?
    status == "canceled"
  end
end