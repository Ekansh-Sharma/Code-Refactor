class Order < ActiveRecord::Base
  delegate :to_xml, :to_json, :to_csv, :to_pdf, to: :converter
  extend OrderStateFinder
  extend OrderSearcher

  def converter
    OrderConverter.new(self)
  end
end

module OrderStateFinder
  def find_purchased
  # ...
  end
  def find_waiting_for_review
  # ...
  end
  def find_waiting_for_sign_off
  # ...
  end
  def find_waiting_for_sign_off
  # ...
  end
end

module OrderSearcher
  def advanced_search(fields, options = {})
  # ...
  end
  def simple_search(terms)
  # ...
  end
end

class OrderConverter
  attr_accessor :order

  def initialize(order)
    @order = order
  end
  def to_xml
  # ...
  end
  def to_json
  # ...
  end
  def to_csv
  # ...
  end
  def to_pdf
  # ...
  end
end