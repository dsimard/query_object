class UsersQueries < QueryObject::Queries
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
end
