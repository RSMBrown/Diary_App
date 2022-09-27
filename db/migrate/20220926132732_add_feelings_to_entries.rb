class AddFeelingsToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :feeling, :integer, default: 0
  end
end
