class CreatePostPrefectures < ActiveRecord::Migration[6.0]
  def change
    create_table :post_prefectures do |t|
      t.references :post,       null: false, foreign_key: true
      t.references :prefecture, null: false, foreign_key: true
      t.timestamps
    end
  end
end
