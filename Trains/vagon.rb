require_relative 'instance_counter'
require_relative 'manufacture_company'

class Vagon 
include ManufactureCompany
include InstanceCounter

  @@vagons = []

  def self.all
    @@vagons 
  end 

  def initialize 
    @@vagons << self
    register_instance
  end

end