class Stage
  include Mongoid::Document
  include Mongoid::Versioning
  include Mongoid::Timestamps

  include Sortable
  sortable_by :designation => 'Designation'

  include Loadable

  key :designation

  field :designation
  field :title
  field :description
  field :image

  belongs_to :engine

  belongs_to :organization

  def name
    self.title || self.designation
  end

end
