class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :auther_name
      t.datetime :issue_date
      t.datetime :return_date
      t.integer :number_of_pages
      t.text :description
      t.integer :user_id 
      t.timestamps
    end

  end
end
