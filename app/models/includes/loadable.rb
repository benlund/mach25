require 'yajl'
module Loadable

  module ClassMethods

    def load(file_name)
      Yajl::Parser.parse(File.read(file_name)).each do |attrs|

        obj = self.find_or_initialize_by(:designation => attrs[:designation])

        attrs.each do |key, value|
          metadata = self.reflect_on_association(key)
          if metadata
            klass = metadata.class_name.constantize
            rel = klass.find_or_create_by(:designation => value)
            obj.send(metadata.setter, rel)
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
