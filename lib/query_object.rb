module QueryObject
  require_relative "query_object/railtie/application_controller"
  require_relative "query_object/railtie/railtie"
  require_relative "query_object/query_object"
  require_relative "query_object/queries"
  require_relative "query_object/context"
end

ActiveRecord::Base.send :include, QueryObject::QueryObject
