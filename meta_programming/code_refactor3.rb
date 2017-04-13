class Purchase < ActiveRecord::Base
  has_statuses :in_progress, :submitted, :approved, :shipped, :received, :canceled
end


# in lib/extensions/statuses.rb
class ActiveRecord::Base
  def self.has_statuses(*status_names)
    validates :status, presence: true, inclusion: { in: status_names }

    status_names.each do |status|
      scope "all_#{status}", where(status: status)
    end

    status_names.each do |status_name|
      define_method "in_#{status_name}?" do
        status == status_name
      end
    end
  end
end