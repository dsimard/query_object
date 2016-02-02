module QueryObject::ApplicationController
  extend ActiveSupport::Concern

  included do
    # Keep controller and action name in the thread
    before_action do |controller|
      QueryObject::Context.new controller
    end
  end
end
