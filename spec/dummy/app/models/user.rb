class User < ActiveRecord::Base
  scope :old, ->{where("born_on >= ?", 25.years.ago)}

  enum genders:[:m, :f]
end
