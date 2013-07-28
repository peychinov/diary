class Entry < ActiveRecord::Base
  validates :content, :presence => true

  acts_as_taggable

  include Tire::Model::Search
  include Tire::Model::Callbacks

  mapping do
    indexes :tag_names
    indexes :content
  end

  def self.search(params)
    per_page = params[:per_page] || 5

    tire.search(load: true, per_page: per_page, page: params[:page] || 1) do
      query do
        boolean do
          must { term :tag_names, params[:tag] } if params[:tag].present?
        end
      end
      sort { by :created_at, 'desc' } if params[:keywords].blank?
    end
  end

  def to_indexed_json
    to_json(methods: [:tag_names])
  end

  def tag_names
    tag_list.join(',')
  end
end
