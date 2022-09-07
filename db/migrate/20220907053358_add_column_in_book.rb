class AddColumnInBook < ActiveRecord::Migration[6.1]
  def change
     add_column :books, :due_date, :datetime

  end
end
