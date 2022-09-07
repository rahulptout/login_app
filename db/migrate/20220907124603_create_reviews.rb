class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
         t.integer :book_id, null:false
         t.string :user_name
         t.string :review, null: false
         
      t.timestamps
    end


  end
end
