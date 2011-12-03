module Nameable

  def name
    if !self.title.blank?
      self.title
    else
      self.designation
    end
  end

end
