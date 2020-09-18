class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
            #creates column called book_title as a string
            t.string "book_title", :null => false
            t.string "author"
            t.date "published_date"
            t.string "genre"
      
            t.timestamps
            # t.datetime "created_at"
            # t.datetime "updated_at"
    end
  end
end
