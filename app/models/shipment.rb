class Shipment < ActiveRecord::Base
  has_many :history_records
  attr_accessible :mail_id

  validates :mail_id, :presence => true, :length => {:is => 14}, :numericality => true

  def get_history_records
    client = Savon.client(
      :endpoint => "http://voh.russianpost.ru:8080/niips-operationhistory-web/OperationHistory",
      :namespace => "http://russianpost.org/operationhistory/data"
    )
    response = client.call('OperationHistoryRequest', :message => {"wsdl:Barcode" => self.mail_id, "wsdl:MessageType" => 0, "wsdl:Language" => "RUS"})
    response.body[:operation_history_data][:history_record].each do |history_record_hash|
      operation_type = history_record_hash[:operation_parameters][:oper_type][:name]
      operation_date = history_record_hash[:operation_parameters][:oper_date]
      self.history_records.create(:operation_date => operation_date, :operation_type => operation_type)
    end
  end
end
