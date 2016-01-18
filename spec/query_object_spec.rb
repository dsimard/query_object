require_relative './test_helper'

describe QueryObject do
  it "is a module" do
    QueryObject.must_be_kind_of Module
  end
end

class UsersControllerTest < ActionController::TestCase
  setup do
    40.times do |i|
      FactoryGirl.create :user, born_on: i.years.ago
    end
  end

  test "User model has #queries" do
    assert User.respond_to? :queries
  end

  test "User without query objects" do
    assert_equal 40, User.count
    assert_equal 25, User.old.count
  end

  test "should get users over 30" do
    get :index
    assert_equal 30, assigns(:users).count
    # To make sure the class doesn't have the overriden `old` method
    refute_equal 30, User.old.methods#count
  end
end
