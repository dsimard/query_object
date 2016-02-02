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
    assert_equal 30, q_users.count
  end
end

require 'request_store'
describe QueryObject do
  before(:each) do
    # Force a context
    RequestStore.store[:query_object_controller_class_name] = "UsersController"
    RequestStore.store[:query_object_action_name] = "index"

    40.times do |i|
      FactoryGirl.create :user, born_on: i.years.ago
    end
  end

  it "is a module" do
    QueryObject.must_be_kind_of Module
  end

  it "has #queries" do
    User.must_respond_to :queries
  end

  it "has count" do
    User.count.must_equal 40
    User.old.count.must_equal 25
  end

  describe "with #queries" do
    let(:user_with_q){User.queries}

    it "should change filter" do
      User.old.count.must_equal 25

      user_with_q.count.must_equal 40
      user_with_q.old.count.must_equal 30
    end
  end
end
