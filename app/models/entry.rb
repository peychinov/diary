class Entry < ActiveRecord::Base
  validates :content, :presence => true

  default_scope { order('created_at DESC') }

  acts_as_taggable

  def self.search(params)
    params[:tag].present? ? Entry.tagged_with(params[:tag]) : Entry.all
  end

  def tag_names
    tag_list.join(',')
  end

  def self.priority_options
    1..5
  end

  def self.priority_options_for_select
    priority_options.map{ |p| [p,p] }
  end

end
