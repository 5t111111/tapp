require 'singleton'
require 'forwardable'

module Tapp
  class Printer
    include Singleton
    extend Forwardable

    delegate [:print] => :@delegator

    attr_accessor :klasses
    attr_accessor :decorated

    def initialize
      @klasses = {}
      @decorated = false
    end

    def setup(printer)
      if Tapp.config.decoration
        Tapp::Decorator.instance.setup(@klasses[printer].instance)
        @delegator = Tapp::Decorator.instance
      else
        @delegator = @klasses[printer].instance
      end
      self
    rescue NoMethodError
      raise NotImplementedError
    end
  end
end
