class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :photo
      t.string :last_contact_date
      t.string :sex
      t.string :dob
      t.string :complexion
      t.text :description

      t.timestamps
    end
  end
end
