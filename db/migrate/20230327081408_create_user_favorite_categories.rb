class CreateUserFavoriteCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :user_favorite_categories do |t|
      t.string :category, index: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
