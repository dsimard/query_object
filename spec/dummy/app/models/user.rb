class User < ActiveRecord::Base
  scope :old, ->{where("born_on >= ?", 25.years.ago)}
end
