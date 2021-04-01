class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :subtitle
      t.string :page_count
      t.string :publisher
      t.string :edition
      t.string :published_date
      t.string :language
      t.string :description
      t.string :info_url
      t.string :average_rating
      t.jsonb :authors
      t.string :isbn

      t.timestamps
    end
  end
end
