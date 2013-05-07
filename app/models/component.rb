class Component < ActiveRecord::Base
  attr_accessible :element_id, :info, :package_id, :price, :specification_id, :stock, :supplier
  belongs_to :element
  belongs_to :specification
  belongs_to :package
  belongs_to :pcb_bom
end
