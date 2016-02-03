# Base object to every query_object. It defines additional scopes on models.
class QueryObject::Queries
  attr_reader :default_scopes

  class << self
    def scope(name, body, &block)
      @scopes ||= []
      @scopes << [name, body, block]
    end

    def scopes
      @scopes || []
    end
  end

  def initialize
    @scopes, @default_scopes = [], []
  end

  def scope(name, body, &block)
    @scopes << [name, body, block]
  end

  def scopes
    @scopes + self.class.scopes
  end

  def default_scope(scope)
    @default_scopes << scope
  end
end
