class QueryObject::Queries
  attr_reader :scopes, :default_scopes

  def initialize
    @scopes, @default_scopes = [], []
  end

  def scope(name, body, &block)
    @scopes << [name, body, block]
  end

  def default_scope(scope)
    @default_scopes << scope
  end
end
