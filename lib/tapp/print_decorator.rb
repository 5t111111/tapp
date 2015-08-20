require 'forwardable'

module Tapp
  class PrintDecorator
    include Singleton
    extend Forwardable

    delegate [:print] => :@delegator

    def register_delegator(delegator)
      @delegator = delegator
    end

    def print(*args)
      decoration = "~*" * 30
      puts decoration
      @delegator.print(*args)
      puts decoration
    end
  end
end
