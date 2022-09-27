class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.belongs_to :user, index: true, foreign_key: true 
      t.date :date
      t.text :body

      t.timestamps
    end
  end
end
