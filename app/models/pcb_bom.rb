class PcbBom < ActiveRecord::Base
  attr_accessible :comp_id, :count, :info, :mark, :name
  has_many :components
end
