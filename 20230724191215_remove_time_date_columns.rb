class RemoveTimeDateColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :time
    remove_column :events, :date
  end
end
