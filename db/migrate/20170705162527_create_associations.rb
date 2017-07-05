class CreateAssociations < ActiveRecord::Migration[5.1]
  def change
    create_table :associations do |t|
      t.integer :user_id
      t.integer :picture_id
      t.string :type, null: false, default: "upload"
      t.timestamps
    end

    create_table :pictures do |t|
      t.timestamps
    end

    create_table :tags do |t|
      t.integer :picture_id
      t.string :name
    end
  end
end
