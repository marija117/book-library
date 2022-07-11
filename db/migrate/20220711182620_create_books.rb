class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :number_of_hard_copies
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
