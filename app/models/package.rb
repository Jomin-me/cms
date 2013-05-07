class Package < ActiveRecord::Base
  attr_accessible :name, :specification_id
  has_many :components
  belongs_to :specification
end
