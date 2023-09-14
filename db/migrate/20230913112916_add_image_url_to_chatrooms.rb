class AddImageUrlToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :image_url, :string
  end
end
