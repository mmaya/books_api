class CreateBookCopies < ActiveRecord::Migration[6.1]
  def change
    create_table :book_copies, id: :uuid  do |t|
      t.belongs_to :book, null: false, foreign_key: true
      t.string :user_description
      t.boolean :new_copy
      t.float :price


      t.timestamps
    end
  end
end
