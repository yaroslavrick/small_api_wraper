class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :activity
      t.string :activity_type
      t.integer :participants
      t.float :price
      t.string :link
      t.string :key
      t.float :accessibility

      t.timestamps
    end
  end
end
