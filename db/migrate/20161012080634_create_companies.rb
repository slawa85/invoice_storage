class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :number, limit: 8

      t.timestamps null: false
    end
  end
end
