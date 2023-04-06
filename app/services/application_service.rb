require 'dry/monads'
require 'dry-initializer'

class ApplicationService
  extend  Dry::Initializer
  include Dry::Monads[:result, :do]

  def self.call(*args, &block)
    new(*args, &block).call
  end
end