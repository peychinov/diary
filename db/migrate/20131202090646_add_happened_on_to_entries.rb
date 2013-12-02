class AddHappenedOnToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :happened_on, :date
  end
end
