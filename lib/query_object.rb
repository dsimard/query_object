module QueryObject
  require_relative "query_object/railtie/application_controller"
  require_relative "query_object/railtie/railtie"
  require_relative "query_object/query_object"
  require_relative "query_object/queries"
end

ActiveRecord::Base.send :include, QueryObject::QueryObject
