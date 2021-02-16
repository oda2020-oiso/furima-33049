class CreateDistributions < ActiveRecord::Migration[6.0]
  def change
    create_table :distributions do |t|

      t.string  :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.

      t.timestamps
    end
  end
end
