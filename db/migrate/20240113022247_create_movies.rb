class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :overview
      t.string :poster_url
      t.float :rating
      t.references :list_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
