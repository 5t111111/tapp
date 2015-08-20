require 'singleton'
require 'forwardable'

module Tapp
  class Printer
    include Singleton
    extend Forwardable

    delegate [:print] => :@delegator

    attr_accessor :klasses

    def initialize
      @klasses = {}
    end

    def setup(delegator)
      @delegator = @klasses[delegator].instance
    rescue NoMethodError
      raise NotImplementedError
    end
  end
end
