class AddContentToPost < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :content, :text, null: false
  end
end
