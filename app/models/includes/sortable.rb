module Sortable

  module ClassMethods

    def sort_fields
      @sort_fields || self.fields.keys.delete_if{|k| ['_type', '_id', 'created_at', 'updated_at'].include?(k) }.map{|k| [k, k]}.to_hash
    end

    def sortable_by(fields)
      @sort_fields = fields
    end

  end

  def self.included(model)
    model.extend(ClassMethods)
  end  

end
