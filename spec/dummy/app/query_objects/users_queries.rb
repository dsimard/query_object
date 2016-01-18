class UsersQueries
  def index
    scope :old ->{where("born_on >= ?", 30.years.ago)}
  end
end
