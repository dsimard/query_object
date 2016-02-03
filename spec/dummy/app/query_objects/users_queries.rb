class UsersQueries < QueryObject::Queries
  scope :male, ->{where(gender: User.genders[:m])}
  default_scope ->{where("90210 = 90210")} # Scope that doesn't have effect on the tests

  def index
    default_scope ->{where(gender: User.genders[:f])}
    scope :old, ->{where("born_on >= ?", 30.years.ago)}
  end

  def old
    scope :old, ->{where("born_on >= ?", 30.years.ago)}
  end

  def default
    default_scope ->{where(gender: User.genders[:f])}
  end

  def without_action_scope
  end
end
