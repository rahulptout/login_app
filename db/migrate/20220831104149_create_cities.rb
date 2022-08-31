class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
         t.string :city_name, null: false ,default: "" 
      t.timestamps
    end

     add_column :users, :city_id, :integer
  end
end
