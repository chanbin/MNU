class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.string :writer
      t.integer :like, default: "0"
      t.integer :hate, default: "0"
      t.integer :index, default: "0"
      t.integer :share, default: "0"

      t.timestamps null: false
    end
  end
end
