require 'request_store'

module QueryObject::QueryObject
  extend ActiveSupport::Concern

  module ClassMethods
    def queries
      duplicate = self.dup

      duplicate.class_eval do |klass|
        # Find the class according to the convention
        controller_class_name = RequestStore.store[:query_object_controller_class_name]
        action_name = RequestStore.store[:query_object_action_name]

        if controller_class_name && action_name
          controller_prefix = controller_class_name.gsub /Controller$/, ""

          p Rails::Application::UsersQueries
          
          # Check if the query object has the same method than the current action
          if query_object.respond_to? action_name
            u.send action_name

            u.scopes.each do |args|
              klass.scope args[0], ->{klass.instance_exec(&args[1])}, &args[3]
            end
          end
        end
      end

      duplicate
    end
  end
end
