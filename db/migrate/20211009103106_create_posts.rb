class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.bigint :owner_id
      t.string :title
      t.text :homepage_url
      t.text :message

      t.timestamps
    end
  end
end
