class AddBibleNoteFieldsToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :book, :string
    add_column :entries, :chapter, :integer
    add_column :entries, :verse, :integer
  end
end
