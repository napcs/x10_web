class Unit < ActiveRecord::Base
  # name   :string
  # code   :string
  
  validates_presence_of :name, :code
  
  acts_as_x10_module
  
  
end
