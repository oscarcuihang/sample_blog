class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.string :title
      t.text :content
      t.boolean :published, null: false, default: false
      t.integer :view_count, null: false, default: 0
      t.date :published_date, default: nil
      t.timestamps
    end
  end
end
