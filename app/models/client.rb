class Client < ApplicationRecord

  has_many :parents
  
  accepts_nested_attributes_for :parents, allow_destroy: true
  
end