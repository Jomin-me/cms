class Element < ActiveRecord::Base
  attr_accessible :name
  has_many :components
  has_many :specifications
end
