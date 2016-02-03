require_relative './test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    40.times do |i|
      FactoryGirl.create :user, born_on: i.years.ago
    end
  end

  test "should return different count when using `queries`" do
    get :index
    users = assigns :users
    q_users = assigns :query_users

    assert_equal 25, users.count
    assert_equal 15, q_users.count
  end
end
