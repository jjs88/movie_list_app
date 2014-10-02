class CreateTaggings < ActiveRecord::Migration
  def change
  	drop_table :taggings
    create_table :taggings do |t|
      t.references :tag, index: true
      t.references :movie, index: true

      t.timestamps
    end
  end
end
