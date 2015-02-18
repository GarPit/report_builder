class HistoryRecord < ActiveRecord::Base
  belongs_to :shipment
  attr_accessible :operation_date, :operation_type
end
