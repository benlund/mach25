class Oxidizer
  include Mongoid::Document
  include Mongoid::Versioning
  include Mongoid::Timestamps

  include Loadable

  include Nameable

  key :designation

  field :designation
  field :title

  has_many :engines

end
