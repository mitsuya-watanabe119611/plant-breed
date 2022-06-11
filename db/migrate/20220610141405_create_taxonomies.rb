class CreateTaxonomies < ActiveRecord::Migration[5.2]
  def change
    create_table :taxonomies do |t|
      t.string :type
      t.text :sentence
      t.integer :sentence_id

      t.timestamps
    end
  end
end
