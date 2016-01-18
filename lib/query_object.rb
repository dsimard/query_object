module QueryObject
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    def queries
      self.singleton_class.class_eval do
        define_method :old do
          where "born_on >= ?", 30.years.ago
        end
      end
      self
    end
  end

  ActiveRecord::Base.send :include, QueryObject
end
