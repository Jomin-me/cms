class Specification < ActiveRecord::Base
  attr_accessible :element_id, :name
  has_many :components
  has_many :packages
  belongs_to :element
end
