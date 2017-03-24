class Address < ActiveRecord::Base
  belongs_to :customer
end
class Customer < ActiveRecord::Base
  has_one :address
  has_many :invoices

  delegate :street, :city, :state, :zipcode, to: :address
end
class Invoice < ActiveRecord::Base
  belongs_to :customer

  delegate :name, :street, :state, :zipcode, to: :customer, prefix: true
end

<%= @invoice.customer_name %>
<%= @invoice.customer_street %>
<%= @invoice.customer_city %>,
<%= @invoice.customer_state %>
<%= @invoice.customer_zip_code %>