class NewAdd < ActiveRecord::Migration[6.1]
  def change
     create_table :roles do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_column :users, :role_id, :integer
    add_column :users, :name, :string
    add_column :users, :mobile_no, :integer
    add_column :users, :address, :text
  end
end
