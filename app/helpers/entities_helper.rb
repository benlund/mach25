module EntitiesHelper

  def entity_type
    self.controller.class.instance_variable_get('@entity_type')
  end

  def entity_class
    entity_type.camelize.constantize
  end

  def entity_name
    entity_type.humanize.downcase
  end

  def entity_title
    entity_type.titleize
  end

end
