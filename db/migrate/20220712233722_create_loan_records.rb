class CreateLoanRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :loan_records do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
