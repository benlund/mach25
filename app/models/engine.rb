class Engine
  include Mongoid::Document
  include Mongoid::Versioning
  include Mongoid::Timestamps

  include Sortable
  sortable_by :designation => 'Designation', :sl_thrust_n => 'Thrust (Sea-level)', :vac_thrust_n  => 'Thrust (Vacuum)'

  include Loadable

  include Nameable

  key :designation

  field :designation
  field :title
  field :description
  field :image

  field :sl_thrust_n, :type => Float
  field :vac_thrust_n, :type => Float

  belongs_to :fuel
  belongs_to :oxidizer

  belongs_to :organization

end
