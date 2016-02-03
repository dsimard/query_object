require_relative './test_helper'
require 'request_store'

describe QueryObject do
  before(:each) do
    40.times do |i|
      FactoryGirl.create :user, born_on: i.years.ago
    end
  end

  def force_context(controller_class_name, action_name)
    RequestStore.store[:query_object_controller_class_name] = controller_class_name
    RequestStore.store[:query_object_action_name] = action_name
  end

  let(:query) {User.queries}

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

  describe "override `old` scope" do
    before(:each) do
      force_context "UsersController", "old"
    end

    it "changes the `old` scope only" do
      query.old.count.must_equal 30
    end
  end

  describe "add default scope" do
    before(:each) {force_context "UsersController", "default"}

    it "should return gender f only" do
      query.count.must_equal 20
    end
  end

  describe "with #queries" do
    before(:each) do
      force_context "UsersController", "index"
    end

    it "should change default scope" do
      query.count.must_equal 20
    end

    it "should change filter" do
      User.old.count.must_equal 25
      query.old.count.must_equal 15
    end
  end
end
