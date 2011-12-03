class Engine
  include Mongoid::Document
  include Mongoid::Versioning
  include Mongoid::Timestamps

  key :name

  field :name
  field :description

  field :sl_thrust_n, :type => Float
  field :vac_thrust_n, :type => Float

  belongs_to :fuel
  belongs_to :oxidizer

end
