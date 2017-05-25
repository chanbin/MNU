class AddImageToUser < ActiveRecord::Migration
  def change
    add_column :user, :image, :string
  end
end
