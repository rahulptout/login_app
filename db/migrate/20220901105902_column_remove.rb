class ColumnRemove < ActiveRecord::Migration[6.1]
  def change
    change_column(:books, :issue_date, :date)
    change_column(:books, :return_date, :date)
  end
end
