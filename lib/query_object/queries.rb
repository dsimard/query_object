class QueryObject::Queries
  attr_reader :scopes

  def scope(name, body, &block)
    @scopes ||= []
    @scopes << [name, body, block]
  end
end
