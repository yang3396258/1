class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :book
      t.references :cart

      t.timestamps
    end
  end
end
