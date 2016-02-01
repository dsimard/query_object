module QueryObject
  class Railtie < Rails::Railtie
    initializer "query_object.action_controller" do |app|
      ActiveSupport.on_load :action_controller do
        include ApplicationController
      end
    end
  end
end
