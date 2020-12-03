class CreateSearchWords < ActiveRecord::Migration[6.0]
  def change
    create_table :search_words do |t|
      t.string :word
      t.boolean :isSearched?

      t.timestamps
    end
  end
end
