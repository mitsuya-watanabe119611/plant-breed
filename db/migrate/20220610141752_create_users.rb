class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :seed_sen_id
      t.integer :seeding_sen_id
      t.integer :flower_sen_id

      t.timestamps
    end
  end
end
