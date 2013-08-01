class Entry < ActiveRecord::Base
  validates :content, :presence => true

  acts_as_taggable

  def self.search(params)
    params[:tag].present? ? Entry.tagged_with(params[:tag]) : Entry.all
  end

  def tag_names
    tag_list.join(',')
  end
end
