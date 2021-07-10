class CreateBankingSystems < ActiveRecord::Migration[6.1]
  def change
    create_table :banking_systems do |t|
      t.string :name
      t.string :email
      t.string :current_balance

      t.timestamps
    end
  end
end
