# Base object to every query_object. It defines additional scopes on models.
class QueryObject::Queries
  class << self
    def scope(name, body, &block)
      @scopes ||= []
      @scopes << [name, body, block]
    end

    def scopes
      @scopes || []
    end

    def default_scope(scope)
      @default_scopes ||= []
      @default_scopes << scope
    end

    def default_scopes
      @default_scopes || []
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

  def default_scopes
    @default_scopes + self.class.default_scopes
  end
end
