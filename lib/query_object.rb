module QueryObject
  require_relative "query_object/query_object"
end

ActiveRecord::Base.send :include, QueryObject::QueryObject
