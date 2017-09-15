class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :missing_from
      t.date :date_missing
      t.string :sex
      t.string :ethnicity
      t.date :dob
      t.integer :height
      t.integer :weight
      t.string :eyes
      t.string :hair
      t.text :other
      t.string :photo
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
