class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :pid
      t.text :comment
      t.string :writer
      t.integer :like, default: "0"
      t.integer :hate, default: "0"
      
      t.timestamps null: false
    end
  end
end
