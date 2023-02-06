class CreatePostPrefectures < ActiveRecord::Migration[6.0]
  def change
    create_table :post_prefectures do |t|

      t.timestamps
    end
  end
end
