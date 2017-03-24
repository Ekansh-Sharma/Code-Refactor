class Address < ActiveRecord::Base
  belongs_to :customer
end
class Customer < ActiveRecord::Base
  has_one :address
  has_many :invoices
end
class Invoice < ActiveRecord::Base
  belongs_to :customer
end

<%= @invoice.customer.name %>
<%= @invoice.customer.address.street %>
<%= @invoice.customer.address.city %>,
<%= @invoice.customer.address.state %>
<%= @invoice.customer.address.zip_code %>