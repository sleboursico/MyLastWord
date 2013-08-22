class AddFrequenceDateDerniereValidationToUser < ActiveRecord::Migration
  def change
    add_column :users, :frequence_cd, :integer
    add_column :users, :dateDerniereValidation, :date
  end
end
