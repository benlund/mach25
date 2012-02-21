class Stage
  include Mongoid::Document
  include Mongoid::Versioning
  include Mongoid::Timestamps

  include Sortable
  sortable_by :designation => 'Designation'

  include Loadable

  include Nameable

  key :designation

  field :designation
  field :title
  field :description
  field :image

  belongs_to :engine
  has_and_belongs_to_many :rocket

  belongs_to :organization

end
