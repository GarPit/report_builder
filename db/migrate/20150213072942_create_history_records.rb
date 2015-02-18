class CreateHistoryRecords < ActiveRecord::Migration
  def change
    create_table :history_records do |t|
      t.belongs_to :shipment
      t.date :operation_date
      t.string :operation_type

      t.timestamps
    end
    add_index :history_records, :shipment_id
  end
end
