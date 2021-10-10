class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.bigint :owner_id
      t.string :title, null:false
      t.text :homepage_url, null:false
      t.text :message, null:false

      t.timestamps
    end

    add_index :posts, :owner_id
  end
end
