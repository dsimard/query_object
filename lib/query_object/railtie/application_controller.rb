require 'request_store'

module QueryObject::ApplicationController
  extend ActiveSupport::Concern

  included do
    # Keep controller and action name in the thread
    before_action do |controller|
      RequestStore.store[:query_object_controller_class_name] ||= controller.class.to_s
      RequestStore.store[:query_object_action_name] ||= controller.action_name
    end
  end
end
