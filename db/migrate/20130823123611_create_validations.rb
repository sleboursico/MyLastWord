class CreateValidations < ActiveRecord::Migration
  def change
    create_table :validations do |t|
      t.integer :user_id
      t.datetime :date
      t.integer :statut_cd
      t.string :token

      t.timestamps
    end
  end
end
