module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect {|obj| obj.name == name}
    end
  
    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end
  end
  
  def alphabetized
    self.all.sort {|x, y| x.name <=> y.name}
  end
end