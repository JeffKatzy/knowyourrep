class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :content
      t.integer :user_id
      t.integer :politician_id

      t.timestamps
    end
  end
end