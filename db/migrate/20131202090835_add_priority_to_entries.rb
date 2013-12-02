class AddPriorityToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :priority, :integer, default: 3
  end
end
