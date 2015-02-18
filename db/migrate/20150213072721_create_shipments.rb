class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.string :mail_id

      t.timestamps
    end
  end
end
