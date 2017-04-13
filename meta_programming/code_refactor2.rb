class Purchase < ActiveRecord::Base
  STATUSES = %w(in_progress submitted approved shipped received canceled)
  validates :status, presence: true, inclusion: { in: STATUSES }

  STATUSES.each do |status|
    scope "all_#{status}", where(status: status)
  end

  STATUSES.each do |status_name|
    define_method "in_#{status_name}?" do
      status == status_name
    end
  end
end

