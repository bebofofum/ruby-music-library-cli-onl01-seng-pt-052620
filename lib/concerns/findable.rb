module Concerns::Findable

  def find_by_name(name)
    self.all.detect {|object| object.name == name}
  end

  def find_or_create_by_name(name)
    entry = nil
    entry = self.find_by_name(name)
    if entry == nil
      self.create(name)
     else
      entry
    end
  end


end