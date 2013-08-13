class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :titre
      t.string :contenu
      t.integer :user_id

      t.timestamps
    end
  end
end
