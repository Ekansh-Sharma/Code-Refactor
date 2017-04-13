class Purchase < ActiveRecord::Base
  STATUSES = %w(in_progress submitted approved shipped received canceled)
  validates_presence_of :status
  validates_inclusion_of :status, in: STATUSES

  class << self
    STATUSES.each do |status|
      define_method "all_#{status}" do
        where(status: status)
      end
    end
  end

  STATUSES.each do |status_name|
    define_method "in_#{status_name}?" do
      status == status_name
    end
  end
end