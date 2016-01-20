module QueryObject
  extend ActiveSupport::Concern

  module ClassMethods
    def queries
      duplicate = self.dup

      duplicate.define_singleton_method :old do
        where("born_on >= ?", 30.years.ago)
      end

      duplicate
    end
  end

  ActiveRecord::Base.send :include, QueryObject
end
