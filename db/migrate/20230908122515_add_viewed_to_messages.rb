class AddViewedToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :viewed, :boolean, null: false, default: false
  end
end
