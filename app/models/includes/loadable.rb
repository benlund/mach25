require 'yajl'
module Loadable

  module ClassMethods

    def load(file_name)
      Yajl::Parser.parse(File.read(file_name)).each do |attrs|

        obj = self.find_or_initialize_by(:designation => attrs[:designation])

        attrs.each do |key, value|
          metadata = self.reflect_on_association(key)
          if metadata
            puts "would set #{key} = #{value} when we support it"
          else
            obj[key] = value
          end
        end

        obj.save

      end
    end

  end

  def self.included(model)
    model.extend(ClassMethods)
  end

end
