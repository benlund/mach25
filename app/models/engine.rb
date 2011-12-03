class Engine
  include Mongoid::Document
  include Mongoid::Versioning
  include Mongoid::Timestamps

  include Sortable
  sortable_by :name => 'Name', :sl_thrust_n => 'Thrust (Sea-level)', :vac_thrust_n  => 'Thrust (Vacuum)'

  key :name

  field :name
  field :title
  field :description

  field :sl_thrust_n, :type => Float
  field :vac_thrust_n, :type => Float

  belongs_to :fuel
  belongs_to :oxidizer

  belongs_to :organization

end
