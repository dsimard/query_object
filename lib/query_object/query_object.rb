require 'request_store'

module QueryObject::QueryObject
  extend ActiveSupport::Concern

  module ClassMethods
    def queries
      duplicate = self.dup

      duplicate.class_eval do |klass|
        # Find the class according to the convention
        context = QueryObject::Context.new

        if context.valid?
          query_object = context.query_object_class.new

          # Check if the query object has the same method than the current action
          if query_object.respond_to? context.action_name
            query_object.send context.action_name

            # Apply default scopes
            query_object.default_scopes.each do |args|
              klass.default_scope ->{klass.instance_exec(&args)}
            end

            # Apply scopes
            query_object.scopes.each do |args|
              klass.scope args[0], ->{klass.instance_exec(&args[1])}, &args[3]
            end
          end
        end
      end

      duplicate
    end
  end
end
