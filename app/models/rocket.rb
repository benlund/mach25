class Rocket
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

  has_many :stages

  belongs_to :organization

end
