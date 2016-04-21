class CreatePollFields < ActiveRecord::Migration
  def change
    create_table :poll_fields do |t|
      t.references :field, polymorphic: true, index: true
      t.string :name
      t.string :label
      t.string :label_side
      t.boolean :label_visible
      t.decimal :width
      t.decimal :height
      t.string :class_name

      t.timestamps null: false
    end
  end
end
