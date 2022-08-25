class CreateRole < ActiveRecord::Migration[6.1]
  def change 
    create_table :roles do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_column :users, :role_id, :integer
  end
 
end
