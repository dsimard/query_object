require 'request_store'

# The context of the request
class QueryObject::Context
  def initialize(controller=nil)
    return unless controller

    RequestStore.store[:query_object_controller_class_name] ||= controller.class.to_s
    RequestStore.store[:query_object_action_name] ||= controller.action_name
  end

  def controller_class_name
    RequestStore.store[:query_object_controller_class_name]
  end

  def action_name
    RequestStore.store[:query_object_action_name]
  end

  # Remove the prefix of the controller
  def controller_prefix
    controller_class_name.gsub /Controller$/, ""
  end

  def query_object_class
    @query_object_class ||= Kernel.const_get "QueryObject::#{controller_prefix}Queries" rescue nil
  end

  def valid?
    controller_class_name && action_name && query_object_class
  end
end
