class Entry < ActiveRecord::Base
  validates :content, :presence => true

  acts_as_taggable
end
