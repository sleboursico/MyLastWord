class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :prenom
      t.string :nom
      t.string :mail
      t.integer :user_id

      t.timestamps
    end

    create_table "contacts_messages", :id => false do |t|
      t.references :message, :contact
    end
  end
end
