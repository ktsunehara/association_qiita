class CreateRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :relations do |t|
      t.integer :following_id
      t.integer :follower_id

      t.timestamps
    end
  end
end
